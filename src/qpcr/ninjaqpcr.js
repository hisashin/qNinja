"use strict";

const ThermalCycler = require("./control/thermal_cycler");
const Optics = require("./control/optics");

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;
/* QPCR Interface */
class NinjaQPCR {
  constructor (hardwareConf) {
    this.thermalCycler = new ThermalCycler(hardwareConf);
    this.thermalCycler.setEventReceiver(this);
    this.optics = new Optics(hardwareConf);
    this.optics.setEventReceiver(this);
  }
  setEventReceiver (receiver) {
    this.receiver = receiver;
    /*
      onThermalTransition(transition)
      onError(error)
      onExperimentFinish()
    */
  }
  start (protocol) {
    this.protocol = protocol;
    this.thermalCycler.start(protocol);
    this.optics.start();
  }
  getStatus () {
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
  _getStep (state) {
    if (!(state.cycle >= 0) || !(state.step >= 0) ) {
      return null;
    }
    const cycle = this.protocol.cycles[state.cycle];
    if (cycle == null) {
      return null;
    }
    return cycle.steps[state.step];
  }
  onThermalTransition (data) {
    // TODO check condition
    // data.from, data.to
    /*
    const MEASUREMENT_RAMP_CONTINUOUS = 1;
    const MEASUREMENT_HOLD_CONTINUOUS = 2;
    const MEASUREMENT_RAMP_END = 3;
    const MEASUREMENT_HOLD_END = 4;
    */
    const from = this._getStep(data.from);
    const to = this._getStep(data.to);
    this.optics.stopContinuousDataCollection();
    if (data.from.state == 'ramp') {
      if (from != null && from.data_collection != null && from.data_collection.indexOf(MEASUREMENT_RAMP_END) > -1) {
        console.log("RAMP FINISH. Measure fluorescence.")
        this.optics.measureAll(
          (data)=>{
            console.log("Ramp end.");
            // One-shot fluorescence measurement
            this.onFluorescenceDataUpdate(data);
          });
      }
    }
    if (data.from.state == 'hold') {
      if (from != null && from.data_collection != null && from.data_collection.indexOf(MEASUREMENT_HOLD_END) > -1) {
        console.log("HOLD FINISH. Measure fluorescence.")
        this.optics.measureAll(
          (data)=>{
            console.log("Hold end.");
            // One-shot fluorescence measurement
            this.onFluorescenceDataUpdate(data);
            
          });
      }
    }
    const _data = data;
    if (data.to.state == 'ramp') {
      if (to != null && to.data_collection != null && to.data_collection.indexOf(MEASUREMENT_RAMP_CONTINUOUS) > -1) {
        this.optics.startContinuousDataCollection(
          (data)=>{
            console.log("Ramp continuous.");
            this.onFluorescenceDataUpdate(data);
          }
        );
      }
    }
    if (data.to.state == 'Hold continuous') {
      if (to != null && to.data_collection != null && to.data_collection.indexOf(MEASUREMENT_HOLD_CONTINUOUS) > -1) {
        this.optics.startContinuousDataCollection(
          (data)=>{
            console.log("Hold continuous.");
            this.onFluorescenceDataUpdate(data);
            
          });
      }
    }
    /*
    const MEASUREMENT_RAMP_CONTINUOUS = 1;
    const MEASUREMENT_HOLD_CONTINUOUS = 2;
    const MEASUREMENT_RAMP_END = 3;
    const MEASUREMENT_HOLD_END = 4;
    */
    if (this.receiver != null && this.receiver.onThermalTransition != null) {
      this.receiver.onThermalTransition(data);
    }
  }
  onThermalDataUpdate (data) {
    if (this.receiver != null && this.receiver.onThermalDataUpdate) {
      this.receiver.onThermalDataUpdate(data);
    }
  }
  onFluorescenceDataUpdate (data) {
    if (this.receiver != null && this.receiver.onFluorescenceDataUpdate) {
      this.receiver.onFluorescenceDataUpdate(data);
    }
    
  }
  onFinish () {
    console.log("Finish");
    // TODO stop optics
    // TODO callback
  }
  
}

module.exports = NinjaQPCR;