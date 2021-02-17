/*
  todo
  * Add println
  * Switching?
  * Fix channels (16)
*/
"use strict";
const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");
const rpio = require('rpio');

const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_MUX_SYNC = 22; // Pin number
const CHANNEL_OFFSET = 0;

const PIN_NUM_SPI_SWITCH = 18; //GPIO5
const VALUE_SPI_SWITCH_MUX = rpio.HIGH;

let mux = new ADG731BSUZ(SPI_CHANNEL, PIN_MUX_SYNC);
rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, VALUE_SPI_SWITCH_MUX);
mux.initialize();

let channel = VALUE_SPI_SWITCH_MUX;
const CHANNELS_COUNT = 16;
// let switchVal = 0;
setInterval(()=>{
  rpio.write(PIN_NUM_SPI_SWITCH, VALUE_SPI_SWITCH_MUX);
  mux.selectChannel(channel + CHANNEL_OFFSET);
  // console.log(channel);
  channel = (channel + 1) % CHANNELS_COUNT;
  /*
  if (channel == 0) {
    switchVal = (switchVal==0) ? 1:0;
    console.log("Switch. %d", switchVal);
  }
  */
}, 200);