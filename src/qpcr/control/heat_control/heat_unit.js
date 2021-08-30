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
    this.temperature = 0.0; // Representative temperature (in Celsius)
    this.targetTemperature = 0.0; // PID target temperature (in Celsius)
    this.measurement = null; // Detailed temperature data object (may include multiple values)
    this.measurementTimestamp = null;
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
    this.sensing.measureTemperature ((temperature, detailedMeasurement)=>{
      this.measurement = detailedMeasurement;
      this.measurementTimestamp = new Date().getTime();
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
  measureTemperature (callback, expirationMsec) {
    if (expirationMsec > 0 && this.measurementTimestamp > 0 && this.measurementTimestamp + expirationMsec > new Date().getTime()) {
      // Latest measurement data is cached. Callback immediately.
      callback(this.measurement);
    } else {
      // Measurement data is expired or not existing
      this.sensing.measureTemperature ((temperature, detailedMeasurement)=>{
        this.measurement = detailedMeasurement;
        this.measurementTimestamp = new Date().getTime();
        this.temperature = temperature;
        callback(this.measurement);
      });
    }
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