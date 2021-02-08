"use strict";
// Drive ch0 of TLC59281
// (For simple test of photodiode and ADA2200)

const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");

const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 15;
const PIN_BLANK= 0;// 26; // Input ref pulse of ADA2200 as BLANK input.
const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, PIN_BLANK, 1000 /* 1000Hz=1kHz */);
ledDriver.start();

ledDriver.selectChannel(7);
ledDriver.setDuty(1.0); // 100% drive