"use strict";
// This dummy hardware conf uses legacy Plate implementation. Use "dummy_hardware_multi_conf.js" instead.
const PID = require("../control/heat_control/pid_simple.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");
const BoxMuller = require("../util/box_muller.js");

const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;

// Basic configuration
const OPTICS_CHANNELS_COUNT = 2;
const WELLS_COUNT = 16;
const DEBUG_COEFF = 1;
const EXCITATION_DURATION_MSEC = 25 * DEBUG_COEFF;
const MEASUREMENT_ALL_MIN_INTERVAL_MSEC = 4000 * DEBUG_COEFF;

/* Constants and dependencies for testing */

const getDummyTemp = (current, target, interval) => {
  if (current < target) {
    return Math.min(target, current + DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  } else {
    return Math.max(target, current - DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  }
};

// instance of HeatUnit
class Plate {
  constructor () {
    this.temperature = 25;
    this.targetTemperature = 25;
    this.sensing = {};
    this.output = {};
  }
  start () {
    // Initialize hardware. This function is called once at the first run.
  }
  setTargetTemperature (targetTemperature) {
    this.targetTemperature = targetTemperature;
  }
  control (callback) {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
    callback();
  }
  getTemperature () {
    return this.temperature;
  }
  off () {
    // Do nothing
  }
  measureTemperature (callback, expirationMsec) {
    let obj = {
      main: this.temperature + Math.random() * 0.3,
      air: this.temperature + Math.random() * 0.3,
      block: this.temperature + Math.random() * 0.3
    };
    callback(obj);
  }
  shutdown () {
    console.log("Shutting down dummy plate.");
    this.off();
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
  control (callback) {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
    callback();
  }
  getTemperature () {
    return this.temperature;
  }
  off () {
    // Do nothing
  }
  measureTemperature (callback, expirationMsec) {
    let obj = {
      main: this.temperature + Math.random() * 0.3
    };
    callback(obj);
  }
  shutdown () {
    console.log("Shutting down dummy heat lid.");
    this.off();
  }
  
}

// instance of HeatUnit
/*
  Dummy hardware conf
  (Without any hardware control.
  This config is for development.)
  */
  
class DummyHardwareConf {
  start () {
    
  }
  /* Hardware specifications */
  wellsCount () {
    return WELLS_COUNT;
  }
  opticsChannelsCount () {
    return OPTICS_CHANNELS_COUNT;
  }
  /*
    Return HeatUnit object as implementation of the plate.
    */
  getPlate () {
    return new Plate ();
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
  select (well) {
    // Nothing to do
  }
  off () {
    // Nothing to do
  }
  shutdown () {
    console.log("Shutting down dummy LED unit.");
  }
}
const DUMMY_BASELINE_MULTIPLIER = 10;
const DUMMY_BASELINE_OFFSET = 30;
class DummyFluorescenceSensingUnit {
  constructor () {
  }
  start () {
    this.startTimestamp = new Date();
    this.debugValue = null;
    this.dummyValues = [];
  }
  select (well) {
    // Do nothing
  }
  excitationDuration () { return EXCITATION_DURATION_MSEC; }
  measurementAllMinInterval () { return MEASUREMENT_ALL_MIN_INTERVAL_MSEC; }
  getDummySigmoid (channel) {
    const elapsedMsec = (new Date().getTime() - this.startTimestamp.getTime());
    const thresholdMsec = 150 * 1000;
    const intercept = 6.0;
    const x =  ((elapsedMsec - thresholdMsec - channel * 10 * 1000)/thresholdMsec) * intercept;
    const sigmoid = MAX_ABSOLUTE_FLUORESCENCE / (1 + Math.exp(-x));
    return sigmoid;
  }
  getDummyBaseline (value) {
    return Math.max(0, BoxMuller() * DUMMY_BASELINE_MULTIPLIER);
  }
  _getDummyMeltCurve (start, current, high, low) {
    const range = 12;
    const offset =1-1/(1+Math.exp(range/2));
    const normalized = 
        range*((current-low)/(high-low)-0.5);
    const sigmoid =1/(1+Math.exp(normalized));
    const value = start * sigmoid/offset;
    return value;
  }
  _getDummyAmplification (wellIndex, cycle) {
    const AMP_F_START = 1.0;
    const AMP_F_MAX = 20000; // Plateau height
    const AMP_BETA = 0.6;
    const AMP_LAMBDA_DEFAULT = 20;
    const AMP_LAMBDA_STEP = 1.1;
    const lambda = AMP_LAMBDA_DEFAULT + AMP_LAMBDA_STEP * wellIndex;
    const background = this.getDummyBaseline();
    const amplification = AMP_F_START + AMP_F_MAX / (1 + Math.exp(AMP_BETA*(lambda-cycle)));
    return amplification + background;
  }
  measure(wellIndex, callback) {
    let value = 0;
    if (this.debugValue != null) {
      if (this.debugValue.type == 3) {
        // Melt curve
        // TODO simulate melt curve
        const high = this.debugValue.high;
        const temperature = this.debugValue.currentTemp;
        value = this._getDummyMeltCurve(this.dummyValues[wellIndex], this.debugValue.current, this.debugValue.high, this.debugValue.low);
      } else {
        value = this._getDummyAmplification(wellIndex, this.debugValue.cycle);
        while (this.dummyValues.length <= wellIndex) {
          this.dummyValues.push(0);
        }
        this.dummyValues[wellIndex] = value;
        
      }
    } else {
      console.warn("debugValue is null.");
    }
    setTimeout(()=>{ callback(value); }, 10);
  }
}
module.exports = new DummyHardwareConf();