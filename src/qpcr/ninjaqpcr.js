/*
  Ninja-qPCR core module
  */

"use strict";

const Constants = require("./constants");
const fs = require('fs');

// const ThermalCycler = require("./control/thermal_cycler");
const ThermalCycler = require("./control/thermal_cycler_multi");
const Optics = require("./control/optics");
const OpticsAnalysis = require("./optics_analysis");

const experimentManager = require("./experiment_manager");

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;


const DEVICE_STATE = {
  IDLE: { label:"idle", hasExperiment:false, startAvailable:true, resumeAvailable:false, pauseAvailable:false, abortAvailable:false, finishAvailable:false },
  RUNNING: { label:"running", hasExperiment:true, startAvailable:false, resumeAvailable:false, pauseAvailable:true, abortAvailable:true, finishAvailable:false },
  PAUSED: { label:"paused", hasExperiment:true, startAvailable:false, resumeAvailable:true, pauseAvailable:false, abortAvailable:true, finishAvailable:false },
  AUTO_PAUSED: { label:"auto_paused", hasExperiment:true, startAvailable:false, resumeAvailable:true, pauseAvailable:false, abortAvailable:true, finishAvailable:false },
  COMPLETE: { label:"complete", hasExperiment:true, startAvailable:false, resumeAvailable:false, pauseAvailable:false, abortAvailable:true, finishAvailable:true }
};

/* QPCR Interface */
class NinjaQPCR {
  constructor (confFileName) {
    const confPath = __dirname + "/conf/" + confFileName;
    const conf = JSON.parse(fs.readFileSync(confPath).toString());
    this.config = conf;
    const boardConfFile = __dirname + "/conf/" + conf.hardware_conf;
    console.log(boardConfFile)
    const boardConf = require(boardConfFile);
    
    this.thermalCycler = new ThermalCycler(boardConf.getPlate(), boardConf.getHeatLids());
    this.thermalCycler.setEventReceiver(this);
    this.optics = new Optics(boardConf.getLEDUnit(), boardConf.getFluorescenceSensingUnit(), boardConf.wellsCount(), boardConf.opticsChannelsCount());
    this.deviceState = DEVICE_STATE.IDLE;
    this.progress = null;
    this.analysis = null;
  }
  hardwareConfig () {
    let conf = JSON.parse(JSON.stringify(this.config));
    delete conf.hardware_conf;
    return conf;
  }
  /* API */
  
  /* Event handler registration */
  setEventReceiver (receiver) {
    this.receiver = receiver;
    /*
      onThermalTransition(transition)
      
      onProgress(data)
      
      onStart(data)
      
      onComplete(data)
      
      onDeviceStateChange(data)
      
      onFluorescenceDataUpdate(data)
      
      onFluorescenceEvent (data)
      
      onError(error)
    */
  }
  
  /* Experiment Control */
  start (experiment) {
    if (!this.deviceState.startAvailable) {
      console.warn("Unable to start experiment. An experiment is pauseAvailable. deviceState=%s", this.deviceState.label);
      return false;
    }
    this.experimentLog = experiment;
    this.experimentLog["hardware"] = this.hardwareConfig();
    this.experimentConf = experiment.config;
    this._setDeviceState(DEVICE_STATE.RUNNING);
    this.protocol = experiment.protocol;
    this.startTimestamp = new Date();
    this.thermalCycler.start(this.protocol);
    this.optics.start();
    this.onStart();
    this.analysis = new OpticsAnalysis(this.experimentLog);
    this.isMeasuringFluorescenceContinuously = false;
    return true;
  }
  pause () {
    if (!this.deviceState.pauseAvailable) {
      console.warn("Unable to start experiment. An experiment is pauseAvailable. deviceState=%s", this.deviceState.label);
      return false;
    }
    this.thermalCycler.pause();
    this.optics.pause();
    this.experimentLog.status.status = "paused";
    experimentManager.update(this.experimentLog, null, null);
    this._setDeviceState(DEVICE_STATE.PAUSED);
  }
  resume () {
    if (!this.deviceState.resumeAvailable) {
      console.warn("Unable to start experiment. An experiment is pauseAvailable. deviceState=%s", this.deviceState.label);
      return false;
    }
    this.thermalCycler.resume();
    this.optics.resume();
    this.experimentLog.status.status = "running";
    experimentManager.update(this.experimentLog, null, null);
    this._setDeviceState(DEVICE_STATE.RUNNING);
  }
  finishAutoPause () {
    this.thermalCycler.finishAutoPause();
  }
  abort () {
    if (!this.deviceState.abortAvailable) {
      console.warn("Unable to start experiment. Device is idle. deviceState=%s", this.deviceState.label);
      return false;
    }
    this.thermalCycler.abort();
    this.optics.abort();
    
    this.experimentLog.status.status = "aborted";
    this.experimentLog.status.end = new Date().getTime();
    experimentManager.update(this.experimentLog, null, null);
    this._setDeviceState(DEVICE_STATE.IDLE);
  }
  finish () {
    if (!this.deviceState.abortAvailable) {
      console.warn("Unable to finish. Experiment is not finishAvailable. deviceState=%s", this.deviceState.finishAvailable);
      return false;
    }
    this.thermalCycler.finish();
    this.optics.finish();
    this._setDeviceState(DEVICE_STATE.IDLE);
  }
  
