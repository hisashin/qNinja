/*
  For development and tuning of heat units
  (Thermistor, heater and fan)
  */
"use strict";
class HeatWorkbench {
  constructor (conf) {
    this.plate = conf.getPlate();
    this.heatLid = conf.getHeatLid();
    
  }
  run () {
    console.log("HeatWorkbench.run");
    this.plate.start();
    console.log("SettingTargetTemperature...");
    this.plate.setTargetTemperature(55.0);
    setInterval(()=>{
      console.log("Plate\t",this.plate.temperature);
      this.plate.control();
      
    }, 500);
  }
  shutdown () {
    console.log("HeatWorkbench.shutdown()");
    try {
      this.plate.shutdown();
    } catch (e) {
      console.warn(e);
    }
    try {
      this.heatLid.shutdown();
    } catch (e) {
      console.warn(e);
      
    }
  }
}
module.exports = HeatWorkbench;