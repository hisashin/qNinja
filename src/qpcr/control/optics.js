"use strict";

/* Excitation and fluorescence measurement */
// const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const MEASUREMENT_PER_CH_MSEC = 60;
const EXCITATION_DURATION_MSEC = 30;
const MEASUREMENT_MIN_INTERVAL_MSEC = 2000;
class Optics {
  constructor (ledUnit, fluorescenceSensingUnit, wellsCount) {
    // new Optics(hardwareConf.getLEDUnit(), hardwareConf.getFluorescenceSensingUnit(), hardwareConf.wellsCount());
    this.ledUnit = ledUnit;
    this.fluorescenceSensingUnit = fluorescenceSensingUnit;
    this.wellsCount = wellsCount;
    this.ROUND_POSITION = Math.pow(10, 5);
    
    this.fluorescence = [
      // Channel array?
    ];
    this.isMeasuring = false;
    this.values = [];
    this.oneShotCallbacks = [];
    this.continuousCallback = null;
    this.continuous = false;
    this.shouldResumeContinuous = false;
    this.devugValue = null;
    this.lastMeasurementTimestamp = new Date();
  }
  
  start () {
    this.startTimestamp = new Date();
    this.ledUnit.start();
    this.fluorescenceSensingUnit.start();
    // Set dummy timeout
    // well ID <=> Channel ID (MUX)
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
      this.lastMeasurementTimestamp = new Date();
      this.values = [];
      this.wells.forEach((well)=>{
        setTimeout(()=>{ this._selectWell(well)}, MEASUREMENT_PER_CH_MSEC * well.index);
      });
    }
    this.isMeasuring = true;
  }
  measureSingle (wellIndex, callback) {
    if (callback != null) {
      this.oneShotCallbacks.push(callback);
    }
    const well = this.wells[wellIndex];
    setTimeout(()=>{ this._selectWell(well, true)}, MEASUREMENT_PER_CH_MSEC);
    this.isMeasuring = true;
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
  _selectWell (/* well object */well, isSingle) {
    this.ledUnit.select(well.index);
    this.fluorescenceSensingUnit.select(well.index);
    setTimeout(()=>{ this._measureFluorescence(well, isSingle) }, EXCITATION_DURATION_MSEC);
  }
  _measureFluorescence (/* well object */well, isSingle) {
    const elapsed = new Date().getTime() - this.startTimestamp.getTime();
    this.fluorescenceSensingUnit.measure(well.index, (measurement)=>{
      if (isSingle) {
        if (this.oneShotCallbacks.length > 0) {
          this.oneShotCallbacks.forEach((callback)=>{
              callback({well:well, value:measurement});
          });
          this.oneShotCallbacks = [];
        }
        return;
      }
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
          // Next time
          const elapsed = new Date().getTime() - this.lastMeasurementTimestamp.getTime();
          const next = Math.max(0, MEASUREMENT_MIN_INTERVAL_MSEC-elapsed);
          setTimeout(()=>{ this.measureAll(null) }, next);
        }
      }
    });
  }
  _roundFluorescence (value) {
    return Math.round(value * this.ROUND_POSITION) / this.ROUND_POSITION;
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
        wellData.fluorescence.push(_roundFluorescence(well.fluorescence[well.fluorescence.length-1]));
      }
      data.push(wellData);
    });
    return data;
  }
  shutdown () {
    console.log("Optics.shutdown()");
    this.ledUnit.shutdown();
  }
}

module.exports = Optics;