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
    // TODO: Read ADC
    // TODO: calculate
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

class LEDUnit {
  construtor () {
  }
  start () {
    // TODO: init LED driver / init 
  }
  selectChannel (channel) {
    // TODO: turn on PWM
    // TODO: set potentiometer output
    // TODO: select channel
  }
  off () {
    // TODO turn off PWM
  }
}

class NinjaQPCRHardwareConf {
  // TODO
  wellsCount () {
    return 8;
  }
  getWell () {
    // TODO
    const WELL_KP = 1.0;
    const WELL_KI = 1.0;
    const WELL_KD = 1.0;
    const pid = new PID(LID_KP, LID_KI, LID_KD);
    const sensing = new WellSensing ();
    const output = new WellOutput();
    return new HeatUnit(pid, sensing, output);
  }
  getHeatLid () {
    // TODO
    const HEATER_KP = 1.0;
    const HEATER_KI = 1.0;
    const HEATER_KD = 1.0;
    const pid = new PID(HEATER_KP, HEATER_KI, HEATER_KD);
    const sensing = new HeatLidSensing ();
    const output = new HeatLidOutput();
    return new HeatUnit(pid, sensing, output);
  }
  getLEDUnit () {
    return new LEDUnit();
  }
  getFluorescenceSensingUnit () {
    // TODO
    return null;
  }
};

module.exports = new NinjaQPCRHardwareConf();