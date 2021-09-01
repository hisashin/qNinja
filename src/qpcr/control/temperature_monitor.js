"use strict";
/*

Example usage:

// Initialization
this.tempMonitor = new TemperatureMonitor(plate, lid, extra);

// Measure
this.tempMonitor.getMeasurement((measurement)=>{
  // Do something
}, 1000);

  */
  
class TemperatureMonitor {
  constructor (plate, lid, extra) {
    this.plate = plate;
    this.lid = lid;
    this.extra = extra;
  }
  getMeasurement (callback, expirationMsec) {
    this.plate.measureTemperature((plateMeasurement)=>{
      this.lid.measureTemperature((lidMeasurement)=>{
        if (this.extra) {
          this.extra.measureTemperature((extraMeasurement)=>{
            const obj = {
              plate: plateMeasurement,
              lid: lidMeasurement,
              extra: extraMeasurement
            };
            callback (obj);
          }, expirationMsec);
        } else {
          const obj = {
            plate: plateMeasurement,
            lid: lidMeasurement
          };
          callback (obj);
        }
      }, expirationMsec);
    }, expirationMsec);
  }
}

module.exports = TemperatureMonitor;