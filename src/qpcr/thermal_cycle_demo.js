"use strict";
// Requires sudo
const NinjaQPCR = require("./ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
//const protocol = require("./protocol_example");
const protocol = require("./protocol_thremal_only.js");

process.on('SIGINT', () => {
    console.log('Received SIGINT');
    qpcr.shutdown();
    process.exit(1);
});
qpcr.setEventReceiver({
  onProgress:function (data) {
    console.log(JSON.stringify(data));
    console.log("%f\t%f", data.well, data.lid);
  }
});
qpcr.start(protocol, {});