"use strict";
const NinjaQPCR = require("./ninjaqpcr");
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");

const qpcr = new NinjaQPCR(hardwareConf)
// const protocol = require("./protocol_example");
const protocol = require("./dev_protocol");

const experimentConf = 
{
  name: "Example Name",
  wells: [
    { id:0, label:"Sample A", quantity:0.1 },
    { id:1, label:"Sample B", quantity:0.2 },
    { id:2, label:"Sample C", quantity:0.3 },
    { id:3, label:"Sample D", quantity:0.4 },
    { id:4, label:"Sample E", quantity:0.5 },
    { id:5, label:"Sample F", quantity:0.6 },
    { id:6, label:"Sample G", quantity:0.7 },
    { id:7, label:"Sample H", quantity:0.8 }
  ]
};

/* Implementation example */
class NinjaQPCRDemo {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    qpcr.start(protocol, experimentConf);
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
