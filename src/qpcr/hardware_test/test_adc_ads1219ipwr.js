const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");


const adc = new ADS1219IPWR(1, 0x40);
adc.initialize();
let ch = 0;
setInterval(()=>{
  adc.selectChannel(ch);
  const targetCh = ch;
  setTimeout(()=>{
    const val = adc.readConversionData();
    console.log("Ch:%d %f", targetCh, val);
  }, 250);
  ch = (ch + 1)  % 4;
},500);