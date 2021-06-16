"use strict";

class HeatLid {
  constructor () {
    this.temperature = 25;
    this.targetTemperature = 25;
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
  shutdown () {}
  off () {}
  start () {}
  
}
const DUMMY_TEMP_TRANSITION_PER_SEC = 1.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;
const getDummyTemp = (current, target, interval) => {
  if (current < target) {
    return Math.min(target, current + DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  } else {
    return Math.max(target, current - DUMMY_TEMP_TRANSITION_PER_SEC * interval / 1000.0);
  }
};

module.exports = HeatLid;