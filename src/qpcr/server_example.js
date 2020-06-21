"use strict";
const NinjaQPCR = require("./ninjaqpcr");
//const hardwareConf = require("./conf/ninjaqpcr_hardware_conf.js");
const hardwareConf = require("./conf/dummy_hardware_conf.js");

const qpcr = new NinjaQPCR(hardwareConf)
const protocol = require("./protocol_example");

/* Implementation example */
class NinjaQPCRServerExample {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    qpcr.start(protocol);
    /*
    // Polling
     setInterval(()=>{ console.log(qpcr.getStatus()); }, 1000);
     setInterval(()=>{ console.log(qpcr.getThermalCyclerStatus()); }, 1000);
     setInterval(()=>{ console.log(qpcr.getFluorescenceLogs()); }, 10000);
    */
  }
  /* Callback functions */
  onThermalTransition (data) {
    console.log("onThermalTransition");
    console.log(data);
  }
  onThermalDataUpdate (data) {
    console.log("onThermalDataUpdate");
    console.log(data);
  }
  onFluorescenceDataUpdate (data) {
    console.log("onFluorescenceDataUpdate");
    console.log(data);
  }
}
new NinjaQPCRServerExample().start();
