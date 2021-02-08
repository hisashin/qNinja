"use strict";

const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const rpio = require('rpio');

const SIG_PIN = 40;
const adc = new ADS1219IPWR(1, 0x40);
adc.initialize();
let ch = 0;
adc.selectDataRate(90);
rpio.open(SIG_PIN, rpio.OUTPUT, rpio.HIGH);
setInterval(()=>{
  adc.selectChannel(ch);
  // adc.sync();
  rpio.write(SIG_PIN, rpio.LOW);
  rpio.write(SIG_PIN, rpio.HIGH);
  const targetCh = ch;
  setTimeout(()=>{
    /*
    Sync
    const val = adc.readConversionDataSync();
    console.log("Ch:%d %f", targetCh, val);
    */
    //Async 
    adc.readConversionData((val)=>{
      if (targetCh == 0) {
        console.log("Ch:%d %f", targetCh, val);
      }
    });
  }, 100);
  ch = (ch + 1)  % 4;
},500);