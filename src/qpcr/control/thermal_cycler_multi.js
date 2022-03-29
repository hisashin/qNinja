"use strict";
const PromiseQueue = require("../lib/promise_queue.js");
const TemperatureMonitor = require("./temperature_monitor.js");

const START_TEMP = 25.0;

class Thermistor {
  constructor () {
    this.temperature = START_TEMP; // Celsius
  }
}
const TEMP_TOLERANCE_LID = 1.0;
const TEMP_TOLERANCE_PLATE = 0.5;
const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;


// TODO: use measured > saved > default values.
const PLATE_TEMP_HEATING_SPEED = 5.0;
const PLATE_TEMP_COOLING_SPEED = 5.0;
class RemainingTimeCalculator {
  constructor (protocol) {
    this.start = new Date();
    this.protocol = protocol;
    
    this.timestamp = new Date();
    this.update(0, 0, new Date());
  }
  getRemainingMsec() {
    return this.remainingMsec - (new Date().getTime() - this.timestamp.getTime()) 
  }
  getEstimatedTransitionTime (fromTemp, toTemp, rampSpeed) {
    if (fromTemp < toTemp) {
      let heatingSpeed = PLATE_TEMP_HEATING_SPEED;
      if (rampSpeed != null && rampSpeed > 0) {
        heatingSpeed = Math.min(heatingSpeed, rampSpeed);
      }
      return (toTemp - fromTemp) / heatingSpeed;
    }
    let coolingSpeed = PLATE_TEMP_COOLING_SPEED;
    if (rampSpeed != null && rampSpeed > 0) {
      coolingSpeed = Math.min(coolingSpeed, rampSpeed);
    }
    return (fromTemp - toTemp) / coolingSpeed;
  }
  update (currentStageIndex, currentCycleIndex) {
    // First
    this.timestamp = new Date();
    let temp = START_TEMP;
    let remaining = 0; // sec
    this.protocol.stages.forEach ((stage, stageIndex)=>{
      let firstCycleDuration = 0;
      let cycleDuration = 0;
      stage.steps.forEach((step, stepIndex)=>{
        const stepDuration = this.getEstimatedTransitionTime(temp, step.temp, step.ramp_speed) + step.duration;
        /*
        console.log("Remaining: stage=%d, step=%d (first) duration=%f, hold=%f [%f->%f]", 
          stageIndex, stepIndex, stepDuration, step.duration,
          temp, step.temp);
          */
        firstCycleDuration += stepDuration;
        temp = step.temp;
      });
      stage.steps.forEach((step, stepIndex)=>{
        const stepDuration = this.getEstimatedTransitionTime(temp, step.temp, step.ramp_speed) + step.duration;
        /*
        console.log("Remaining: stage=%d, step=%d (second) duration=%f, hold=%f [%f->%f]",
          stageIndex, stepIndex, stepDuration, step.duration,
        temp, step.temp);
        */
        cycleDuration += stepDuration;
        temp = step.temp;
      });
      
      if (stageIndex >= currentStageIndex) {
        let targetCycle = (stageIndex == currentStageIndex) ? currentCycleIndex : 0;
        let stageDuration = (stage.cycles - targetCycle) * cycleDuration;
        if (currentCycleIndex == 0) {
          stageDuration -= (cycleDuration - firstCycleDuration);
        }
        remaining += stageDuration;
      }
    });
    const total = (this.timestamp.getTime() - this.start.getTime())/1000;
    this.remainingMsec = remaining * 1000;
  }
}

