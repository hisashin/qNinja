"use strict";

class LidSensing {
  constructor () {
  }
  getTemperature () {
    // TODO: Get temperature.
    return 42.0;
  }
}
class LidOutput {
  constructor () {
  }
  setOutput (outputValue) {
    // TODO: Set physical output here.
  }
}
const LID_P = 0;
const LID_I = 0;
const LID_D = 0;
const lidPID = new PID(LID_P, LID_I, LID_D);
const lidSensing = new LidSensing();
const lidOutput = new LidOutput();
const heatUnit = new HeatUnit(lidPID, lidSensing, lidOUtput);