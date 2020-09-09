"use strict";
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");
this.well = hardwareConf.getWell();
this.well.control();
this.well.temperature;
this.well.setTargetTemperature(wellTargetTemp);