"use strict";
/* 

  Test batch8 photosensing board
  (Thermistor + 3bit MUX + ADC)
  Pins: MUX_S0-3 
  */
const MUX8ch = require("../hardware/mux_8ch.js");

const PIN_NUM_PD_MUX_1 = 16; //GPIO4 (Mux channel)
const PIN_NUM_PD_MUX_2 = 12; //GPIO1 (Mux channel)
const PIN_NUM_PD_MUX_3 = 10; //GPIO16 (Mux channel)
let mux = new MUX8ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3);
mux.initialize();
let muxCh = 0;
const CHANNELS_COUNT = 4;
/*
  Test thermistor connection
  
  GND --[ 47kOhm ]--+--[Thermistor]-- 3.3V
                    |
                   ADC
  ADC Ch0 -> GNDA
      Ch1 -> THERM_MUX_OUT
*/

const ADS122C04IPWR = require("../hardware/adc_ads122c04ipwr.js");
// const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const Thermistor = require("../hardware/thermistor.js");
const I2C_CHANNEL = 1; // SDA1 & SCL1
const ADC_DEVICE_ADDR = 0x40;

const adc = new ADS122C04IPWR(I2C_CHANNEL, ADC_DEVICE_ADDR);
adc.initialize();
adc.selectDataRate(20);
adc.selectVoltageReferenceExternal();

const RES = 47.0; // kOhm
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

let temps = [0,0,0,0];
const thermistor = new Thermistor(B_CONST, R0, BASE_TEMP, 
  false /* Thermistor is connected to 3.3V line */, RES);
setInterval(()=>{
  // adc.selectDiff(0, 1);
  adc.selectChannel(1);
  mux.selectChannel(muxCh);
  // mux.selectChannel(1);
  setTimeout(()=>{
    adc.readConversionData((val)=>{
      const temp = thermistor.getTemp(val);
      temps[muxCh] = temp;
      console.log("Ch:%d Val=%f T=%f", muxCh, val, temp);
      console.log(temps);
      adc.debug();
      muxCh = (muxCh + 1) % CHANNELS_COUNT;
    });
  }, 250);
},500);
