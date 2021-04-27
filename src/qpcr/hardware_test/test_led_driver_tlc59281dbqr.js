"use strict";
// TLC59281DBQR test
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");
const rpio = require('rpio');


const SPI_CHANNEL = "/dev/spidev0.0";
const CHANNEL_OFFSET = 0;
const CHANNEL_COUNT = 16; //16;
const PIN_LATCH = 15;
const PIN_NAME_BLANK= 23; //26(ADA) 23 (Free)
const PIN_NUM_SPI_SWITCH = 18; //GPIO5
const VALUE_SPI_SWITCH_MUX = rpio.LOW;

rpio.open(32, rpio.INPUT);

rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, VALUE_SPI_SWITCH_MUX);
const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, /*PIN_NAME_BLANK*/0, 1000 /* Hz (=1kHz) */);
ledDriver.start();
let channel = 0;
let duty = 0.0;
let switchVal = true;
const interval = setInterval(()=>{
  if (channel == 0) {
    switchVal = !switchVal;
    console.log("Switch. %d", switchVal);
    const v = (switchVal)?rpio.LOW:rpio.HIGH;
    rpio.write(PIN_NUM_SPI_SWITCH, v);
    //ledDriver.setDuty(1.0 - duty);
    duty += 0.1;
    if (duty > 1.0) {
      duty = 0.0;
    }
  }
  ledDriver.selectChannel(channel);
  const ch = CHANNEL_OFFSET + channel;
  channel = (channel + 1) % CHANNEL_COUNT;
  
}, 200);