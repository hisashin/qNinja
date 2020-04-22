"use strict";

/* Excitation and fluorescence measurement */
const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const MEASUREMENT_PER_CH_MSEC = 500;
const EXCITATION_DURATION_MSEC = 100;
class Optics {
  constructor () {
    this.wellsCount = 8;
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
    // TODO: Switch LED channel
    // TODO: Switch photodiode MUX
    // TODO: Wait
    setTimeout(()=>{ this.measureFluorescence(well) }, EXCITATION_DURATION_MSEC);
  }
  measureFluorescence (well) {
    // TODO: add measurement data
    const elapsed = new Date().getTime() - this.startTimestamp.getTime();
    const measurement = Math.random(); //TODO dummy
    well.fluorescence.push({t:elapsed, f:measurement});
  }
  getStatus () {
    return this.wells;
    //return "TODO optics";
  }
}

module.exports = Optics;