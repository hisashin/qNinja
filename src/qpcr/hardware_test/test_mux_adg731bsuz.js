const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");
let mux = TLC59281DBQR();
mux.initialize();

let channel = 0;
const CHANNELS_COUNT = 32;
setInterval(()=>{
  mux.selectChannel(channel);
  channel = (channel + 1) % CHANNELS_COUNT;
}, 500);