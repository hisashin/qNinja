"use strict";

/*
const Well = require("./well");
const HeatLid = require("./heat_lid");
*/

class Thermistor {
  constructor () {
    this.temperature = 25.0; // Celsiust
  }
  measure () {
    
  }
}
const TEMP_TOLERANCE_LID = 1.0;
const TEMP_TOLERANCE_WELL = 1.0;
const DUMMY_TEMP_TRANSITION_PER_SEC = 1.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;
const TIME_RATIO = 5; // For fast debugging

class ThermalCycler {
  constructor (conf) {
    this.well = conf.getWell();
    this.heatLid = conf.getHeatLid();
    /*
    this.well = new Well();
    this.heatLid = new HeatLid();
    */
    this.state = new StateIdle(null);
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start (protocol) {
    this.protocol = protocol;
    this.state = new StatePreheat(protocol);
    this.startTime = new Date();
    this.state.start(this.startTime);
    console.log(this.protocol);
    this.heatLid.setTargetTemperature(protocol.lidTemp);
    this.controlTempInterval = setInterval(()=>{ this.control(); }, TEMP_CONTROL_INTERVAL_MSEC/TIME_RATIO);
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
      this.state = this.state.next();
      let wellTargetTemp = this.state.wellTargetTemp();
      if (wellTargetTemp != null) {
        this.well.setTargetTemperature(wellTargetTemp);
      } else {
        this.well.off();
      }
      let lidTargetTemp = this.state.lidTargetTemp();
      if (lidTargetTemp != null) {
        this.heatLid.setTargetTemperature(lidTargetTemp);
      }
      this.state.start(now);
      if (this.eventReceiver != null && this.eventReceiver.onThermalTransition != null) {
        // TODO: define data format
        this.eventReceiver.onThermalTransition({ "data":"TODO thermal transition event" });
      }
    }
    if (this.eventReceiver != null && this.eventReceiver.onThermalDataUpdate != null) {
      this.eventReceiver.onThermalDataUpdate(this.getStatus());
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
  next () { 
    return null;
  }
  getStatus() {
    // TODO define data format
    return {
      state: "idle"
    }
  }
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
  next () { 
    if (this.protocol.cycles.length > 0 && 
      this.protocol.cycles[0].repeat > 0 && this.protocol.cycles[0].steps.length > 0) {
      // Choose the first step of the first cycle
      const state = new StateStepFastRamp(this.protocol, 
        0, 0, 0);
      return state;
    } else {
      // Finish immediately
      return new StateFinalHold();
    }
  }
  getStatus() {
    // TODO define data format
    return {
      state: "preheat"
    }
  }
}
class StateStepFastRamp {
  constructor (protocol, cycleIndex, repeatIndex, stepIndex) {
    this.protocol = protocol;
    this.cycleIndex = cycleIndex;
    this.repeatIndex = repeatIndex;
    this.stepIndex = stepIndex
    this.cycle = protocol.cycles[cycleIndex];
    this.step = this.cycle.steps[stepIndex];
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepFastRamp"; };
  complete (wellTemp, lidTemp, timestamp) { 
    return Math.abs(wellTemp - this.step.temp) <= TEMP_TOLERANCE_WELL;
  }
  wellTargetTemp () {
    return this.step.temp;
  }
  lidTargetTemp () {
    return this.protocol.lidTemp;
  }
  next () {
    return new StateStepHold(this.protocol, this.cycleIndex, 
      this.repeatIndex, this.stepIndex);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "ramp",
      cycle: this.cycleIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex
    }
  }
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
    return timestamp.getTime() > this.startTimestamp.getTime() + this.step.duration * 1000 / TIME_RATIO;
  }
  wellTargetTemp () {
    return this.step.temp;
  }
  lidTargetTemp () {
    return this.protocol.lidTemp;
  }
  next () { 
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
    return new StateStepFastRamp(this.protocol, nextCycle, 
      nextRepeat, nextStep);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "hold",
      cycle: this.cycleIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex
    }
  }
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
  next () { 
    return null;
  }
  getStatus() {
    // TODO define data format
    return {
      state: "complete"
    }
  }
}

module.exports = ThermalCycler;