  /* Geters */
  getProtocol () {
    return this.protocol || {};
  }
  getExperimentConf () {
    return this.experimentConf || {};
  }
  getDeviceState () {
    return this.deviceState;
  }
  getExperimentStatus () {
    if (!this.deviceState.hasExperiment) {
      
      return {};
    }
    const status = {
      thermalCycler: this.thermalCycler.getStatus(),
      fluorescence: this.optics.getStatus()
    };
    return status;
  }
  getThermalCyclerStatus () {
    return this.thermalCycler.getStatus();
  }
  getFluorescenceLogs () {
    return this.optics.getStatus();
  }
  getExperimentElapsedTime () {
    return new Date().getTime() - this.startTimestamp.getTime();
  }
  getMeltCurve () {
    console.log("getMeltCurve");
    // return DUMMY_MELT_CURVE; //Dummy
    if (this.analysis == null) {
      return [];
    }
    this.analysis.calcMeltCurve();
    return this.analysis.getMeltCurve();
  }
  
  /* Private */
  _addFluorescenceQPCRLog (step, values) {
    let data = {
        t:this.getExperimentElapsedTime(),
        v:values,
        stage:step.stage,
        repeat:step.repeat,
        step:step.step
    };
    // console.log("_addFluorescenceQPCRLog " + JSON.stringify(data));
    this.experimentLog.log.fluorescence.qpcr.push(data);
    return data;
  }
  _addFluorescenceMeltCurveLog (step, values) {
    let data = {
        t:this.getExperimentElapsedTime(),
        v:values,
        temp:this.progress.well
    };
    // console.log("_addFluorescenceMeltCurveLog " + JSON.stringify(data));
    this.experimentLog.log.fluorescence.melt_curve.push(data);
    return data;
  }
  _getStep (state) {
    if (!(state.stage >= 0) || !(state.step >= 0) ) {
      return null;
    }
    const stage = this.protocol.stages[state.stage];
    if (stage == null) {
      return null;
    }
    return stage.steps[state.step];
  }
  
  /* Handling ThermalCycler's events */
  onThermalTransition (data) {
    const from = this._getStep(data.from); // Nullable
    const to = this._getStep(data.to); // Nullable
    this.experimentLog.log.events.push(data.to);
    this.optics.stopContinuousDataCollection();
    if (data.from.state == 'ramp') {
      if (from != null && from.data_collection != null && from.data_collection.ramp_end==true) {
        console.log("RAMP FINISH. Measure fluorescence.")
        this.optics.measureAll(
          (values)=>{
            console.log("Ramp end.");
            // One-shot fluorescence measurement
            this.notifyFluorescenceEvent("measure");
            this.onFluorescenceDataUpdate(data.from, MEASUREMENT_RAMP_END, values);
          });
      }
    }
    if (data.from.state == 'hold') {
      if (from != null && from.data_collection != null && from.data_collection.hold_end==true) {
        console.log("HOLD FINISH. Measure fluorescence.")
        this.optics.measureAll(
          (values)=>{
            console.log("Hold end.");
            // One-shot fluorescence measurement
            this.notifyFluorescenceEvent("measure");
            this.onFluorescenceDataUpdate(data.from, MEASUREMENT_HOLD_END, values);
            
          });
      }
    }
    const _data = data;
    if (data.to.state == 'ramp') {
      if (to != null && to.data_collection != null && to.data_collection.ramp_continuous==true) {
        this.optics.startContinuousDataCollection(
          (values)=>{
            this.onFluorescenceDataUpdate(data.to, MEASUREMENT_RAMP_CONTINUOUS, values);
          }
        );
      }
    }
    if (data.to.state == 'Hold continuous') {
      if (to != null && to.data_collection != null && to.data_collection.hold_continuous==true) {
        this.optics.startContinuousDataCollection(
          (values)=>{
            console.log("Hold continuous.");
            this.onFluorescenceDataUpdate(data.to, MEASUREMENT_HOLD_CONTINUOUS, values);
          });
      }
    }
    const toStage = this.protocol.stages[data.to.stage];
    
    // For debug
    let debug = {
      type: (toStage!=null)?toStage.type:0,
      current:this.progress.well,
      cycle:this.progress.state.repeat
    };
    if (toStage && toStage.steps.length == 3) {
      debug.low = toStage.steps[1].temp;
      debug.high = toStage.steps[2].temp;
    }
    if (this.optics.fluorescenceSensingUnit.setDebugValue) {
      this.optics.fluorescenceSensingUnit.setDebugValue(debug, this.experimentLog.config);
    }
    
    if (this.receiver != null && this.receiver.onThermalTransition != null) {
      this.receiver.onThermalTransition(data);
    }
    if (this.optics.continuous != this.isMeasuringFluorescenceContinuously) {
      // Notify on/off of continuouos fluorescence measurement
      this.notifyFluorescenceEvent(this.optics.continuous?"start":"stop");
      this.isMeasuringFluorescenceContinuously = this.optics.continuous;
    }
    if (data.from != null && data.to != null && (data.from.repeat != data.to.repeat || data.from.stage != data.to.stage)) {
      experimentManager.update(this.experimentLog, null, null);
      console.log("ThermalCyclerTransition SAVE");
    } else {
    console.log("ThermalCyclerTransition SKIP", JSON.stringify(data.from), JSON.stringify(data.to));
      
    }
  }
  onAutoPause (data) {
    if (!this.receiver.onAutoPause) {
      console.error("Event receiver has no function named onAutoPause");
    }
    this.receiver.onAutoPause(data);
    
  }
  notifyFluorescenceEvent (eventType) {
    if (this.receiver != null && this.receiver.onFluorescenceEvent != null) {
      this.receiver.onFluorescenceEvent ({type:eventType});
    }
  }
  
