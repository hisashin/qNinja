/* 
  Well class represents a total system of the PCR well.
  It consists of
   * One or more metal blocks
   * 
  */

  
const WellBlock = require('./well_block.js');
// const PID = require("./heat_control/pid.js");

const DEFAULT_TEMP = 25.0;
const CONTROL_TYPE = {
  HEATING:1,
  HOLDING:2,
  COOLLING:3
};

const WELL_SYNC_INTERVAL = 5000;

class Well  {
  // API
  constructor (blocks, fan, air) {
    this.blocks = blocks;
    this.fan = fan;
    this.air = air;
    this.targetTemperature = DEFAULT_TEMP;
    this.controlType = CONTROL_TYPE.HOLDING;
    
    // If true, all wells' output settings are syncronyzed with the most slow one.
    // If false, all wells are controlled individually to keep the target temperature.
    this.needSync = false;
  
  }
  async start () {
    this.startTime = new Date().getTime();
    this.resetSyncTime();
    await this.air.measureTemperature();
  }
  off () {
    // TODO
  }
  shutdown () {
    // TODO
  }
  setTargetTemperature (targetTemperature) {
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
    this.blocks.forEach((block)=>{ block.setTargetTemperature(targetTemperature); });
    this.targetTemperature = targetTemperature;
    this.blocks.forEach((block)=>{
      block.pid.setSetpoint(this.targetTemperature);
    });
  }
  async control () {
    let timestamp = new Date().getTime() - this.startTime;
    
    // Read all thermistors
    await this.air.measureTemperature();
    for (let block of this.blocks) {
      await block.measureTemperature(this.air.temperature, timestamp);
    }
    
    if (this.needSync & new Date().getTime () - this.lastSync >= WELL_SYNC_INTERVAL) {
      this.synchronizeWells();
    }
    // TODO: Consider ramp speed
    // TODO: Isn't the controlled ramp speed to fast? (Shift to "fast ramp" mode.)
    this.blocks.forEach((block)=>{block.calcDesiredOutput()});
    console.log(this.blocks.map(block=>block.desiredOutput).join("\t"));
    
    let minDesiredOutput = 0;
    this.blocks.forEach((block)=>{ minDesiredOutput = Math.min(minDesiredOutput, block.desiredOutput)});
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
    
    console.log("TEMPLOG\t" + timestamp/1000 + "\t" + this.blocks.map((block)=>{return block.temperature}).join("\t"));
    console.log("OUTLOG\t" + timestamp/1000 + "\t" + this.blocks.map((block)=>{return block.outputValue}).join("\t"));
  }
  // Private
  resetSyncTime () {
    this.lastSync = new Date().getTime();
  }
  synchronizeWells () {
    // Find "rear" (skip wells which already achieved the target)
    this.resetSyncTime();
    // Calculate estimated time
    this.blocks.filter((block)=>{ return !block.targetAchieved }).forEach((block)=>{block.estimate()});
    // Find "rear" well
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
    // TODO find the "rear" well by estimated time instead of current temperature.
    const toSync = this.blocks.filter((block, index)=>{ return !block.targetAchieved && index != tmpIndex});
    console.log("Rear=%d", tmpIndex);
    console.log("Count=%d", toSync.length);
    rear.estimate();
    toSync.forEach((block)=>{
      block.syncWith(rear);
    });
  }
}

module.exports = Well;

/*
Well.api
    this.well.temperature
    this.well.start(); // OK (TODO: "cycle start" and "hardware start" are ambiguous)
    this.well.off(); // Stub OK
    this.well.control(); // OK (TODO: insert yield)
    this.well.shutdown(); // OK
    this.well.setTargetTemperature(wellTargetTemp); //OK
*/

