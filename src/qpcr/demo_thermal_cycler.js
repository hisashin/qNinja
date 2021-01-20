"use strict";
// Requires sudo
const NinjaQPCR = require("./ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
//const protocol = require("./protocol_example");
const protocol = require("./protocol_thremal_only.js");
const ExperimentManager = require("./experiment_manager");
const em = new ExperimentManager();

qpcr.setEventReceiver({
  onProgress:function (data) {
    console.log(JSON.stringify(data));
    console.log("%f\t%f", data.well, data.lid);
  }
});
const experiment = em._createExperimentDraft({protocol:protocol});
qpcr.start(experiment);

process.on('SIGINT', () => {
    console.log('Received SIGINT');
    qpcr.shutdown();
    process.exit(1);
});