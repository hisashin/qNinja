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
    this.well.start();
    console.log("SettingTargetTemperature...");
    this.well.setTargetTemperature(55.0);
    setInterval(()=>{
      console.log("Well\t",this.well.temperature);
      this.well.control();
      
    }, 500);
  }
  shutdown () {
    this.well.shutdown();
    this.heatLid.shutdown();
  }
}
module.exports = HeatWorkbench;