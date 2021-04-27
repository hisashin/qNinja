"use strict";
const MUX16ch = require("../hardware/mux_16ch.js");
const rpio = require('rpio');
const SPI = require('pi-spi');
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");


const PIN_NUM_PD_MUX_1 = 22; //GPIO6
const PIN_NUM_PD_MUX_2 = 16; //GPIO4
const PIN_NUM_PD_MUX_3 = 12; //GPIO1
const PIN_NUM_PD_MUX_4 = 10; //GPIO16
const PIN_NUM_PD_MUX_5 = 8; //GPIO15

const PIN_MUX_SWITCH = PIN_NUM_PD_MUX_1;

let mux = new MUX16ch(PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3, PIN_NUM_PD_MUX_4, PIN_NUM_PD_MUX_5);
mux.initialize();
rpio.open(PIN_MUX_SWITCH, rpio.OUTPUT, rpio.LOW);
const PIN_LATCH = 15;
const ledDriver = new TLC59281DBQR("/dev/spidev0.0", PIN_LATCH, 0, 1000 /* Hz (=1kHz) */);
ledDriver.start();

function select (channel) {
  let muxSwitchVal = (channel < 16) ? 0 : 1;
  const muxChannel = channel % 16;
  // ledDriver.selectChannel(7);
  // ledDriver.onAll();
  // console.log(channel);
  // console.log("W %d O %d M %d S %d @%d", wellIndex, channel, muxChannel, muxSwitchVal, new Date().getTime()%10000);
  // console.log(muxChannel);
  rpio.write(PIN_MUX_SWITCH, muxSwitchVal);
  console.log("Ch %d\tSw %d\tMx %d", channel, muxSwitchVal, muxChannel);
  mux.selectChannel(muxChannel);
}
const CHANNEL_OFFSET = 0;
const CHANNELS_COUNT = 32;
const INTERVAL_MSEC = 500;

let channelIndex = 0;
setInterval(()=>{
  select(CHANNEL_OFFSET + channelIndex);
  channelIndex = (channelIndex + 1) % CHANNELS_COUNT;
}, INTERVAL_MSEC);

