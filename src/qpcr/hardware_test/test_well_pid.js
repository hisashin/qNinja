"use strict";
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");
this.plate = hardwareConf.getPlate();
this.plate.control();
this.plate.temperature;
this.plate.setTargetTemperature(plateTargetTemp);