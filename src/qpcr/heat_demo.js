"use strict";
// Requires sudo
const HeatWorkbench = require("./heat_workbench");
const hardwareConf = require("./conf/ninjaqpcr_heat_only_conf.js");
// const hardwareConf = require("./conf/dummy_hardware_conf.js");

const wb = new HeatWorkbench(hardwareConf);
wb.run();