class ThermalCycler {
  constructor (plate, heatLid, /* Optional */extraSensing) {
    this.plate = plate;
    this.heatLid = heatLid;
    this.extraSensing = extraSensing;
    this.state = new StateIdle(null);
    this.tempMonitor = new TemperatureMonitor(plate, heatLid, extraSensing);
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start (protocol) {
    this.protocol = protocol;
    this.plate.start();
    this.heatLid.start();
    if (protocol.lid_temp > 0) {
      this.heatLid.setTargetTemperature(protocol.lid_temp);
    } else {
      this.heatLid.off();
    }
    this.state = new StatePreheat(protocol);
    if (!(this.protocol.lid_temp > 0)) {
      // Skip preheat if lid is disabled
      this.state = this.state.next(this.plate.getTemperature());
    }
    this.startTime = new Date();
    this.state.start(this.startTime);
    console.log(this.protocol);
    this._startTimer();
    this.remainingTimeCalculator = new RemainingTimeCalculator(protocol);
  }
  pause () {
    this._stopTimer();
  }
  finishAutoPause () {
    if (this.state.resume) {
      this.state.resume();
    } else {
      console.error("Illegal state. ThermalCycler.finishAutoPause was called but the state is not auto_pause.");
    }
  }
  resume () {
    this._startTimer();
  }
  cancel () {
    this._stopTimer();
    this.plate.off();
    this.heatLid.off();
  }
  finish () {
    this._stopTimer();
    this.plate.off();
    this.heatLid.off();
  }
  _startTimer () {
    console.log("ThermalCycler._startTimer() 1");
    if (this.controlTempInterval != null){
      console.warn("ThermalCycler._startTimer timer is already working.");
      return;
    }
      console.log("ThermalCycler._startTimer() 2");
    this.controlTempInterval = setInterval(()=>{ this.control(); }, TEMP_CONTROL_INTERVAL_MSEC);
  }
  _stopTimer () {
    if (this.controlTempInterval != null) {
      clearInterval(this.controlTempInterval);
      this.controlTempInterval = null;
    }
  }
  _plateControlTask (plate) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        plate.control(()=>{
          resolve();
        });
      });
    };
  }
  _lidControlTask (lid) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        lid.control(resolve);
      });
    };
  }
  _extraSensingControlTask (extraSensing) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        extraSensing.control(resolve);
      });
    };
  }
  control () {
    // TODO: different intervals for different units!
    let queue = [];
    queue.push(this._plateControlTask(this.plate));
    if (this.protocol.lid_temp > 0) {
      queue.push(this._lidControlTask(this.heatLid));
    }
    if (this.extraSensing) {
      queue.push(this._extraSensingControlTask(this.extraSensing));
    }
    new PromiseQueue(queue).exec().then(()=>{
      this._control();
    });
  }
  _control () {
    const now = new Date();
    this.state.updateTime(now);
    let lidMaxTemperature = this.heatLid.getTemperature();
    if (this.state.complete(this.plate.getTemperature(), lidMaxTemperature, now)) {
      // Transition
      this.stateFrom = this.state;
      this.state = this.state.next(this.plate.getTemperature());
      
      let lidTargetTemp = this.state.lidTargetTemp();
      if (lidTargetTemp != null) {
        this.heatLid.setTargetTemperature(lidTargetTemp);
      }
      this.state.start(now);
      const from = this.stateFrom.getStatus();
      const to = this.state.getStatus();
      if (!(from.stage == to.stage && from.cycle == to.cycle)) {
        this.remainingTimeCalculator.update(to.stage, to.cycle);
      }
      if (this.eventReceiver != null && this.eventReceiver.onThermalTransition != null) {
        // TODO: define data format
        // Notify thermal transition -> fluorescence measurement (if needed)
        this.eventReceiver.onThermalTransition({ from:from, to:to });
      }
      if (this.state.isFinished () && this.eventReceiver != null && this.eventReceiver.onComplete != null)  {
        this.eventReceiver.onComplete();
      }
      if (this.state.getStatus().state == "auto_pause") {
        console.log("Transition to auto_pause");
        if (!this.eventReceiver.onAutoPause) {
          console.error("Event receiver has no onAutoPause");
        }
        this.eventReceiver.onAutoPause(this.state.getStatus());
      }
    }
    if (this.eventReceiver != null && this.eventReceiver.onProgress != null) {
      this.tempMonitor.getMeasurement((detail)=>{
        let status = this.getStatus();
        status.detail = detail;
        this.eventReceiver.onProgress(status);
        
      }, 1000);
    }
    let plateTargetTemp = this.state.plateTargetTemp();
    if (plateTargetTemp != null) {
      this.plate.setTargetTemperature(plateTargetTemp);
    } else {
      this.plate.off();
    }
  }
  getStatus () {
    let status = {
      plate: round(this.plate.getTemperature(), 2),
      lid: round(this.heatLid.getTemperature(), 2),
      state: this.state.getStatus(),
      remaining: this.remainingTimeCalculator.getRemainingMsec()
    };
    if (this.extraSensing && this.extraSensing.data) {
      status.extra = this.extraSensing.data();
    }
    return status;
  }
  shutdown () {
    console.log("ThermalCycler.shutdown()");
    this._stopTimer ();
    if (this.plate && this.plate.shutdown) {
      try {
        this.plate.shutdown();
      } catch (e) {
        console.warn(e);
      }
    } else {
      console.warn("ThermalCycler.shutdown() plate does not have shutdown function.");
    }
    if (this.heatLid && this.heatLid.shutdown) {
      try {
        this.heatLid.shutdown();
      } catch (e) {
        console.warn(e);
      }
    } else {
      console.warn("ThermalCycler.shutdown() heatLid does not have shutdown function.");
    }
  }
}
function round (value, position) {
  let pow = Math.pow(10, position);
  return Math.round(value * pow) / pow;
}

