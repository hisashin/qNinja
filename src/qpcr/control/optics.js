"use strict";

/* Excitation and fluorescence measurement */
const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const MEASUREMENT_PER_CH_MSEC = 500;
const EXCITATION_DURATION_MSEC = 100; 
class Optics {
  constructor (hardwareConf) {
    // TODO apply hardware conf (getLED/getFluorescenceSensingUnit)
    this.ledUnit = hardwareConf.getLEDUnit();
    this.fluorescenceSensingUnit = hardwareConf.getFluorescenceSensingUnit();
    this.wellsCount = hardwareConf.wellsCount();
    this.fluorescence = [
      // Channel array?
    ];
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start () {
    this.startTimestamp = new Date();
    // Set dummy timeout
    // Well ID <=> Channel ID (MUX)
    this.wells = [];
    for (let i=0; i<this.wellsCount; i++) {
      this.wells.push({
        index:i,
        id:i,
        fluorescence:[]
      });
    }
    this.measurementInterval = setInterval(()=>{ this.measureAll() }, MEASUREMENT_INTERVAL_MSEC);
  }
  measureAll () {
    // TODO: Repeat selectChannel
    console.log("Optics.measureAll");
    this.wells.forEach((well)=>{
      setTimeout(()=>{ this.selectWell(well)}, MEASUREMENT_PER_CH_MSEC * well.index);
    });
  }
  selectWell (well) {
    this.ledUnit.selectChannel(channel);
    setTimeout(()=>{ this.measureFluorescence(well) }, EXCITATION_DURATION_MSEC);
  }
  measureFluorescence (well) {
    const elapsed = new Date().getTime() - this.startTimestamp.getTime();
    const measurement = Math.random(); //TODO: better dummy data (such as sigmoid)
    well.fluorescence.push({t:elapsed, f:measurement});
    if (well.index == this.wellsCount - 1) {
      // Last well
      if (this.eventReceiver != null && this.eventReceiver.onFluorescenceDataUpdate != null) {
        this.eventReceiver.onFluorescenceDataUpdate(this.getStatus());
      }
    }
  }
  getStatus () {
    // TODO: return only latest measurements
    let data = [];
    this.wells.forEach((well)=>{
      let wellData = {
        id:well.id,
        fluorescence:[]
      };
      if (well.fluorescence.length > 0) {
        wellData.fluorescence.push(well.fluorescence[well.fluorescence.length-1]);
      }
      data.push(wellData);
    });
    return data;
  }
}

module.exports = Optics;