  onProgress (data) {
    this.experimentLog.log.temp.time.push(this.getExperimentElapsedTime());
    this.experimentLog.log.temp.well.push(data.well);
    this.experimentLog.log.temp.lid.push(data.lid);
    this.progress = data;
    data.elapsed = this.getExperimentElapsedTime();
    if (this.receiver != null && this.receiver.onProgress) {
      this.receiver.onProgress(data);
    }
  }
  getProgress () {
    return this.progress || {};
  }
  
  /* Handling ThermalCycler's events */
  onFluorescenceDataUpdate (step, measurementType, values) {
    // New
    const stage = this.protocol.stages[step.stage];
    let data = {};
    if (stage == null) {
      console.warn("_addFluorescence* stage is null." + JSON.stringify(step));
    } else if (stage.type == Constants.StageType.QPCR) {
      data = this._addFluorescenceQPCRLog(step, values);
      if (this.receiver != null && this.receiver.onFluorescenceDataUpdate) {
        this.receiver.onFluorescenceDataUpdate(data);
      }
    } else if (stage.type == Constants.StageType.MELT_CURVE) {
      data = this._addFluorescenceMeltCurveLog(step, values);
      if (this.receiver != null && this.receiver.onMeltCurveDataUpdate) {
        this.receiver.onMeltCurveDataUpdate(data);
      }
    }
  }
  
  getConfig () {
    return this.config;
  }
  
  // TODO: deprecate (Move to  analysis class)
  getBaseline () {
    if (this.analysis == null) {
      return {};
    }
    return {
      baselines:this.analysis.baselines,
      thresholds:this.analysis.thresholds
    };
  }
  
  /* Misc */
  onStart () {
    this.experimentLog.status.start = new Date().getTime();
    const data = {
      id:this.experimentLog.id,
      protocol:this.protocol
    };
    if (this.receiver != null && this.receiver.onStart) {
      this.receiver.onStart(data);
    }
    this.experimentLog.status.status = "running";
    this.experimentLog.status.start = new Date().getTime();
    experimentManager.update(this.experimentLog, null, null);
  }
  onCheckpoint () {
    // TODO checkpoint logging (stage end)
  }
  
  onComplete () {
    // Experiment is finished. Note that the thermal cycler is still keeping temp.
    this._setDeviceState(DEVICE_STATE.COMPLETE);
    this.experimentLog.status.status = "finished";
    this.experimentLog.status.end = new Date().getTime();
    experimentManager.update(this.experimentLog, ()=>{
      console.log("Saved.");
    }, 
    (error)=>{
      console.error(error);
    });
    
    const data = {
      id:this.experimentLog.id,
      protocol:this.protocol
    };
    if (this.receiver != null && this.receiver.onComplete) {
      this.receiver.onComplete(data);
    }
  }
  
  // Set device state and notify the event
  _setDeviceState (state) {
    this.deviceState = state;
    setTimeout(()=>{
      if (this.receiver != null && this.receiver.onDeviceStateChange) {
        this.receiver.onDeviceStateChange(this.deviceState);
      }
    }, 1);
  }
  shutdown () {
    console.log("NinjaQPCR.shutdown()");
    this.thermalCycler.shutdown();
    this.optics.shutdown();
  }
}

module.exports = NinjaQPCR;