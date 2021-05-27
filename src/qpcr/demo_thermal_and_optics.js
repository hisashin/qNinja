"use strict";
// Requires sudo
const NinjaQPCR = require("./ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
const protocol = require("./protocol_thremal_only.js");
const em = require("./experiment_manager");

const USE_DUMMY = false;
//const hardwareConf = (USE_DUMMY) ? require("./conf/dummy_hardware_multi_conf.js") : require("./conf/batch3_hardware_conf.js");
//const Optics = require("./control/optics.js");
//const SINGLE_TARGET_WELL_INDEX = 7;
/*
*/
let rpio = null;
if (!USE_DUMMY) {
  rpio = require('rpio');
}

// Run optics demo with batch3 boards.
class OpticsDemo {
  constructor (optics) {
    this.optics = optics;
    if (!USE_DUMMY) {
      rpio.open(32, rpio.INPUT); // To disable PWM pin for ADA2200's RCLK
    }
  }
  runOpticsDemo () {
    console.log("runOpticsDemo");
    // Combination of LED and Photosensing
    this.optics.start();
    this.opticsStarted = true;
    setInterval(()=>{
      console.log("=== MEASURE_ALL ===");
      this.optics.measureAll((values)=>{
        console.log(values);
      });
    }, 3000);
  }
}

qpcr.setEventReceiver({
  onProgress:function (data) {
    console.log(JSON.stringify(data));
    console.log("%f\t%f", data.plate, data.lid);
  }
});
const execDemo = ()=>{
  const experiment = em._createExperimentDraft({protocol:protocol});
  qpcr.start(experiment);
  const demo = new OpticsDemo(qpcr.optics);
  demo.runOpticsDemo();
};

process.on('SIGINT', () => {
    console.log('Received SIGINT');
    qpcr.shutdown();
    process.exit(1);
});

execDemo();