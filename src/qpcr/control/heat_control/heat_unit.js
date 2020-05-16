"use strict";

class SampleSensing {
  constructor () {
  }
  getTemperature () {
    // TODO: Get temperature.
    return 42.0;
  }
}
class SampleOutput {
  constructor () {
  }
  setOutput (outputValue) {
    // TODO: Set physical output here.
  }
  off () {
    // TODO: Turn off
  }
}
class HeatUnit {
  constructor (pid, sensing, output) {
    this.pid = pid;
    this.sensing = sensing;
    this.output = output;
    this.temperature = 0.0; // Celsius
    this.targetTemperature = 0.0; // Celsius
  }
  setTargetTemperature (targetTemperature) {
    this.targetTemperature = targetTemperature;
  }
  control () {
    this.temperature = this.sensing.getTemperature();
    this.pid.setTemperature(temperature);
    this.output.setOutput(this.pid.getOutput())
  }
  temperature () {
    return this.temperature;
  }
  off() {
    this.output.off();
  }
}

module.exports = HeatUnit;