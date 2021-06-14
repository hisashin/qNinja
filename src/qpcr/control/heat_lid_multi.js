"use strict";

class HeatLidMulti {
  constructor (lids) {
    this.lids = lids;
  }
  setTargetTemperature (targetTemperature) {
    this.lids.forEach((lid)=>{
      lid.setTargetTemperature(targetTemperature);
    });
  }
  _control (index, callback) {
    if (index < this.lids.length) {
      this.lids[index].control(()=>{
        this._control(index+1, callback);
      });
    } else {
      callback();
    }
  }
  control (callback) {
    this._control(0, callback);
  }
  getTemperature () {
    return Math.max(...this.lids.map(lid=>lid.temperature));
  }
  shutdown () {
    this.lids.forEach((lid)=>{
      lid.shutdown();
    });
  }
  start () {
    this.lids.forEach((lid)=>{
      lid.start();
    });
  }
  off () {
    this.lids.forEach((lid)=>{
      lid.off();
    });
  }
}
module.exports = HeatLidMulti;