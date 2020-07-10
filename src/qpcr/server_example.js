"use strict";
const NinjaQPCR = require("./ninjaqpcr");
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");

const qpcr = new NinjaQPCR(hardwareConf)
// const protocol = require("./protocol_example");
const protocol = require("./dev_protocol");

/* Implementation example */
class NinjaQPCRServerExample {
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
  onThermalTransition (data) {
    console.log(data);
  }
  onProgress (progress) {
    console.log("TEMP\t%f\t%f", progress.well, progress.lid);
  }
  onFluorescenceDataUpdate (data) {
    console.log(data);
  }
  onComplete () {
    this.isRunning = false;
  }
  onDeviceStateChange (state) {
    console.log(state);
  }
}
new NinjaQPCRServerExample().start();
