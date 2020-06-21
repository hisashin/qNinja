"use strict";
// TLC59281DBQR test
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");


const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 3; // Pin number
const PIN_BLANK = 23; // GPIO{n} num
const CHANNEL_COUNT = 8; //16;
const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, PIN_BLANK, 1000 /* Hz (=1kHz) */);
ledDriver.start();
let channel = 0;
let duty = 0.0;
setInterval(()=>{
  if (channel == 0) {
    ledDriver.setDuty(1.0-duty);
    duty += 0.1;
    if (duty > 1.0) {
      duty = 0.0;
    }
  }
  ledDriver.selectChannel(channel);
  channel = (channel + 1) % CHANNEL_COUNT;
}, 100);
