"use strict";
const PromiseQueue = require("../lib/promise_queue.js");
const MAX_IREF = 191;
const MIN_IREF = 127;
const IREF_STEP = 32;

let debugIref = 255;

/* Excitation and fluorescence measurement */
const MEASUREMENT_COUNT = 3;

class OpticsUnit  {
  constructor(ledUnit, fluorescenceSensingUnit) {
    this.ledUnit = ledUnit;
    this.fluorescenceSensingUnit = fluorescenceSensingUnit;
  }
  
  // Delay
  /**
   * Promise delay
   * @param {number} ms Msec to delay
   * @returns {Promise}
   */
  _taskDelay (ms) {
    return new Promise ((resolve, reject)=>{
      setTimeout(resolve, ms);
    });
  }
  /**
   * Promise "LEDUnit.select"
   * @param {number} wellIndex Well index (0..15)
   * @param {number} iref IREF of channel (sent to LED driver)
   * @returns {Promise}
   */
  _taskSelectLED (wellIndex, iref) {
    return new Promise((resolve, reject)=>{
      this.ledUnit.select(wellIndex, iref);
      resolve();
    });
  }
  
  _taskSelectPhotodiode (wellIndex, opticalChannel) {
    return new Promise((resolve, reject)=>{
      this.fluorescenceSensingUnit.select(wellIndex, opticalChannel, ()=>{
        resolve();
      });
    });
  }
  _taskMeasure () {
    return new Promise((resolve, reject)=>{
      this.fluorescenceSensingUnit.measure((v)=>{
        resolve(v);
      });
    });

  }

  _processMeasurements (series) {
    return series.sort((a,b)=>{return b.v-a.v})[1];
  }
  /**
   * 
   * @param {number} signal Signal strength
   * @param {number} iref Iref value of LED driver
   * @returns 
   */
  _isSaturated (signal, iref) {
    const threshold = 1.2 - 0.4 * (iref - MIN_IREF)/(MAX_IREF-MIN_IREF);
    return signal > threshold;
  }
  /**
   * 
   * @param {number} well Index of well
   * @param {number} opticalChannel Index of optical channel
   * @returns {{iref:number, int:number}}
   */
  async _configure (well, opticalChannel) {
    // Gain & intensity config
    
    let iref = MAX_IREF;
    let measurement = null;
    
    while (iref > MIN_IREF) {
      let saturated = false;
      await this._taskSelectLED(well, iref);
      for (let i=0; i<3; i++) {
        await this._taskDelay(this.fluorescenceSensingUnit.excitationDuration());
        measurement = await this._taskMeasure();
        saturated = this._isSaturated(measurement.v, iref)
        if (saturated) {
          break;
        }
      }
      if (!saturated) {
        break;
      }
      iref = iref - IREF_STEP;
    }
    
    // Test with fixed intensity value 
    
    /*
    iref = debugIref;//parseInt(process.argv[3]);
    await this._taskSelectLED(well, iref);
    await this._taskDelay(this.fluorescenceSensingUnit.excitationDuration());
    */
    let conf = {iref:iref,int:iref/MAX_IREF};
    return conf;
  }

  /**
   * 
   * @param {number} raw Raw measurement value
   * @param {number} iref IREF of LED driver (0-255)
   * @returns {number} Computed fluo value
   */
  _calcFluo (raw, iref) {
    const exponent = 1 - raw * 0.6;
    const irefConv = Math.pow(iref/MAX_IREF, exponent) * MAX_IREF;
    return raw * MAX_IREF / irefConv
  }
  /**
   * @callback measureCallback
   * @param {{v:number, i:number, r:number}}} value
   */
  
  /**
   * 
   * @param {number} well Index of well
   * @param {number} opticalChannel Index of optical channel
   * @param {measureCallback} callback 
   */
  async measure (well, opticalChannel, callback) {
    await this._taskSelectPhotodiode(well, opticalChannel);
    const conf = await this._configure(well, opticalChannel);
    let series = [];
    const measurementCount = this.fluorescenceSensingUnit.measurementCount();
    for (let i=0; i<measurementCount; i++) {
      await this._taskDelay(this.fluorescenceSensingUnit.excitationDuration());
      const measurement = await this._taskMeasure();
      series.push(measurement); 
    }
    this.fluorescenceSensingUnit.release();
    // Raw value
    let v = this._processMeasurements(series);
    v.i = conf.int;
    v.iref = conf.iref;
    v.r = v.v;
    v.v = this._calcFluo(v.r, conf.iref);
    callback(v);

  }

}
/*
  fluo
*/
class Optics {
  constructor (ledUnit, fluorescenceSensingUnit, wellsCount, opticsChannelsCount) {
    this.opticsUnit = new OpticsUnit(ledUnit, fluorescenceSensingUnit);
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
    this.measureAllCallbacks = [];
  }
  /* Promise queue tasks */
  

  _taskMeasure (wellIndex, opticalChannel, values) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        this.opticsUnit.measure(wellIndex, opticalChannel, (result)=>{
          values[opticalChannel][wellIndex] = result;
          resolve();

        });
      });
    };
  }
  
  
  start () {
    console.log("Optics.start");
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
  }
  resume () {
  }
  cancel () {
  }
  finish () {
  }
  measureAll (callback) {
    debugIref = debugIref - 8;
    if (debugIref < MIN_IREF) {
      debugIref = MAX_IREF;
    }
    this.measureAllCallbacks.push(callback);
    if (this.isMeasuring) {
      console.log("Return. Measure all is already running.");
      // measure all task is already running
      return;
    }
    this._measureAll();
  }
  _measureAll () {
    const lastMeasurementTimestamp = new Date();
    this.isMeasuring = true;
    
    let queue = [];
    let values = [];
    
    for (let opticalChannel=0; opticalChannel<this.opticsChannelsCount; opticalChannel++) {
      values.push([]);
      for (let wellIndex=0; wellIndex<this.wellsCount; wellIndex++) {
        values[opticalChannel].push(0);
      }
    }
    
    for (let wellIndex=0; wellIndex<this.wellsCount; wellIndex++) {
      for (let opticalChannel=0; opticalChannel<this.opticsChannelsCount; opticalChannel++) {
       queue.push(this._taskMeasure(wellIndex, opticalChannel, values));
      }
    }
    
    new PromiseQueue(queue).exec().then(()=>{
      this.ledUnit.off();
      if (this.measureAllCallbacks.length > 0) {
        this.measureAllCallbacks.forEach((callback)=>{
          callback(values);
        });
        this.measureAllCallbacks = [];
      }
      this.isMeasuring = false;
    },
    (e)=>{
      console.log(e)
    });
  }
  _roundFluorescence (value) {
    return Math.round(value * this.ROUND_POSITION) / this.ROUND_POSITION;
  }
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
    if (this.ledUnit && this.ledUnit.shutdown) {
      try {
        this.ledUnit.shutdown();
      } catch (e) {
        console.warn(e);
      }
    } else {
      console.warn("Optics.shutdown() ledUnit does not have shutdown function.");
    }
  }
}

module.exports = Optics;