/* State classes */

class StateIdle {
  constructor (protocol) {}
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "Idle"; }
  complete (plateTemp, lid_temp, timestamp) { 
    return false; 
  }
  updateTime (timestamp) {
    // Do nothing
  }
  next (startTemperature) { 
    return null;
  }
  getStatus() {
    // TODO define data format
    return {
      state: "idle"
    }
  }
  isFinished () { return false; }
}
class StatePreheat {
  constructor (protocol) {
    this.protocol = protocol;
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "Preheat"; }
  complete (plateTemp, lid_temp, timestamp) { 
    if (this.protocol.lid_temp > 0) {
      return Math.abs(lid_temp - this.protocol.lid_temp) <= TEMP_TOLERANCE_LID;
    } else {
      return true;
    }
  }
  updateTime (timestamp) {
    // Do nothing
  }
  plateTargetTemp () {
    return null;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) { 
    if (this.protocol.stages.length > 0 && 
      this.protocol.stages[0].cycles > 0 && this.protocol.stages[0].steps.length > 0) {
      // Choose the first step of the first stage
      const state = new StateStepRamp(this.protocol, 
        0, 0, 0, startTemperature);
      return state;
    } else {
      // Finish immediately
      return new StateFinalHold(this.protocol);
    }
  }
  getStatus() {
    return {
      state: "preheat",
      stepElapsed: new Date().getTime() - this.startTimestamp
    }
  }
  isFinished () { return false; }
}

class StateStepControlledRamp  {
  // TODO
}

