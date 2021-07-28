"use strict";

/*
  Heat output, sensing and logic
  */
class SampleSensing {
  constructor () {
  }
  start () {
    
  }
  getTemperature (callback) {
    callback(42.0);
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
  start () {
    // Initialize hardware. This function is called once at the first run.
    this.sensing.start();
    this.output.start();
  }
  setTargetTemperature (targetTemperature) {
    if (this.targetTemperature == targetTemperature) {
      return;
    }
    console.log("setTargetTemperature %f", targetTemperature);
    this.targetTemperature = targetTemperature;
    this.pid.setSetpoint(this.targetTemperature);
  }
  control (callback) {
    this.sensing.measureTemperature ((temperature)=>{
      this.temperature = temperature;
      this.pid.setValue(temperature);
      if (this.targetTemperature > 0) {
        const outputValue = this.pid.getOutput();
        console.log("Temp=%f, Target=%f, Out=%f", this.temperature, this.targetTemperature, outputValue);
        this.output.setOutput(outputValue);
      }
      callback();
    });
  }
  getTemperature() {
    return this.temperature;
  }
  off() {
    this.output.off();
  }
  shutdown () {
    console.log("Shutting down HeatUnit.");
    if (this.output.shutdown) {
      this.output.shutdown();
    } else {
      console.warn("HeatUnit.output.shutdown() is not defined.");
    }
    if (this.sensing.shutdown) {
      this.sensing.shutdown();
    } else {
      console.warn("HeatUnit.sensing.shutdown() is not defined.");
      
    }
  }
}

module.exports = HeatUnit;