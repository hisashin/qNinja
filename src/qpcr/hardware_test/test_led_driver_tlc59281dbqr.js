// TLC59281DBQR test
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");


const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 3; // TODO GPIO
const PIN_BLANK = 2; // TODO GPIO
const CHANNEL_COUNT = 16;
const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, PIN_BLANK);
ledDriver.initialize();
let channel = 0;
setInterval(()=>{
  ledDriver.selectChannel(channel);
  channel = (channel + 1) % CHANNEL_COUNT;
}, 200);