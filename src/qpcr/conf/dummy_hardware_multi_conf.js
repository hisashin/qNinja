"use strict";
const PID = require("../control/heat_control/pid.js");

const HeatUnit = require("../control/heat_control/heat_unit.js");
const demoPlate = require("../control/plate_multi_demo.js");
const BoxMuller = require("../util/box_muller.js");


const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;


// Basic configuration
const OPTICS_CHANNELS_COUNT = 2;
const WELLS_COUNT = 16;
/* Constants and dependencies for testing */

const getDummyTemp = (current, target, interval) => {
  let transition = DUMMY_TEMP_TRANSITION_PER_SEC * (0.9 + 0.2 * Math.random());
  if (current < target) {
    return Math.min(target, current + transition * interval / 1000.0);
  } else {
    return Math.max(target, current - transition * interval / 1000.0);
  }
};

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
    Return HeatUnit object as implementation of the well.
    */
  getPlate () {
    return demoPlate;
  }
  /*
    Return HeatUnit object as implementation of the heater lid.
    */
  getHeatLids () {
    return [new HeatLid(), new HeatLid()];
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
    return new FluorescenceSensingUnit();
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
  select (wellIndex) {
    // Nothing to do
    // console.log("LED %d", wellIndex);
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
class FluorescenceSimulator {
  constructor() {
    this.wellIndex = 0;
    this.opticalChannel = 0;
    
  }
  start () {
    this.startTimestamp = new Date();
    this.debugValue = [];
    this.dummyValues = [];
    // Start with simulated background values
    for (let i=0; i<OPTICS_CHANNELS_COUNT * WELLS_COUNT; i++) {
      this.dummyValues[i] = this._getDummyBackground();
    }
  }
  select (wellIndex, opticalChannel) {
    this.wellIndex = wellIndex;
    this.opticalChannel = opticalChannel;
  }
  _index () {
    return this.wellIndex * OPTICS_CHANNELS_COUNT + this.opticalChannel;
  }
  getValue () {
    let value = 0;
    const index = this._index();
    if (this.debugValue.type == 3) {
      // Melt curve
      // TODO simulate melt curve
      const high = this.debugValue.high;
      const temperature = this.debugValue.currentTemp;
      value = this._getDummyMeltCurve(this.dummyValues[index], this.debugValue.current, this.debugValue.high, this.debugValue.low);
    } else {
      // Normal PCR
      value = this._getDummyAmplification(this.debugValue.cycle);
    }
    if (! (value >= 0)) value = 0.5;
    this.dummyValues[index] = value;
    return value;
  }
  // Dummy generator
  _getDummySigmoid (channel) {
    const elapsedMsec = (new Date().getTime() - this.startTimestamp.getTime());
    const thresholdMsec = 150 * 1000;
    const intercept = 6.0;
    const x =  ((elapsedMsec - thresholdMsec - channel * 10 * 1000)/thresholdMsec) * intercept;
    const sigmoid = MAX_ABSOLUTE_FLUORESCENCE / (1 + Math.exp(-x));
    return sigmoid;
  }
  _getDummyBackground (value) {
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
  _getDummyAmplification (cycle) {
    const AMP_F_START = 1.0;
    const AMP_F_MAX = 20000; // Plateau height
    const AMP_BETA = 0.6;
    const AMP_LAMBDA_DEFAULT = 20;
    const AMP_LAMBDA_STEP = 1.1;
    const lambda = AMP_LAMBDA_DEFAULT + AMP_LAMBDA_STEP * this.wellIndex * (1 + this.opticalChannel);
    const background = this._getDummyBackground();
    const amplification = AMP_F_START + AMP_F_MAX / (1 + Math.exp(AMP_BETA*(lambda-cycle)));
    return amplification + background;
  }
  
}
class FluorescenceSensingUnit {
  constructor () {
    this.sim = new FluorescenceSimulator();
  }
  start () {
    this.sim.start();
  }
  select (wellIndex, opticalChannel) {
    // console.log("MUX %d %d", wellIndex, opticalChannel);
    this.sim.select(wellIndex, opticalChannel);
  }
  measure(callback) {
    const value = this.sim.getValue();
    setTimeout(()=>{ callback(value); }, 10);
  }
  setDebugValue (debugValue) {
    this.sim.debugValue = debugValue;
  }
}
module.exports = new DummyHardwareConf();