"use strict";
const PID = require("../control/heat_control/pid_simple.js");

const HeatUnit = require("../control/heat_control/heat_unit.js");
const demoPlate = require("../control/plate_multi_demo.js");
const HeatLidMulti = require("../control/heat_lid_multi.js");
const simulateCts = require("../ct_simulator");
const BoxMuller = require("../util/box_muller.js");

const DEBUG_COEFF = 1;
const EXCITATION_DURATION_MSEC = 25 * DEBUG_COEFF;
const MEASUREMENT_ALL_MIN_INTERVAL_MSEC = 4000 * DEBUG_COEFF;

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
  control (callback) {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
    setTimeout(callback, 10);
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
  getHeatLid () {
    const lids = [new HeatLid(), new HeatLid()];
    return new HeatLidMulti(lids);
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
const MELT_RANGES = [
  { tm:50, h:5, ratio:0.1}, // Total
  { tm:84, h:30, ratio:0.7}, // Main
  { tm:60, h:30, ratio:0.2}, // ?
];
class FluorescenceSimulator {
  constructor() {
    this.wellIndex = 0;
    this.opticalChannel = 0;
    this.cts = null;
    this.efficiency = 1;
  }
  start () {
    this.startTimestamp = new Date();
    this.debugValue = [];
    this.ampValues = [];
    // Start with simulated background values
    console.log("FluorescenceSimulator.start");
    for (let i=0; i<OPTICS_CHANNELS_COUNT * WELLS_COUNT; i++) {
      this.ampValues[i] = this._getDummyBackground();
    }
  }
  excitationDuration () { return EXCITATION_DURATION_MSEC; }
  measurementAllMinInterval () { return MEASUREMENT_ALL_MIN_INTERVAL_MSEC; }
  select (wellIndex, opticalChannel) {
    this.wellIndex = wellIndex;
    this.opticalChannel = opticalChannel;
  }
  _index () {
    return this.wellIndex * OPTICS_CHANNELS_COUNT + this.opticalChannel;
  }
  _getMeltCurve (initial, temp, tempMin, tempMax) {
    let val = 0;
    MELT_RANGES.forEach((range)=>{
      const cont =  - range.h * (temp - range.tm) / (tempMax - tempMin);
      val += range.ratio / (1 + Math.exp(cont));
    });
    return initial * (1.0 - val);
  }
  getValue () {
    let value = 0;
    const index = this._index();
    if (index == 0) {
      console.log("getValue " + JSON.stringify(this.debugValue));
    }
    if (this.debugValue.type == 3) {
      // Melt curve
      // TODO simulate melt curve
      const high = this.debugValue.high;
      const temperature = this.debugValue.currentTemp;
      value = this._getMeltCurve(this.ampValues[index], this.debugValue.current, this.debugValue.low, this.debugValue.high);
      if (index == 0) {
        console.log("Melt curve %f, Current=%f, Low=%f, High=%f => %f", 
        this.ampValues[index], 
        this.debugValue.current, 
        this.debugValue.low, 
        this.debugValue.high, function () {
          
        },
        value);
      }
    } else {
      // Normal PCR
      value = this._getDummyAmplification(this.debugValue.cycle);
      this.ampValues[index] = value;
    }
    if (! (value >= 0)) value = 0.5;
    return value;
  }
  // Dummy generator
  _getDummySigmoid (channel) {
    const elapsedMsec = (new Date().getTime() - this.startTimestamp.getTime());
    const thresholdMsec = 150 * 1000;
    const intercept = 6.0;
    const x =  ((elapsedMsec - thresholdMsec - channel * 10 * 1000)/thresholdMsec) * intercept;
    const sigmoid = MAX_ABSOLUTE_FLUORESCENCE / (1.0 + Math.exp(-x));
    return sigmoid;
  }
  _getDummyBackground (value) {
    return Math.max(0, DUMMY_BASELINE_OFFSET + BoxMuller() * DUMMY_BASELINE_MULTIPLIER);
    // return DUMMY_BASELINE_MULTIPLIER;
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
  _getCt () {
    if (this.cts) {
      const ct =  this.cts[this.opticalChannel][this.wellIndex];
      return ct;
    }
    return AMP_LAMBDA_STEP * this.wellIndex * (1 + this.opticalChannel);
  }
  _getDummyMax () {
    return 2000  + (this.opticalChannel + 1) * 9000 + this.wellIndex * 100;
  }
  _getDummyAmplification (cycle) {
    const AMP_F_START = 1.0;
    const AMP_F_MAX = this._getDummyMax(); // 20000.0; // Plateau height
    const AMP_BETA = 0.6;
    const AMP_LAMBDA_DEFAULT = 20;
    const AMP_LAMBDA_STEP = 1.1;
    const lambda = AMP_LAMBDA_DEFAULT + this._getCt();
    const background = this._getDummyBackground();
    const amplification = AMP_F_START + AMP_F_MAX / (1.0 + Math.pow((1.0 + this.efficiency), (this._getCt()-cycle)));
    const tmpB = (1.0 + Math.pow((1.0 + this.efficiency), (this._getCt()-cycle)));
    const tmpC = 1.0 + this.efficiency;
    const tmpD = this._getCt();
    const tmpE = this._getCt()-cycle;
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
  setDebugTemp (temp) {
    if (this.sim.debugValue) {
      this.sim.debugValue.current = temp;
    }
  }
  excitationDuration () { return EXCITATION_DURATION_MSEC; }
  measurementAllMinInterval () { return MEASUREMENT_ALL_MIN_INTERVAL_MSEC; }
  setDebugValue (debugValue, experimentConfig) {
    this.sim.debugValue = debugValue;
    // Calc experimentConfig
    if (!this.sim.cts) {
      const efficiency = 0.93; // 0.9 to 1.1
      if (experimentConfig) {
        const cts = [simulateCts(experimentConfig, efficiency), simulateCts(experimentConfig, efficiency)];
        this.sim.cts = cts;
      }
      this.sim.efficiency = efficiency;
    }
  }
}
module.exports = new DummyHardwareConf();