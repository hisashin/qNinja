"use strict";
const MCP4551T = require("../hardware/pot_mcp4551t.js");
const pot = new MCP4551T(1, 0x2F);
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const adc = new ADS1219IPWR(1, 0x40);

adc.initialize();
pot.i2c = adc.i2c;

const MAX_VAL = 0x100;
const VAL_STEP = 2;
let val = 0;// 0 - 256
let increasing = true;
setInterval(()=>{
  pot.setWiper(val);
  const conversion = adc.readConversionData();
  console.log("%d\t%f", val, conversion);
  adc.selectChannel(0);
  if (increasing) {
    val += VAL_STEP;
    if (val > MAX_VAL) {
      val -= VAL_STEP;
      increasing = false;
    }
  } else {
    val -= VAL_STEP;
    if (val < 0) {
      val += VAL_STEP;
      increasing = true;
    }
  }
}, 128);