"use strict";

class PID {
  constructor (kp, ki, kd) {
    this.kp = kp;
    this.ki = ki;
    this.kd = kd;
    this.value = 0.0;
    this.intervalSec = 1.0; // Default: 1sec
    this.setpoint = 0.0;
    
    this.p = 0.0;
    this.i = 0.0;
    this.d = 0.0;
    
    // Output limits
    this.lower = -1.0;
    this.upper = 1.0;
    
  }
  setOutputRange (lower, upper) {
    this.lower = lower;
    this.upper = upper;
  }
  setSetpoint (setpoint) {
    this.setpoint = setpoint;
  }
  reset () {
    this.p = 0.0;
    this.i = 0.0;
    this.d = 0.0;
  }
  setInterval (intervalSec) {
    // TODO: error check (0 or negative)
    this.intervalSec = intervalSec;
  }
  setValue (value) {
    this.p = value - this.setpoint;
    this.d = (value - this.value) /  this.intervalSec;
    this.i += (value - this.setpoint) * this.intervalSec;
    this.value = value;
  }
  getOutput () {
    let output = - (this.p * this.kp + this.i * this.ki * this.d * this.kd);
    output = Math.min(this.upper, Math.max(this.lower, output));
    return output;
  }
}

module.exports = PID;