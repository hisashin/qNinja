"use strict";
// TLC59281DBQR test
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");
const rpio = require('rpio');

const DEFAULT_CHANNEL = 7;

const SPI_CHANNEL = "/dev/spidev0.0";
const CHANNEL_COUNT = 16; //16;
const PIN_LATCH = 15;
const PIN_NAME_BLANK= 23; //26(ADA) 23 (Free)

const PIN_NUM_SPI_SWITCH = 18; //GPIO5
const VALUE_SPI_SWITCH_LED = rpio.LOW;

rpio.open(32, rpio.INPUT);
rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, VALUE_SPI_SWITCH_LED);

const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, /*PIN_NAME_BLANK*/0, 1000 /* Hz (=1kHz) */);
ledDriver.start();
let channel = 0;
let duty = 0.0;
let vals = [0,0,0,0];

const arg = process.argv[2];
console.log(arg);
if (arg == "all") {
  ledDriver.onAll();
  console.log("on all");
   
} else {
  const channelArgv = parseInt(arg);
  const ledChannel = (channelArgv >= 0) ? channelArgv : DEFAULT_CHANNEL;
  console.log("on " + ledChannel);
  ledDriver.selectChannel(ledChannel);
}
/*
setInterval(()=>{
  if (channel == 0) {
    ledDriver.setDuty(1.0 - duty);
    duty += 0.1;
    if (duty > 1.0) {
      duty = 0.0;
    }
    console.log("duty=%f", duty);
  }
  ledDriver.selectChannel(TARGET_CHANNEL);
  channel = (channel + 1) % CHANNEL_COUNT;
}, 200);
*/
