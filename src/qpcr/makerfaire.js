"use strict";

// Simple blinkey for MakerFaire Tokyo 2020
const hardwareConf = require("./conf/makerfaire_hardware_conf.js");

hardwareConf.start();
const led = hardwareConf.getLEDUnit();
led.start();
const INTERVAL = 200;
const channelsCount = 16;
const CHANNELS = [
  0,1,2,3,4,5,6,7,
  15,14,13,12,11,10,9,8
];

let channelIndex = 0;
setInterval(()=>{
  led.select(CHANNELS[channelIndex]);
  channelIndex = (channelIndex + 1) % CHANNELS.length;
}, INTERVAL);