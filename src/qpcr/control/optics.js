"use strict";

/* Excitation and fluorescence measurement */
// const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const MEASUREMENT_PER_CH_MSEC = 60;
const EXCITATION_DURATION_MSEC = 30;
class Optics {
  constructor (hardwareConf) {
    this.ledUnit = hardwareConf.getLEDUnit();
    this.fluorescenceSensingUnit = hardwareConf.getFluorescenceSensingUnit();
    this.wellsCount = hardwareConf.wellsCount();
    this.fluorescence = [
      // Channel array?
    ];
    this.isMeasuring = false;
    this.values = [];
    this.oneShotCallbacks = [];
    this.continuousCallback = null;
    this.continuous = false;
    this.shouldResumeContinuous = false;
  }
  setEventReceiver (receiver) {
    this.eventReceiver = receiver;
  }
  start () {
    this.startTimestamp = new Date();
    this.ledUnit.start();
    this.fluorescenceSensingUnit.start();
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
  }
  pause () {
    this.shouldResumeContinuous = this.continuous;
    this.continuous = false;
  }
  resume () {
    this.continuous = this.shouldResumeContinuous;
    this.continuous = this.shouldResumeContinuous = false;
    if (this.continuous) {
      this.startContinuousDataCollection(this.continuousCallback);
    }
  }
  abort () {
    this.continuous = false;
    this.shouldResumeContinuous = false;
  }
  finish () {
    this.continuous = false;
    this.shouldResumeContinuous = false;
  }
  measureAll (callback) {
    if (callback != null) {
      this.oneShotCallbacks.push(callback);
    }
    if (!this.isMeasuring) {
      this.values = [];
      this.wells.forEach((well)=>{
        setTimeout(()=>{ this.selectWell(well)}, MEASUREMENT_PER_CH_MSEC * well.index);
      });
    }
    this.isMeasuring = true;
  }
  selectWell (well) {
    this.ledUnit.selectChannel(well);
    this.fluorescenceSensingUnit.select(well);
    setTimeout(()=>{ this.measureFluorescence(well) }, EXCITATION_DURATION_MSEC);
  }
  measureFluorescence (well) {
    const elapsed = new Date().getTime() - this.startTimestamp.getTime();
    this.fluorescenceSensingUnit.measure(well, (measurement)=>{
      this.values.push(measurement);
      if (well.index == this.wellsCount - 1) {
        // Last well
        if (this.oneShotCallbacks.length > 0) {
          this.oneShotCallbacks.forEach((callback)=>{
              callback(this.values);
          });
          this.oneShotCallbacks = [];
        }
        if (this.continuous && this.continuousCallback != null) {
          this.continuousCallback(this.values);
        }
        this.isMeasuring = false;
        if (this.continuous) {
          this.measureAll(null);
        }
      }
    });
  }
  startContinuousDataCollection (callback) {
    console.log("startContinuousDataCollection");
    this.continuous = true;
    this.continuousCallback = callback;
    this.measureAll(null);
  }
  stopContinuousDataCollection () {
    console.log("stopContinuousDataCollection");
    this.continuous = false;
    
  }
  // Start one-shot fluorescence measurement
  getStatus () {
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