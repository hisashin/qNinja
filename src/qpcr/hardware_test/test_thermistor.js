"use strict";
/*

  Test thermistor connection
  
  GND --[ 47kOhm ]--+--[Thermistor]-- 3.3V
                    |
                   ADC
*/

const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const Thermistor = require("../hardware/thermistor.js");
const adc = new ADS1219IPWR(1, 0x40);
adc.initialize();
let ch = 0;

const RES = 47.0; // kOhm
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

const thermistor = new Thermistor(B_CONST, R0, BASE_TEMP, 
  true /* Thermistor is connected to 3.3V line */, RES);
setInterval(()=>{
  adc.selectChannel(ch);
  const targetCh = ch;
  setTimeout(()=>{
    adc.readConversionData((val)=>{
      const temp = thermistor.getTemp(val);
      console.log("Ch:%d %f %f", targetCh, val, temp);
    });
  }, 250);
  ch = (ch + 1)  % 2;
},500);
