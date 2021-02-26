"use strict";

const START_TEMP = 25.0;

class Thermistor {
  constructor () {
    this.temperature = START_TEMP; // Celsius
  }
}
const TEMP_TOLERANCE_LID = 1.0;
const TEMP_TOLERANCE_PLATE = 1.0;
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
  update (currentStageIndex, currentRepeatIndex) {
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
        let targetRepeat = (stageIndex == currentStageIndex) ? currentRepeatIndex : 0;
        let stageDuration = (stage.repeat - targetRepeat) * cycleDuration;
        if (currentRepeatIndex == 0) {
          stageDuration -= (cycleDuration - firstCycleDuration);
        }
        remaining += stageDuration;
        // console.log("Remaining: stage=%d duration=%f repeat=%d", stageIndex, stageDuration, stage.repeat);
      }
    });
    const total = (this.timestamp.getTime() - this.start.getTime())/1000;
    this.remainingMsec = remaining * 1000;
  }
}

class ThermalCycler {
  constructor (plate, heatLids) {
    this.plate = plate;
    this.heatLids = heatLids;
    this.state = new StateIdle(null);
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start (protocol) {
    this.protocol = protocol;
    this.plate.start();
    for (let lid of this.heatLids) {
      lid.start();
      if (protocol.lid_temp > 0) {
        lid.setTargetTemperature(protocol.lid_temp);
      } else {
        lid.off();
      }
      
    }
    this.state = new StatePreheat(protocol);
    if (!(this.protocol.lid_temp > 0)) {
      // Skip preheat if lid is disabled
      this.state = this.state.next(this.plate.temperature);
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
  abort () {
    this._stopTimer();
  }
  finish () {
    this._stopTimer();
    this.plate.off();
    for (let lid of this.heatLids) {
      lid.off();
    }
    
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
    this.plate.control();
    if (this.protocol.lid_temp > 0) {
      for (let lid of this.heatLids) {
        lid.control();
      }
    }
    const now = new Date();
    this.state.updateTime(now);
    let lidMaxTemperature = Math.max(...this.heatLids.map(lid=>lid.temperature));
    if (this.state.complete(this.plate.temperature, lidMaxTemperature, now)) {
      // Transition
      this.stateFrom = this.state;
      this.state = this.state.next(this.plate.temperature);
      
      let lidTargetTemp = this.state.lidTargetTemp();
      if (lidTargetTemp != null) {
        for (let lid of this.heatLids) {
          lid.setTargetTemperature(lidTargetTemp);
        }
      }
      this.state.start(now);
      const from = this.stateFrom.getStatus();
      const to = this.state.getStatus();
      if (!(from.stage == to.stage && from.repeat == to.repeat)) {
        this.remainingTimeCalculator.update(to.stage, to.repeat);
        
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
      this.eventReceiver.onProgress(this.getStatus());
    }
    let plateTargetTemp = this.state.plateTargetTemp();
    if (plateTargetTemp != null) {
      this.plate.setTargetTemperature(plateTargetTemp);
    } else {
      this.plate.off();
    }
  }
  getStatus () {
    // TODO: define data format
    return {
      well: round(this.plate.temperature, 2),
      lid: round(this.getLidTemp(), 2),
      state: this.state.getStatus(),
      remaining: this.remainingTimeCalculator.getRemainingMsec()
    };
  }
  getLidTemp () {
    let sum = 0;
    for (let lid of this.heatLids) {
      sum += lid.temperature;
    }
    return sum / this.heatLids.length;
  }
  shutdown () {
    console.log("ThermalCycler.shutdown()");
    this.plate.shutdown();
    for (let lid of this.heatLids) {
      lid.shutdown();
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
      this.protocol.stages[0].repeat > 0 && this.protocol.stages[0].steps.length > 0) {
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
  constructor (protocol, stageIndex, repeatIndex, stepIndex, startTemperature) {
    this.startTemperature = startTemperature;
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.repeatIndex = repeatIndex;
    this.stepIndex = stepIndex
    this.stage = protocol.stages[stageIndex];
    this.step = this.stage.steps[stepIndex];
    this.isFastRamp = (this.step.ramp_speed == null);
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
      this.repeatIndex, this.stepIndex);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "ramp",
      stage: this.stageIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
  
}

class StateStepHold {
  constructor (protocol, stageIndex, repeatIndex, stepIndex) {
    // console.log("StateStepHold %d %d %d", stageIndex, repeatIndex, stepIndex);
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.repeatIndex = repeatIndex;
    this.stepIndex = stepIndex;
    this.stage = protocol.stages[stageIndex];
    this.step = this.stage.steps[stepIndex];
    this.elapsedMsec = 0;
    this.prevTimestamp = new Date();
  }
  start (timestamp) { this.startTimestamp = timestamp; }
  debug () { return "StepHold"; }
  complete (plateTemp, lid_temp, timestamp) {
    console.log(JSON.stringify(this.step));
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
    let nextRepeat = this.repeatIndex;
    let nextStep = this.stepIndex;
    if (this.stepIndex < this.stage.steps.length - 1) {
      nextStep += 1;
    } else if (this.repeatIndex < this.stage.repeat - 1) {
      // Repeat the stage
      nextStep = 0;
      nextRepeat += 1;
    } else if (this.stageIndex < this.protocol.stages.length - 1) {
      // End of the stage.
      // Has next stage
      // Auto pause?
      console.log("pauseAfter=" + this.protocol.stages[this.stageIndex].pauseAfter);
      if (this.protocol.stages[this.stageIndex].pauseAfter) {
        // Pause.
        return new StateAutoPause(this.protocol, this.stageIndex, this.repeatIndex, this.stepIndex, startTemperature);
      }
      nextStage = this.stageIndex += 1;
      nextRepeat = 0;
      nextStep = 0;
    } else {
      // Finish.
      return new StateFinalHold(this.protocol);
    }
    return new StateStepRamp(this.protocol, nextStage, 
      nextRepeat, nextStep, startTemperature);
  }
  getStatus() {
    // TODO define data format
    return {
      state: "hold",
      stage: this.stageIndex,
      step: this.stepIndex,
      repeat: this.repeatIndex,
      stepElapsed: this.elapsedMsec
    }
  }
  isFinished () { return false; }
}
class StateAutoPause {
  constructor (protocol, stageIndex, repeatIndex, stepIndex, startTemperature) {
    this.protocol = protocol;
    this.stageIndex = stageIndex;
    this.repeatIndex = repeatIndex;
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
      repeat: this.repeatIndex,
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