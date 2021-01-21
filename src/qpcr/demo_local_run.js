"use strict";
const NinjaQPCR = require("./ninjaqpcr");

const qpcr = new NinjaQPCR("hardware.json");
// const protocol = require("./protocol_example");
const protocol = require("./dev_protocol");

const ExperimentManager = require("./experiment_manager");
const em = new ExperimentManager();

const NO_SAVE = false;

/* Implementation example */
class NinjaQPCRDemo {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    const option = {
      protocol: protocol
    };
    if (NO_SAVE) {
      const experiment = em._createExperimentDraft(option);
      qpcr.start(experiment);
      this.isRunning = true;
    } else {
      em.create(option, (experiment)=>{
        qpcr.start(experiment);
        this.isRunning = true;
      }, (err)=>{
        console.error(err);
      })
    }
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
    console.log(data);
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
process.on('SIGINT', () => {
    console.log('Received SIGINT');
    qpcr.shutdown();
    process.exit(1);
});
