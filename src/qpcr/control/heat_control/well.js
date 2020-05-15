"use strict";

class WellSensing {
  constructor () {
  }
  getTemperature () {
    // TODO: Get temperature.
    return 42.0;
  }
}
class WellOutput {
  constructor () {
  }
  setOutput (outputValue) {
    // TODO: Set physical output here.
  }
}
const WELL_P = 0;
const WELL_I = 0;
const WELL_D = 0;
const wellPID = new PID(LID_P, LID_I, LID_D);
const wellSensing = new WellSensing();
const wellOutput = new WellOutput();
const wellUnit = new HeatUnit(wellPID, wellSensing, wellOUtput);