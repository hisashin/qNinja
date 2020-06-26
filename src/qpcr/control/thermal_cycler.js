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
    this.heatLid.setTargetTemperature(protocol.lidTemp);
    this.controlTempInterval = setInterval(()=>{ this.control(); }, TEMP_CONTROL_INTERVAL_MSEC);
  }
  stop () {
    if (this.controlTempInterval != null) {
      this.clearInterval(this.controlTempInterval);
      this.controlTempInterval = null;
    }
  }
  control () {
    // TODO: different intervals for different units!
    this.well.control();
    this.heatLid.control();
    const now = new Date();
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
      if (this.state.isFinished () && this.eventReceiver != null && this.eventReceiver.onFinish != null)  {
        this.eventReceiver.onFinish();
      }
    }
    if (this.eventReceiver != null && this.eventReceiver.onThermalDataUpdate != null) {
      this.eventReceiver.onThermalDataUpdate(this.getStatus());
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
  complete (wellTemp, lidTemp, timestamp) { 
    return false; 
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
  complete (wellTemp, lidTemp, timestamp) { 
    return Math.abs(lidTemp - this.protocol.lidTemp) <= TEMP_TOLERANCE_LID;
  }
  wellTargetTemp () {
    return null;
  }
  lidTargetTemp () {
    return this.protocol.lidTemp;
  }
  next (startTemperature) { 
    if (this.protocol.cycles.length > 0 && 
      this.protocol.cycles[0].repeat > 0 && this.protocol.cycles[0].steps.length > 0) {
      // Choose the first step of the first cycle
      const state = new StateStepRamp(this.protocol, 
        0, 0, 0, startTemperature);
      return state;
    } else {
      // Finish immediately
      return new StateFinalHold();
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
    this.cycle = protocol.cycles[cycleIndex];
    this.step = this.cycle.steps[stepIndex];
    this.isFastRamp = (this.step.ramp_speed == null);
    if (!this.isFastRamp) {
      this.rampSpeed = Math.abs(this.step.ramp_speed); // Degree per sec
    }
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepFastRamp"; };
  complete (wellTemp, lidTemp, timestamp) { 
    return Math.abs(wellTemp - this.step.temp) <= TEMP_TOLERANCE_WELL;
  }
  wellTargetTemp () {
    if (this.isFastRamp) {
      return this.step.temp;
    } else {
      if (this.startTemperature > this.step.temp) {
        // Cooling
        const val = Math.max(this.startTemperature - this._elapsedMsec()/1000.0 * this.rampSpeed, this.step.temp);
        return val;
      } else if (this.startTemperature < this.step.temp) {
        // Heating
        const val = Math.min(this.startTemperature + this._elapsedMsec()/1000.0 * this.rampSpeed, this.step.temp);
        return val;
      }
      return this.step.temp;
    }
  }
  lidTargetTemp () {
    return this.protocol.lidTemp;
  }
  next (startTemperature) {
    return new StateStepHold(this.protocol, this.cycleIndex, 
      this.repeatIndex, this.stepIndex);
  }
  _elapsedMsec () {
    return new Date().getTime() - this.startTimestamp;
  }
  getStatus() {
    // TODO define data format
    return {
      state: "ramp",
      cycle: this.cycleIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex,
      stepElapsed: this._elapsedMsec()
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
    this.cycle = protocol.cycles[cycleIndex];
    this.step = this.cycle.steps[stepIndex];
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepHold"; }
  complete (wellTemp, lidTemp, timestamp) { 
    return timestamp.getTime() > this.startTimestamp.getTime() + this.step.duration * 1000;
  }
  wellTargetTemp () {
    return this.step.temp;
  }
  lidTargetTemp () {
    return this.protocol.lidTemp;
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
    } else if (this.cycleIndex < this.protocol.cycles.length - 1) {
      // Next cycle
      nextCycle = this.cycleIndex += 1;
      nextRepeat = 0;
      nextStep = 0;
    } else {
      // Finish.
      return new StateFinalHold();
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
      stepElapsed: new Date().getTime() - this.startTimestamp
    }
  }
  isFinished () { return false; }
}
class StateFinalHold {
  constructor (protocol) {}
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "FinalHold"; }
  complete (wellTemp, lidTemp, timestamp) { 
    return false; 
  }
  wellTargetTemp () {
    return null;
  }
  lidTargetTemp () {
    return null;
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