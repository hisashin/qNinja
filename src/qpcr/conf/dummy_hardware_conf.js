"use strict";

const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");

const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;

/* Constants and dependencies for testing */

const getDummyTemp = (current, target, interval) => {
  if (current < target) {
    return Math.min(target, current + DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  } else {
    return Math.max(target, current - DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  }
};

// instance of HeatUnit
class Well {
  constructor () {
    this.temperature = 25;
    this.targetTemperature = 25;
  }
  start () {
    // Initialize hardware. This function is called once at the first run.
  }
  setTargetTemperature (targetTemperature) {
    this.targetTemperature = targetTemperature;
  }
  control () {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
  }
  off () {
    // Do nothing
  }
}

// instance of HeatUnit
class HeatLid {
  constructor () {
    this.temperature = 25;
    this.targetTemperature = 25;
  }
  start () {
    // Initialize hardware. This function is called once at the first run.
  }
  setTargetTemperature (targetTemperature) {
    this.targetTemperature = targetTemperature;
  }
  control () {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
  }
  off () {
    // Do nothing
  }
  
}

// instance of HeatUnit
/*
  Dummy hardware conf
  (Without any hardware control.
  This config is for development.)
  */
  
class DummyHardwareConf {
  /*
    Return number of wells
    */
  wellsCount () {
    return 8;
  }
  /*
    Return HeatUnit object as implementation of the well.
    */
  getWell () {
    return new Well ();
    /*
    const WELL_P = 1.0;
    const WELL_I = 1.0;
    const WELL_D = 1.0;
    const pid = new PID(LID_P, LID_I, LID_D);
    const sensing = new Sensing (); // TODO replace with concrete thermistor unit or dummy
    const output = new DummyOutput(); // TODO replace with concrete thermistor unit or dummy 
    return new HeatUnit(pid, sensing, output);
    */
  }
  /*
    Return HeatUnit object as implementation of the heater lid.
    */
  getHeatLid () {
    return new HeatLid ();
    /*
    const HEATER_P = 1.0;
    const HEATER_I = 1.0;
    const HEATER_D = 1.0;
    const pid = new PID(HEATER_P, HEATER_I, HEATER_D);
    const sensing = new Sensing (); // TODO replace with concrete thermistor unit or dummy
    const output = new DummyOutput(); // TODO replace with concrete thermistor unit or dummy 
    return new HeatUnit(pid, sensing, output);
    */
  }
  // TODO support ambient temp sensor
  /*
    Return LED control (Including MUX, POT and LED driver)
    */
  getLEDUnit () {
    return new LEDUnit();
  }
  /*
    Return fluorescence measurement unit (Including MUX)
    */
  getFluorescenceSensingUnit() {
    return new DummyFluorescenceSensingUnit();
  }
};
const MAX_ABSOLUTE_FLUORESCENCE = 0.7;
const DUMMY_BASELINE_RATIO = 0.05;
class LEDUnit {
  construtor () {
    // Nothing to do
  }
  start () {
    // Nothing to do
    
  }
  selectChannel (channel) {
    // Nothing to do
  }
  off () {
    // Nothing to do
  }
}
class DummyFluorescenceSensingUnit {
  constructor () {
  }
  start () {
    this.startTimestamp = new Date();
  }
  select (well) {
    // Do nothing
  }
  getDummySigmoid (channel) {
    const elapsedMsec = (new Date().getTime() - this.startTimestamp.getTime());
    const thresholdMsec = 150 * 1000;
    const intercept = 6.0;
    const x =  ((elapsedMsec - thresholdMsec - channel * 10 * 1000)/thresholdMsec) * intercept;
    const sigmoid = MAX_ABSOLUTE_FLUORESCENCE / (1 + Math.exp(-x));
    return sigmoid;
  }
  getDummyBaseline (value) {
    return 0.1 + Math.random() * DUMMY_BASELINE_RATIO *  (MAX_ABSOLUTE_FLUORESCENCE-value)/MAX_ABSOLUTE_FLUORESCENCE;
  }
  measure(well, callback) {
    let value = this.getDummySigmoid(well.index);
    value += this.getDummyBaseline(value);
    setTimeout(()=>{ callback(value); }, 10);
  }
}
module.exports = new DummyHardwareConf();