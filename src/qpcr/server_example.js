"use strict";
const qpcr = require("./ninjaqpcr");
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
