"use strict";

/* Excitation and fluorescence measurement */
// const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const DEBUG_COEFF = 1;
const MEASUREMENT_PER_CH_MSEC = 200 * DEBUG_COEFF;
const EXCITATION_DURATION_MSEC = 50 * DEBUG_COEFF;
const MEASUREMENT_MIN_INTERVAL_MSEC = 4000 * DEBUG_COEFF;
class Optics {
  constructor (ledUnit, fluorescenceSensingUnit, wellsCount, opticsChannelsCount) {
    // new Optics(hardwareConf.getLEDUnit(), hardwareConf.getFluorescenceSensingUnit(), hardwareConf.wellsCount(), hardwareConf.opticsChannelsCount());
    this.ledUnit = ledUnit;
    this.fluorescenceSensingUnit = fluorescenceSensingUnit;
    this.wellsCount = wellsCount;
    this.opticsChannelsCount = opticsChannelsCount;
    
    this.ROUND_POSITION = Math.pow(10, 5);
    
    this.fluorescence = [
      // Channel array?
    ];
    this.isMeasuring = false;
    this._initValues();
    this.oneShotCallbacks = [];
    this.continuousCallback = null;
    this.continuous = false;
    this.shouldResumeContinuous = false;
    this.devugValue = null;
    this.lastMeasurementTimestamp = new Date();
  }
  _initValues () {
    this.values = [];
    for (let i=0; i<this.opticsChannelsCount; i++) {
      this.values.push([]);
    }
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
      this._initValues();
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
    setTimeout(()=>{this.fluorescenceSensingUnit.select(well.index, 0);}, 5);
    
    for (let opticsChannel=0; opticsChannel<this.opticsChannelsCount; opticsChannel++) {
      setTimeout(()=>{ 
        this._measureFluorescence(well, opticsChannel, isSingle, ()=>{
          // Select next optical channel
          if (opticsChannel < this.opticsChannelsCount - 1) {
            this.fluorescenceSensingUnit.select(well.index, opticsChannel+1);
          }
        }) 
      }, EXCITATION_DURATION_MSEC * (opticsChannel+1));
    }
  }
  _measureFluorescence (/* well object */well, opticsChannel, isSingle, onMeasure) {
    const elapsed = new Date().getTime() - this.startTimestamp.getTime();
    this.fluorescenceSensingUnit.measure((measurement)=>{
      onMeasure();
      if (isSingle) {
        if (this.oneShotCallbacks.length > 0) {
          this.oneShotCallbacks.forEach((callback)=>{
              callback({well:well, value:measurement});
          });
          this.oneShotCallbacks = [];
        }
        return;
      }
      // this.value -> channel
      this.values[opticsChannel].push(measurement);
      if (well.index == this.wellsCount - 1 && opticsChannel == this.opticsChannelsCount - 1) {
        this.ledUnit.off();
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