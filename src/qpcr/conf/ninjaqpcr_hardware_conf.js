"use strict";

const PID = require("../control/heat_control/pid.js");
const Thermistor = require("../hardware/thermistor.js");

class WellSensing {
  constructor () {
    // TODO: Define ADC channel
    // TODO: new Thermistor
    this.adc = null; // TODO
    this.thermistor = new Thermistor();
  }
  getTemperature () {
    // TODO: Read ADC
    // TODO: calculate
    return 42.0;
  }
}
class WellOutput {
  // Combination of heater (PWM) and fan (PWM)
  constructor () {
    // TODO: Define ADC channel
    // TODO: new Thermistor
    this.adc = null; // TODO
    this.thermistor = new Thermistor();
  }
  setOutput (outputValue) {
    // TODO: Set physical output here.
  }
  off () {
    // TODO: Turn off
  }
}
class HeatLidSensing {
  // TODO: Define ADC channel
  // TODO: Thermistor
  constructor () {
    
  }
  getTemperature () {
    // TODO: Get temperature.
    return 42.0;
  }
}
class HeatLidOutput {
  // Heater (with PWM)
  constructor () {
    
  }
  setOutput (outputValue) {
    // TODO: Set physical output here.
  }
  off () {
    // TODO: Turn off
  }
}

class NinjaQPCRHardwareConf {
  // TODO
  wellsCount () {
    return 8;
  }
  getWell () {
    // TODO
    const WELL_P = 1.0;
    const WELL_I = 1.0;
    const WELL_D = 1.0;
    const pid = new PID(LID_P, LID_I, LID_D);
    /*
    const sensing = new WellSensing (); // TODO replace with concrete thermistor unit or dummy
    const output = new WellOutput(); // TODO replace with concrete thermistor unit or dummy 
    return new HeatUnit(pid, sensing, output);
    */
  }
  getHeatLid () {
    // TODO
    const HEATER_P = 1.0;
    const HEATER_I = 1.0;
    const HEATER_D = 1.0;
    const pid = new PID(HEATER_P, HEATER_I, HEATER_D);
    /*
    const sensing = new HeatLidSensing (); // TODO replace with concrete thermistor unit or dummy
    const output = new HeatLidOutput(); // TODO replace with concrete thermistor unit or dummy 
    return new HeatUnit(pid, sensing, output);
    */
  }
  getLEDUnit () {
    // TODO
  }
  getFluorescenceSensingUnit () {
    // TODO
  }
};

module.exports = new NinjaQPCRHardwareConf();