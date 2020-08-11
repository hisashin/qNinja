/*
  For development and tuning of heat units
  (Thermistor, heater and fan)
  */
"use strict";
class HeatWorkbench {
  constructor (conf) {
    this.well = conf.getWell();
    this.heatLid = conf.getHeatLid();
    
  }
  run () {
    console.log("HeatWorkbench.run");
    this.well.setTargetTemperature(35.0);
    this.well.start();
    this.heatLid.start();
    setInterval(()=>{
      console.log("Well Temp=%f",this.well.temperature);
      this.well.control();
      
    }, 1000);
  }
}
module.exports = HeatWorkbench;