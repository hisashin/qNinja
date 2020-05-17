"use strict";

const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");

const DUMMY_TEMP_TRANSITION_PER_SEC = 1.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;

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
    return new DummyLEDUnit();
  }
  /*
    Return fluorescence measurement unit (Including MUX)
    */
  getFluorescenceSensingUnit() {
    return new DummyFluorescenceSensingUnit();
  }
};
class DummyLEDUnit {
  // TODO set light strength
  // TODO select next channnel (Switch MUX / Set current value) 
}
class DummyFluorescenceSensingUnit {
  // TODO read ADC and convert to physical value
  // TODO switch MUX
}
module.exports = new DummyHardwareConf();