"use strict";
/* 
  Plate class represents a total system of the PCR plate.
  It consists of
   * One or more metal blocks
   * 
  */

const PlateBlock = require('./plate_block.js');
const PromiseQueue = require("../lib/promise_queue.js");
const WELL_SYNC_ENABLED = false;
const DEFAULT_TEMP = 25.0;
const CONTROL_TYPE = {
  HEATING:1,
  HOLDING:2,
  COOLLING:3
};

const WELL_SYNC_INTERVAL = 5000;


/*

// Interface

class Air {
  measureTemperature();
}
class Fan {
  setOutput (value);
}

For PlateBlock, see plate_block.js

*/

class Plate  {
  // API
  constructor (blocks, fan, air) {
    this.blocks = blocks;
    this.fan = fan;
    this.air = air;
    this.targetTemperature = DEFAULT_TEMP;
    this.controlType = CONTROL_TYPE.HOLDING;
    
    // If true, all blocks' output settings are syncronyzed with the most slow one.
    // If false, all blocks are controlled individually to keep the target temperature.
    this.needSync = false;
    this.isOff = true;
  
  }
  start () {
    this.startTime = new Date().getTime();
    this.resetSyncTime();
    this.air.measureTemperature(()=>{
      this.isOff = false;
      
    });
  }
  off () {
    this.isOff = true;
    this.blocks.forEach((block)=>{ block.off(); });
    this.fan.setOutput(0);
    // TODO
  }
  shutdown () {
    console.log("Plate.shutdown()");
    this.off();
  }
  setTargetTemperature (targetTemperature) {
    if (this.targetTemperature == targetTemperature && !this.isOff) {
      return;
    }
    this.isOff = false;
    console.log("Plate.setTargetTemperature(%f)", targetTemperature);
    this.resetSyncTime();
    if (targetTemperature > this.targetTemperature) {
      this.controlType = CONTROL_TYPE.HEATING;
      this.needSync = true;
    } else if (targetTemperature < this.targetTemperature) {
      this.controlType = CONTROL_TYPE.COOLLING;
      this.needSync = true;
    } else {
      this.controlType= CONTROL_TYPE.HOLDING;
      this.needSync = false;
    }
    this.blocks.forEach((block)=>{ 
      block.setTargetTemperature(targetTemperature); 
    });
    this.targetTemperature = targetTemperature;
    this.blocks.forEach((block)=>{
      block.pid.setSetpoint(this.targetTemperature);
    });
  }
  _measureAirTemperatureTask (air) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        air.measureTemperature(resolve);
      });
    };
  }
  _measureBlockTemperatureTask (block, timestamp) {
    return ()=>{
      return new Promise((resolve, reject)=>{
        block.measureTemperature(this.air.temperature, timestamp, resolve);
      });
    };
  }
  control (callback) {
    let timestamp = new Date().getTime() - this.startTime;
    let queue = [];
    queue.push(this._measureAirTemperatureTask(this.air));
    for (let block of this.blocks) {
      queue.push(this._measureBlockTemperatureTask(block, timestamp));
    }
    new PromiseQueue(queue).exec().then(()=>{
      this._control();
      callback();
    });
  }
  _control() {
    this.temperature = this.blocks[0].temperature;
    
    if (!this.isOff) {
      if (WELL_SYNC_ENABLED && this.needSync && new Date().getTime () - this.lastSync >= WELL_SYNC_INTERVAL) {
        this.synchronizeBlocks();
      }
      this.blocks.forEach((block)=>{block.calcDesiredOutput()});
      
      let minDesiredOutput = 0;
      this.blocks.forEach((block)=>{ minDesiredOutput = Math.min(minDesiredOutput, block.desiredOutput)});
      // console.log("minDesiredOutput",minDesiredOutput);
      // TODO: consider heater & fan ratio
      if (minDesiredOutput < 0) {
        this.fan.setOutput(-minDesiredOutput);
      } else {
        this.fan.setOutput(minDesiredOutput);
      }
      this.blocks.forEach((block)=>{
        // Set actual output
        const output = block.desiredOutput - minDesiredOutput;
        block.setOutput(output);
      });
    }
    // console.log("TEMPLOG\t" + timestamp/1000 + "\t" + this.blocks.map((block)=>{return block.temperature}).join("\t"));
    // console.log("OUTLOG\t" + timestamp/1000 + "\t" + this.blocks.map((block)=>{return block.outputValue}).join("\t"));
  }
  getTemperature () {
    return this.temperature;
  }
  // Private
  resetSyncTime () {
    this.lastSync = new Date().getTime();
  }
  synchronizeBlocks () {
    // Find "rear" (skip blocks which already achieved the target)
    this.resetSyncTime();
    // Calculate estimated time
    this.blocks.filter((block)=>{ return !block.targetAchieved }).forEach((block)=>{block.estimate()});
    // Find "rear" block
    let tmpTime = 0;
    let tmpIndex = null;
    let count = 0;
    for (let i=0; i<this.blocks.length; i++) {
      let block = this.blocks[i];
      if (block.targetAchieved || block.estimatedTime < 0) {
        continue;
      }
      count ++;
      let isTmpRear = false;
      if (tmpIndex == null) {
        isTmpRear = true;
      } else {
        if (block.estimatedTime > tmpTime) {
          isTmpRear = true;
        }
      }
      if (isTmpRear) {
        tmpTime = block.estimatedTime;
        tmpIndex = i;
      }
    }
    if (count <= 1) {
      this.needSync = false;
      return;
    }
    const rear = this.blocks[tmpIndex];
    // TODO find the "rear" block by estimated time instead of current temperature.
    const toSync = this.blocks.filter((block, index)=>{ return !block.targetAchieved && index != tmpIndex});
    rear.estimate();
    toSync.forEach((block)=>{
      block.syncWith(rear);
    });
  }
  measureTemperature (callback, expirationMsec) {
    let obj = {
      main: this.temperature,
      air: this.temperature,
      block: this.temperature
    };
    callback(obj);
  }
}
module.exports = Plate;

/*
Plate.api
    this.plate.temperature
    this.plate.getTemperature()
    this.plate.start(); // OK (TODO: "cycle start" and "hardware start" are ambiguous)
    this.plate.off(); // Stub OK
    this.plate.control(); // OK (TODO: insert yield)
    this.plate.shutdown(); // OK
    this.plate.setTargetTemperature(plateTargetTemp); //OK
*/

