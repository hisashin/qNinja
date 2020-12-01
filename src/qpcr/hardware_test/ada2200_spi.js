// SPI communication test
"use strict";

const ADA2200 = require("../hardware/ada2200.js");

const SPI_CHANNEL = "/dev/spidev0.0";
const ADA2200_CS = 8; //8	GPIO 15
let demod = new ADA2200(SPI_CHANNEL, ADA2200_CS);
demod.start();
let flg = false;
setInterval(()=>{
  if (flg)
    demod.a();
  else
    demod.b();
  flg = !flg;
  
}, 2000);