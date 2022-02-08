"use strict";
// Requires sudo
const NinjaQPCR = require("../ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
const protocol = require("../protocol_thremal_only.js");
const em = require("../experiment_manager");
const startTime = new Date().getTime();
const DEBUG_TAG = "NINJA";
qpcr.setEventReceiver({
  onProgress:function (data) {
    // console.log(JSON.stringify(data));
    // console.log("%f\t%f", data.plate, data.lid);
    const timestamp = new Date().getTime() - startTime;
    // console.log(data)
    // console.log("%s\t%d\t%f\t%f", DEBUG_TAG, timestamp, data.plate, data.lid)
    console.log("%s\t%d\t%f\t%f\t%f\t%f", DEBUG_TAG, 
      timestamp, data.plate, data.lid, 
      data.detail.plate.air,
      data.detail.extra[1])
  }
});
const experiment = em.createExperimentDraft({protocol:protocol});
qpcr.start(experiment);

process.on('SIGINT', () => {
  console.log('demo_thermal_cycler.js Received SIGINT');
  qpcr.shutdown();
  qpcr.exit();
});