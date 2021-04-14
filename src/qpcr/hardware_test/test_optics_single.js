"use strict";

const raspi = require('raspi');
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const rpio = require('rpio');
const pwm = require('raspi-pwm');
const SIG_PIN = 40;
const adc = new ADS1219IPWR(1, 0x40);
 
raspi.init(() => {
  // const led0 = new pwm.PWM(23); // Use GPIO{n} number
  // const led1 = new pwm.PWM(1); // Use GPIO{n} number
  // led0.write(0.5);
  rpio.open(32, rpio.INPUT);
  
  adc.initialize();
  let ch = 0;
  adc.selectDataRate(90);
  rpio.open(SIG_PIN, rpio.OUTPUT, rpio.HIGH);
  setInterval(()=>{
    adc.selectChannel(ch);
    setTimeout(()=>{
      adc.readConversionData((val)=>{
        console.log(val);
      });
    }, 250);
  },500);
});

