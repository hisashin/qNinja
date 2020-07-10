"use strict";

/*
const Well = require("./well");
const HeatLid = require("./heat_lid");
*/

class Thermistor {
  constructor () {
    this.temperature = 25.0; // Celsius
  }
  measure () {
    
  }
}
const TEMP_TOLERANCE_LID = 1.0;
const TEMP_TOLERANCE_WELL = 1.0;
const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;

class ThermalCycler {
  constructor (conf) {
    this.well = conf.getWell();
    this.heatLid = conf.getHeatLid();
    this.state = new StateIdle(null);
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start (protocol) {
    this.well.start();
    this.heatLid.start();
    this.protocol = protocol;
    this.state = new StatePreheat(protocol);
    this.startTime = new Date();
    this.state.start(this.startTime);
    console.log(this.protocol);
    this.heatLid.setTargetTemperature(protocol.lid_temp);
    this._startTimer();
  }
  pause () {
    this._stopTimer();
  }
  resume () {
    this._startTimer();
  }
  abort () {
    this._stopTimer();
  }
  finish () {
    this._stopTimer();
    this.well.off();
    this.heatLid.off();
  }
  _startTimer () {
    if (this.controlTempInterval != null){
      console.warn("ThermalCycler._startTimer timer is already working.");
      return;
    }
    this.controlTempInterval = setInterval(()=>{ this.control(); }, TEMP_CONTROL_INTERVAL_MSEC);
    
  }
  _stopTimer () {
    if (this.controlTempInterval != null) {
      clearInterval(this.controlTempInterval);
      this.controlTempInterval = null;
    }
  }
  control () {
    // TODO: different intervals for different units!
    this.well.control();
    this.heatLid.control();
    const now = new Date();
    this.state.updateTime(now);
    if (this.state.complete(this.well.temperature, this.heatLid.temperature, now)) {
      // Transition
      this.stateFrom = this.state;
      this.state = this.state.next(this.well.temperature);
      let lidTargetTemp = this.state.lidTargetTemp();
      if (lidTargetTemp != null) {
        this.heatLid.setTargetTemperature(lidTargetTemp);
      }
      this.state.start(now);
      if (this.eventReceiver != null && this.eventReceiver.onThermalTransition != null) {
        // TODO: define data format
        // Notify thermal transition -> fluorescence measurement (if needed)
        this.eventReceiver.onThermalTransition({ from:this.stateFrom.getStatus(), to:this.state.getStatus() });
      }
      if (this.state.isFinished () && this.eventReceiver != null && this.eventReceiver.onComplete != null)  {
        this.eventReceiver.onComplete();
      }
    }
    if (this.eventReceiver != null && this.eventReceiver.onProgress != null) {
      this.eventReceiver.onProgress(this.getStatus());
    }
    let wellTargetTemp = this.state.wellTargetTemp();
    if (wellTargetTemp != null) {
      this.well.setTargetTemperature(wellTargetTemp);
    } else {
      this.well.off();
    }
  }
  getStatus () {
    // TODO: define data format
    return {
      well: this.well.temperature,
      lid: this.heatLid.temperature,
      state: this.state.getStatus()
    };
  }
}

/* State classes */

class StateIdle {
  constructor (protocol) {}
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "Idle"; }
  complete (wellTemp, lid_temp, timestamp) { 
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
  complete (wellTemp, lid_temp, timestamp) { 
    return Math.abs(lid_temp - this.protocol.lid_temp) <= TEMP_TOLERANCE_LID;
  }
  updateTime (timestamp) {
    // Do nothing
  }
  wellTargetTemp () {
    return null;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) { 
    if (this.protocol.stages.length > 0 && 
      this.protocol.stages[0].repeat > 0 && this.protocol.stages[0].steps.length > 0) {
      // Choose the first step of the first cycle
      const state = new StateStepRamp(this.protocol, 
        0, 0, 0, startTemperature);
      return state;
    } else {
      // Finish immediately
      return new StateFinalHold(this.protocol);
    }
  }
  getStatus() {
    // TODO define data format
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
  constructor (protocol, cycleIndex, repeatIndex, stepIndex, startTemperature) {
    this.startTemperature = startTemperature;
    this.protocol = protocol;
    this.cycleIndex = cycleIndex;
    this.repeatIndex = repeatIndex;
    this.stepIndex = stepIndex
    this.cycle = protocol.stages[cycleIndex];
    this.step = this.cycle.steps[stepIndex];
    this.isFastRamp = (this.step.ramp_speed == null);
    if (!this.isFastRamp) {
      this.rampSpeed = Math.abs(this.step.ramp_speed); // Degree per sec
    }
    this.elapsedMsec = 0;
    this.prevTimestamp = new Date();
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepFastRamp"; };
  complete (wellTemp, lid_temp, timestamp) { 
    return Math.abs(wellTemp - this.step.temp) <= TEMP_TOLERANCE_WELL;
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
  wellTargetTemp () {
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
    return new StateStepHold(this.protocol, this.cycleIndex, 
      this.repeatIndex, this.stepIndex);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "ramp",
      cycle: this.cycleIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
}

class StateStepHold {
  constructor (protocol, cycleIndex, repeatIndex, stepIndex) {
    // console.log("StateStepHold %d %d %d", cycleIndex, repeatIndex, stepIndex);
    this.protocol = protocol;
    this.cycleIndex = cycleIndex;
    this.repeatIndex = repeatIndex;
    this.stepIndex = stepIndex;
    this.cycle = protocol.stages[cycleIndex];
    this.step = this.cycle.steps[stepIndex];
    this.elapsedMsec = 0;
    this.prevTimestamp = new Date();
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepHold"; }
  complete (wellTemp, lid_temp, timestamp) {
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
  wellTargetTemp () {
    return this.step.temp;
  }
  lidTargetTemp () {
    return this.protocol.lid_temp;
  }
  next (startTemperature) { 
    let nextCycle = this.cycleIndex;
    let nextRepeat = this.repeatIndex;
    let nextStep = this.stepIndex;
    if (this.stepIndex < this.cycle.steps.length - 1) {
      nextStep += 1;
    } else if (this.repeatIndex < this.cycle.repeat - 1) {
      // Repeat the cycle
      nextStep = 0;
      nextRepeat += 1;
    } else if (this.cycleIndex < this.protocol.stages.length - 1) {
      // Next cycle
      nextCycle = this.cycleIndex += 1;
      nextRepeat = 0;
      nextStep = 0;
    } else {
      // Finish.
      return new StateFinalHold(this.protocol);
    }
    return new StateStepRamp(this.protocol, nextCycle, 
      nextRepeat, nextStep, startTemperature);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "hold",
      cycle: this.cycleIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
}
class StateFinalHold {
  constructor (protocol) {
    this.protocol = protocol;
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "FinalHold"; }
  complete (wellTemp, lid_temp, timestamp) { 
    // Never finishes.
    return false; 
  }
  updateTime (timestamp) {
    // Nothing to do.
  }
  wellTargetTemp () {
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
  isFinished () { return true; }
}

module.exports = ThermalCycler;