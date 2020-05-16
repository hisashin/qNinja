"use strict";

const PID = require("../control/heat_control/pid.js");

class NinjaQPCRHardwareConf {
  // TODO
  wellsCount () {
    return 8;
  }
  getWell () {
    // TODO
  }
  getHeatLid () {
    // TODO
  }
  getLEDUnit () {
    // TODO
  }
  getFluorescenceSensingUnit () {
    // TODO
  }
};

module.exports = new NinjaQPCRHardwareConf();