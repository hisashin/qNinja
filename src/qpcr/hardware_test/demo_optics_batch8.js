"use strict";

const USE_DUMMY = false;
const hardwareFile = (USE_DUMMY) ? "hardware_dummy.json" : "hardware.json";
const NinjaQPCR = require("../ninjaqpcr.js");
const eventBus = require("../lib/event_bus.js");
const OpticsSession = require("../session_optics.js");

const qpcr = new NinjaQPCR(hardwareFile);
// const hardwareConf = require(hardwareFiile);
const Optics = qpcr.optics;

const SINGLE_TARGET_WELL_INDEX = 7;
let rpio = null;
if (!USE_DUMMY) {
  rpio = require('rpio');
}

const session = new OpticsSession();
qpcr.setSession(session);
session.runOpticsDemo();
eventBus.subscribe("optics.update", (topic, values)=>{
  console.log(_transformValues(values)[0][3]);
});
function _transformValues (values) {
  let data = [];
  for (let block = 0; block < 2; block++) {
    let row = [];
    for (let i=0; i<8; i++) {
      let id = block * 8 + i;
      let obj = {};
      obj.id = id;
      obj.c0 = values[0][i].v;
      obj.s0 = values[0][i].s;
      obj.c1 = values[1][i].v;
      obj.s1 = values[1][i].s;
      row.push(obj);
    }
    data.push(row);
  }
  return data;
}
process.on('SIGINT', () => {
    console.log('demo_optics_batch8.js Received SIGINT');
    session.shutdown();
    process.exit(1);
});
