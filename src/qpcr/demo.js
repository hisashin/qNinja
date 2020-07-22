"use strict";
const NinjaQPCR = require("./ninjaqpcr");
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");

const qpcr = new NinjaQPCR(hardwareConf)
// const protocol = require("./protocol_example");
const protocol = require("./dev_protocol");

/* Implementation example */
class NinjaQPCRDemo {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    qpcr.start(protocol);
    this.isRunning = true;
    /*
    // Polling
     setInterval(()=>{ console.log(qpcr.getDeviceState()); }, 1000);
     setInterval(()=>{ console.log(qpcr.getExperimentStatus()); }, 1000);
     setInterval(()=>{ console.log(qpcr.getThermalCyclerStatus()); }, 1000);
     setInterval(()=>{ console.log(qpcr.getFluorescenceLogs()); }, 10000);
    */
  }
  /* Callback functions */
  onStart (data) {
    console.log(data);
  }
  onComplete (data) {
    console.log(data);
  }
  onThermalTransition (data) {
    // console.log(data);
  }
  onProgress (data) {
    // console.log(data);
  }
  onFluorescenceDataUpdate (data) {
    // console.log(data);
  }
  onFluorescenceEvent (data) {
    // optics.start / optics.stop / optics.measure / optics.baseline
    console.log(data);
  }
  onComplete () {
    this.isRunning = false;
  }
  onDeviceStateChange (state) {
    console.log(state);
  }
}
new NinjaQPCRDemo().start();
