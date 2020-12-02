/* 
  Synchromous detection with ADA2200
  * RPi has nothing to do with ADA2200 and digipot
  * Use ADA2200 evaluation board
  * Drive excitation LED with TLC59281 (LED driver) and POT LED MCP4551.
  * LED driver uses inverted ref pulse of ADA2200
  * Amplify photodiode's current signal by 1M resistor
  * Measure output of ADA2200
  */
  
"use strict";

const rpio = require('rpio');

// LED drive
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");
const ADA2200 = require("../hardware/ada2200.js");

const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 15;
const PIN_BLANK= 26; // Input ref pulse of ADA2200 as BLANK input.
const spi = SPI.initialize(SPI_CHANNEL);
const ledDriver = new TLC59281DBQR(spi, PIN_LATCH, PIN_BLANK, 1000 /* 1000Hz=1kHz */);
ledDriver.start();

ledDriver.selectChannel(0);
ledDriver.setDuty(1.0); // 100% drive

// ADC
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");

const SIG_PIN = 40;
const adc = new ADS1219IPWR(1, 0x40);
adc.initialize();
let ch = 0;
adc.selectDataRate(90);
rpio.open(SIG_PIN, rpio.OUTPUT, rpio.HIGH);
setInterval(()=>{
  adc.selectChannel(2);
  //adc.selectDiff(2, 3); // INP->AIN2 INN->AIN3
  // adc.sync();
  // rpio.write(SIG_PIN, rpio.LOW);
  // rpio.write(SIG_PIN, rpio.HIGH);
  setTimeout(()=>{
    //Async 
    adc.readConversionData((val)=>{
      // let valToShow = Math.max(0, val-0.5) * 10.0;
      let valToShow = val * 10;
      console.log("V=%f", valToShow);
    });
  }, 500);
},500);

const ADA2200_CS = 8; //8	GPIO 15
let demod = new ADA2200(spi, ADA2200_CS);
demod.start();
let flg = false;
setInterval(()=>{
  /*
  if (flg)
    demod.a();
  else
    demod.b();
    */
  demod.b();
  flg = !flg;
  
}, 2000);