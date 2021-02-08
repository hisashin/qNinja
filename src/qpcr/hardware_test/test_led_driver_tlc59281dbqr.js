"use strict";
// TLC59281DBQR test
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");
const rpio = require('rpio');


const SPI_CHANNEL = "/dev/spidev0.0";
const CHANNEL_OFFSET = 0;
const CHANNEL_COUNT = 16; //16;
const PIN_LATCH = 15;
const PIN_NAME_BLANK= 23; //26(ADA) 23 (Free)

rpio.open(32, rpio.INPUT);

const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, /*PIN_NAME_BLANK*/0, 1000 /* Hz (=1kHz) */);
ledDriver.start();
let channel = 0;
let duty = 0.0;
setInterval(()=>{
  if (channel == 0) {
    ledDriver.setDuty(1.0 - duty);
    duty += 0.1;
    if (duty > 1.0) {
      duty = 0.0;
    }
    console.log("duty=%f", duty);
  }
  // ledDriver.selectChannel(channel);
  const ch = CHANNEL_OFFSET+channel;
  console.log(ch);
  // ledDriver.selectChannel(ch);
  ledDriver.selectChannel(15);
  channel = (channel + 1) % CHANNEL_COUNT;
}, 200);
