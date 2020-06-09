//const conf = require("./conf/ninjaqpcr_hardware_conf.js");
const conf = require("./conf/dummy_hardware_conf.js");
this.well = conf.getWell();
  this.well.control();
  this.well.temperature;
    this.well.setTargetTemperature(wellTargetTemp);