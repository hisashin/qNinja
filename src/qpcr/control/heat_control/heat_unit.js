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
}
class SampleSensing {
  
}
class HeatUnit () {
  constructor (pid, sensing, output) {
    this.pid = pid;
    this.sensing = sensing;
    this.output = output;
  }
  setTargetTemperature () {
    // TODO
  }
  control () {
    const temperature = this.sensing.getTemperature();
    this.pid.setTemperature(temperature);
    this.output.setOutput(this.pid.getOutput())
  }
  temperature () {

  }
}
