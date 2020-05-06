"use strict";
const qpcr = require("./ninjaqpcr");
/* Implementation example */
class NinjaQPCRServerExample {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    const protocol = {
      lidTemp: 110,
      cycles: [
        {
          repeat: 1,
          steps: [
            { type:"initial denaturation", temp:94.0, duration:15.0 }
          ]
        },
        {
          repeat: 30,
          steps: [
            { type:"denaturation", temp:94.0, duration:15.0 },
            { type:"annealing", temp:55.0, duration:15.0 },
            { type:"extension", temp:72.0, duration:15.0 }
          ]
        },
        {
          repat: 1,
          steps: [
            { type:"final extension", temp:72.0, duration:30.0 }
          ]
        }
      ]
    };
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
