"use strict";
/*
  ADC Scheduling
*/
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");

const adcManager = new ADCManager(new ADS1219IPWR(1, 0x40), 90);
adcManager.start();

/*
let ch0 = 0;
let ch1 = 0;
setInterval(()=>{
  randMsec = 400 + 200 * Math.random();
  setTimeout(()=>{
    adcManager.readChannelValue(ch0, (val)=>{
      console.log("%d\t%d\t%f", 1, ch0, val);
      ch1 = (ch1 + 1) % 4;
    });
    
    
  }, randMsec);
  adcManager.readChannelValue(ch0, (val)=>{
    console.log("%d\t%d\t%f", 0, ch0, val);
    ch0 = (ch0 + 1) % 4;
  });
  
}, 500);
*/
// DummyFluorescence
// DummyTemp
const controlTemp = () => {
  adcManager.readChannelValue(0, (val)=>{
    // console.log("%d\tW\t%f", new Date().getTime()-startTime, val);
    adcManager.readChannelValue(1, (val)=>{
      // console.log("%d\tL\t%f", new Date().getTime()-startTime, val);
      adcManager.readChannelValue(2, (val)=>{
        // console.log("%d\tA\t%f", new Date().getTime()-startTime, val);
      });
    });
  });
};
const PD_CH_COUNT = 8;
let pdCh = 0;
const activateLED = (channel) => {
  
};
const measureFluorescence = () => {
  activateLED();
  setTimeout(()=>{
    adcManager.readChannelValue(3, (val)=>{
      console.log("%d\tW%d\t%f", new Date().getTime()-startTime, pdCh, val);
      pdCh += 1;
      if (pdCh < PD_CH_COUNT) {
        measureFluorescence();
      }
    });
  }, 20);
};
const measureFluorescenceAll = () => {
  pdCh = 0;
  measureFluorescence();
  
};
const startTime = new Date().getTime();
setInterval(controlTemp, 1000);
setInterval(measureFluorescenceAll, 4840);