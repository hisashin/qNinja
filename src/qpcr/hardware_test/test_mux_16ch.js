"use strict";
const MUX16ch = require("../hardware/mux_16ch.js");

let mux = new MUX16ch(0, 1, 2, 3);
mux.initialize();

let channel = 0;
const CHANNELS_COUNT = 16;
setInterval(()=>{
  mux.selectChannel(channel);
  channel = (channel + 1) % CHANNELS_COUNT;
}, 500);