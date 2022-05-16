"use strict";

const USE_DUMMY = false;
const hardwareFile = (USE_DUMMY) ? "hardware_dummy.json" : "hardware.json";
console.log(hardwareFile)
const NinjaQPCR = require("../ninjaqpcr.js");
const eventBus = require("../lib/event_bus.js");
const OpticsSession = require("../session_optics.js");

const qpcr = new NinjaQPCR(hardwareFile);
// const hardwareConf = require(hardwareFiile);
const Optics = qpcr.optics;
const TARGET_TUBE = parseInt(process.argv[2]);

const SINGLE_TARGET_WELL_INDEX = 7;
let rpio = null;
if (!USE_DUMMY) {
  rpio = require('rpio');
}

const session = new OpticsSession();
qpcr.setSession(session);
session.start();
eventBus.subscribe("optics.update", (topic, values)=>{
  // console.log("----");
  // console.log(values.map(v=>v.v + "\t" + v.r + "\t" + v.w).join("\n"))
  // if (measurementCount%2==1)
  console.log("%f\t%f\t%d",values[TARGET_TUBE].r, values[TARGET_TUBE].v, values[TARGET_TUBE].iref)
  // console.log(values[4])
  // console.log(JSON.stringify(values))
});
function _transformValues (values) {
  let data = [];
  // Separate North & South
  for (let block = 0; block < 2; block++) {
    let row = [];
    for (let i=0; i<8; i++) {
      let id = block * 8 + i;
      let obj = {};
      obj.id = id;
      row.push(obj);
    }
    data.push(row);
  }
  return data;
}
process.on('SIGINT', () => {
    console.log('demo_optics_batch8.js Received SIGINT');
    session.shutdown();
    qpcr.exit();
});


