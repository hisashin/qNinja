"use strict";
const { forEach } = require("async");
const PromiseQueue = require("../lib/promise_queue.js");

/* Excitation and fluorescence measurement */
// const MEASUREMENT_INTERVAL_MSEC = 10000; // 10sec
const MEASUREMENT_COUNT = 3;
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
    this.oneShotCallbacks = [];
    this.continuousCallback = null;
    this.continuous = false;
    this.shouldResumeContinuous = false;
    this.devugValue = null;
  }
  /* Promise queue tasks */
  
  _taskSelectLED (wellIndex) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        this.ledUnit.select(wellIndex);
        resolve();
      });
    };
  }
  
  _taskSelectPhotodiode (wellIndex, opticalChannel) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        // console.log("_taskSelectPhotodiode %d %d", wellIndex, opticalChannel);
        this.fluorescenceSensingUnit.select(wellIndex, opticalChannel, ()=>{
          resolve();
        });
      });
    };
  }

  _processMeasurements (series) {
    return series.sort((a,b)=>{return b.v-a.v})[1];
  }
  _avg (series) {
    let sum = 0;
    series.forEach((s) =>{
      sum += s.v;
    });
    return sum/series.length;
  }
  _second (series) {
    const sorted = series.map(s=>s.v).sort((a,b)=>{return b-a});
    return sorted[1];
  }
  
  _taskMeasure (wellIndex, opticalChannel, values) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        let series = [];
        const measurementCount = this.fluorescenceSensingUnit.measurementCount();
        for (let i=0; i<measurementCount; i++) {
          setTimeout(()=>{
            this.fluorescenceSensingUnit.measure((v)=>{
              series.push(v);
              if (i==measurementCount-1) {
                this.fluorescenceSensingUnit.release();
                values[opticalChannel][wellIndex] = this._processMeasurements(series);
                if (wellIndex == 1 && opticalChannel == 0) {
                }
                resolve();
              }
            });

          }, this.fluorescenceSensingUnit.excitationDuration()*(i+2));
        }
      });
    };
  }
  
  // Delay
  _taskDelay (ms) {
    return ()=>{
      return new Promise ((resolve, reject)=>{
        // console.log("Start wait %d", ms);
        setTimeout(resolve, ms);
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
  cancel () {
    this.continuous = false;
    this.shouldResumeContinuous = false;
  }
  finish () {
    this.continuous = false;
    this.shouldResumeContinuous = false;
  }
  measureAll (callback) {
    this.oneShotCallbacks.push(callback);
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
    
    for (let opticsChannel=0; opticsChannel<this.opticsChannelsCount; opticsChannel++) {
      values.push([]);
      for (let wellIndex=0; wellIndex<this.wellsCount; wellIndex++) {
        values[opticsChannel].push(0);
      }
    }
    
    for (let wellIndex=0; wellIndex<this.wellsCount; wellIndex++) {
      queue.push(this._taskSelectLED(wellIndex));
      for (let opticsChannel=0; opticsChannel<this.opticsChannelsCount; opticsChannel++) {
        queue.push(this._taskSelectPhotodiode(wellIndex, opticsChannel));
        // queue.push(this._taskDelay(this.fluorescenceSensingUnit.excitationDuration()));
        queue.push(this._taskMeasure(wellIndex, opticsChannel, values));
      }
    }
    
    new PromiseQueue(queue).exec().then(()=>{
      this.ledUnit.off();
      if (this.oneShotCallbacks.length > 0) {
        this.oneShotCallbacks.forEach((callback)=>{
          callback(values);
        });
        this.oneShotCallbacks = [];
      }
      if (this.continuous && this.continuousCallback != null) {
        this.continuousCallback(values);
      }
      if (this.continuous) {
        // Next time
        const elapsed = new Date().getTime() - lastMeasurementTimestamp.getTime();
        const next = Math.max(0, this.fluorescenceSensingUnit.measurementAllMinInterval() - elapsed);
        setTimeout(()=>{ this._measureAll() }, next);
      }
      this.isMeasuring = false;
    },
    (e)=>{
      console.log(e)
    });
  }
  startContinuousDataCollection (callback) {
    this.continuous = true;
    this.continuousCallback = callback;
    this._measureAll();
  }
  stopContinuousDataCollection () {
    this.continuous = false;
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