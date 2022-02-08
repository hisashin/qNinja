"use strict";

const USE_DUMMY = true;
const hardwareFile = (USE_DUMMY) ? "hardware_dummy.json" : "hardware.json";
const NinjaQPCR = require("../ninjaqpcr.js");
const eventBus = require("../lib/event_bus.js");
const PlateControlSession = require("../session_plate_control.js");

const qpcr = new NinjaQPCR(hardwareFile);
// const hardwareConf = require(hardwareFiile);
const Optics = qpcr.optics;

const SINGLE_TARGET_WELL_INDEX = 7;
let rpio = null;
if (!USE_DUMMY) {
  rpio = require('rpio');
}

const session = new PlateControlSession();
qpcr.setSession(session);
session.start();
// Parse argv
let values = process.argv.filter((v, i)=>{return i>=2}).map(v=>parseFloat(v));
if (values.length == 3) {
  session.setOutput(values[0], values[1], values[2]);
} else {
  session.setOutput(0, 0, 1.0);
}
eventBus.subscribe("plate.update", (topic, values)=>{
  console.log(values);
});
process.on('SIGINT', () => {
    console.log('demo_plate_control_batch11.js Received SIGINT');
    session.shutdown();
    qpcr.exit();
});
