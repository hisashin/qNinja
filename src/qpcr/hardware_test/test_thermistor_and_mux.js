"use strict";
/* 

  Test batch15 thermistors
  (Thermistor + 3bit MUX + ADC)
  Pins: MUX_S0-3 
  */
const rpio = require('rpio');
const MUX8ch = require("../hardware/mux_8ch.js");
const ADS122C04IPWR = require("../hardware/adc_ads122c04ipwr.js");
const Thermistor = require("../hardware/thermistor.js");

const R_SWITCH_PIN = 26;
rpio.open(R_SWITCH_PIN, rpio.OUTPUT, rpio.LOW);
let switchHigh = false;

const PIN_NUM_PD_MUX_1 = 16; //GPIO4 (Mux channel)
const PIN_NUM_PD_MUX_2 = 12; //GPIO1 (Mux channel)
const PIN_NUM_PD_MUX_3 = 8; //GPIO15 (Mux channel)

let mux = new MUX8ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3);
mux.initialize();
let muxCh = 0;
const CHANNEL_LABELS = [
  "WELL",
  "AIR",
  "LID",
  "EXT1",
  "EXT2",
  "EXT3",
  "PD1",
  "PD2"
];
/*
Ali
https://ja.aliexpress.com/item/32471629023.html?gatewayAdapt=glo2jpn&spm=a2g0o.9042311.0.0.21944c4dsQTRcU

NX
https://www.digikey.com/en/products/detail/murata-electronics/NXFT15WF104FA2B100/2533824?s=N4IgTCBcDaIHIA0BiAVAjAVgOpLQBgBYkBBMAIXzxAF0BfIA

Aki
https://akizukidenshi.com/catalog/g/gP-05268/
R0=100, B=4250K±2%
*/
const B_ALI = [
  { minTemp:0.0, bConst:3950, voltageLimit:0.0 } // 4334 for 85-100 deg 
];
const B_AKI = [
  { minTemp:0.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];
const B_NX = [
  { minTemp:0.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];
// https://akizukidenshi.com/catalog/g/gP-05268/

const RES = 47.0; // kOhm (47 or 10)
const R0 = 100.0;
const BASE_TEMP = 25.0;
const THERMISTOR_ALI = new Thermistor(B_ALI, R0, BASE_TEMP, false /* Thermistor is connected to 3.3V line */, RES);
const THERMISTOR_AKI = new Thermistor(B_AKI, R0, BASE_TEMP, false /* Thermistor is connected to 3.3V line */, RES);
const THERMISTOR_NX = new Thermistor(B_NX, R0, BASE_TEMP, false /* Thermistor is connected to 3.3V line */, RES);
const channels = [
  { label:"WELL1", therm:THERMISTOR_ALI, tl:"ALI"},
  { label:"AIR", therm:THERMISTOR_NX, tl:"NX"},
  { label:"LID", therm:THERMISTOR_ALI, tl:"ALI"},
  { label:"EXT1", therm:THERMISTOR_AKI, tl:"AKI"},
  { label:"WELL2", therm:THERMISTOR_NX, tl:"NX"},
  { label:"EXT3", therm:THERMISTOR_AKI, tl:"AKI"},
  { label:"PD1", therm:THERMISTOR_AKI, tl:"AKI"},
  { label:"PD2", therm:THERMISTOR_AKI, tl:"AKI"},
];
const CHANNELS_COUNT = channels.length;
/*
  Test thermistor connection
  
  GND --[ 47kOhm ]--+--[Thermistor]-- 3.3V
                    |
                   ADC
  ADC Ch0 -> GNDA
      Ch1 -> THERM_MUX_OUT
*/
const I2C_CHANNEL = 1; // SDA1 & SCL1
const ADC_DEVICE_ADDR = 0x40;

const adc = new ADS122C04IPWR(I2C_CHANNEL, ADC_DEVICE_ADDR);
adc.initialize();
/*
DATA_RATE[20] = DATA_RATE_20SPS;
DATA_RATE[45] = DATA_RATE_45SPS;
DATA_RATE[90] = DATA_RATE_90SPS;
DATA_RATE[175] = DATA_RATE_175SPS;
DATA_RATE[330] = DATA_RATE_330SPS;
DATA_RATE[600] = DATA_RATE_600SPS;
DATA_RATE[1000] = DATA_RATE_1000SPS;
*/
// adc.selectDataRate(20);
adc.selectDataRate(1000);
adc.selectVoltageReferenceExternal();


channels.forEach((channel)=>{
  channel.t = 0;
  channel.v = 0;
});
setInterval(()=>{
  adc.selectChannel(1);
  mux.selectChannel(muxCh);
  setTimeout(()=>{
    adc.readConversionData((val)=>{
      const channel = channels[muxCh];
      const temp = channel.therm.getTemp(val);
      channel.t = temp;
      channel.v = val;
      // console.log("Ch:%d Val=%f T=%f", muxCh, val, temp);
      // console.log(temps);
      // adc.debug();
      muxCh = (muxCh + 1) % CHANNELS_COUNT;
      if (muxCh == 0) {
        switchHigh = !switchHigh;
        console.log("HIGH=%d R=%f", switchHigh, RES);
        console.log(channels.map((ch)=>{ return ch.label + "\t" + ch.t + "\t" + ch.v }).join("\n"));
      }

    // rpio.write(R_SWITCH_PIN, (switchHigh)?rpio.HIGH:rpio.LOW);
    rpio.write(R_SWITCH_PIN, rpio.LOW);
    });
  }, 125);
},500);
