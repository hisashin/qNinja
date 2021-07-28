"use strict";
const MCP4551T = require("../hardware/pot_mcp4551t.js");
const pot = new MCP4551T(1, 0x2F);
pot.initialize();
const MAX_VAL = 256;
const VAL_STEP = 16;
let val = 0;// 0 - 256
setInterval(()=>{
  //pot.setWiper(val);
  pot.setWiper(0);
  val += VAL_STEP;
  if (val > MAX_VAL) {
    val = 0;
  }
}, 250);