class StateStepRamp {
  constructor (protocol, stageIndex, cycleIndex, stepIndex, startTemperature) {
    this.startTemperature = startTemperature;
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.cycleIndex = cycleIndex;
    this.stepIndex = stepIndex
    this.stage = protocol.stages[stageIndex];
    this.step = this.stage.steps[stepIndex];
    this.isFastRamp = (!(this.step.ramp_speed > 0));
    if (!this.isFastRamp) {
      this.rampSpeed = Math.abs(this.step.ramp_speed); // Degree per sec
    }
    this.elapsedMsec = 0;
    this.prevTimestamp = new Date();
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepFastRamp"; };
  complete (plateTemp, lid_temp, timestamp) { 
    return Math.abs(plateTemp - this.step.temp) <= TEMP_TOLERANCE_PLATE;
  }
  updateTime (timestamp) {
    const interval = timestamp.getTime() - this.prevTimestamp.getTime();
    this.prevTimestamp = timestamp;
    if (interval > 2000) {
      // Paused
      return;
    } 
    this.elapsedMsec += interval;
  }
  plateTargetTemp () {
    if (this.isFastRamp) {
      return this.step.temp;
    } else {
      if (this.startTemperature > this.step.temp) {
        // Cooling
        const val = Math.max(this.startTemperature - this.elapsedMsec/1000.0 * this.rampSpeed, this.step.temp);
        return val;
      } else if (this.startTemperature < this.step.temp) {
        // Heating
        const val = Math.min(this.startTemperature + this.elapsedMsec/1000.0 * this.rampSpeed, this.step.temp);
        return val;
      }
      return this.step.temp;
    }
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) {
    return new StateStepHold(this.protocol, this.stageIndex, 
      this.cycleIndex, this.stepIndex);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "ramp",
      stage: this.stageIndex,
      step: this.stepIndex,
      cycle: this.cycleIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
  
}

class StateStepHold {
  constructor (protocol, stageIndex, cycleIndex, stepIndex) {
    // console.log("StateStepHold %d %d %d", stageIndex, cycleIndex, stepIndex);
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.cycleIndex = cycleIndex;
    this.stepIndex = stepIndex;
    this.stage = protocol.stages[stageIndex];
    this.step = this.stage.steps[stepIndex];
    this.elapsedMsec = 0;
    this.prevTimestamp = new Date();
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepHold"; }
  complete (plateTemp, lid_temp, timestamp) {
    return this.elapsedMsec/1000 > this.step.duration;
  }
  updateTime (timestamp) {
    const interval = timestamp.getTime() - this.prevTimestamp.getTime();
    this.prevTimestamp = timestamp;
    if (interval > 2000) {
      // Paused
      return;
    } 
    this.elapsedMsec += interval;
  }
  plateTargetTemp () {
    return this.step.temp;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) { 
    let nextStage = this.stageIndex;
    let nextCycle = this.cycleIndex;
    let nextStep = this.stepIndex;
    if (this.stepIndex < this.stage.steps.length - 1) {
      nextStep += 1;
    } else if (this.cycleIndex < this.stage.cycles - 1) {
      // Repeat the stage
      nextStep = 0;
      nextCycle += 1;
    } else if (this.stageIndex < this.protocol.stages.length - 1) {
      // End of the stage.
      // Has next stage
      // Auto pause?
      console.log("pause_after=" + this.protocol.stages[this.stageIndex].pause_after);
      if (this.protocol.stages[this.stageIndex].pause_after) {
        // Pause.
        return new StateAutoPause(this.protocol, this.stageIndex, this.cycleIndex, this.stepIndex, startTemperature);
      }
      nextStage = this.stageIndex += 1;
      nextCycle = 0;
      nextStep = 0;
    } else {
      // Finish.
      return new StateFinalHold(this.protocol);
    }
    return new StateStepRamp(this.protocol, nextStage, 
      nextCycle, nextStep, startTemperature);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "hold",
      stage: this.stageIndex,
      step: this.stepIndex,
      cycle: this.cycleIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
}
class StateAutoPause {
  constructor (protocol, stageIndex, cycleIndex, stepIndex, startTemperature) {
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.cycleIndex = cycleIndex;
    this.stepIndex = stepIndex;
    this.startTemperature = startTemperature;
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "FinalHold"; }
  complete (plateTemp, lid_temp, timestamp) { 
    return (this.resuming == true); 
  }
  updateTime (timestamp) {
    // Nothing to do.
  }
  plateTargetTemp () {
    return this.startTemperature;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) {
    if (this.resuming) {
      return new StateStepRamp(this.protocol, this.stageIndex+1, 
        0, 0, startTemperature);
    }
    return null;
  }
  getStatus() {
    return {
      state: "auto_pause",
      stage: this.stageIndex,
      step: this.stepIndex,
      cycle: this.cycleIndex,
      stepElapsed: new Date().getTime() - this.startTimestamp
    }
  }
  isFinished () { 
    return false; 
  }
  resume () {
    this.resuming = true;
  }
}
class StateFinalHold {
  constructor (protocol) {
    this.protocol = protocol;
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "FinalHold"; }
  complete (plateTemp, lid_temp, timestamp) { 
    // Never finishes.
    return false; 
  }
  updateTime (timestamp) {
    // Nothing to do.
  }
  plateTargetTemp () {
    if (this.protocol.final_hold_temp) {
      return this.protocol.final_hold_temp;
    }
    return null;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) { 
    return null;
  }
  getStatus() {
    // TODO define data format
    return {
      state: "complete"
    }
  }
  isFinished () { 
    return true; 
  }
}

module.exports = ThermalCycler;