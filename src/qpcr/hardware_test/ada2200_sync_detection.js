/* 
  Synchromous detection with ADA2200
  * RPi has nothing to do with ADA2200
  * Use ADA2200 evaluation board
  * Drive excitation LED with TLC59281 (LED driver) and POT LED MCP4551.
  * LED driver uses inverted ref pulse of ADA2200
  * Amplify photodiode's current signal by 1M resistor
  * Measure output of ADA2200
  */
  
"use strict";

// LED drive
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");

const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 15;
const PIN_BLANK= 26; // Input ref pulse of ADA2200 as BLANK input.
const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, PIN_BLANK, 1000 /* 1000Hz=1kHz */);
ledDriver.start();

ledDriver.selectChannel(0);
ledDriver.setDuty(1.0); // 100% drive

// ADC