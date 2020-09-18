/* 
  Well class represents a total system of the PCR well.
  It consists of
   * One or more metal blocks
   * 
  */

  
const WellBlock = require('./well_block.js');
class Air {
  constructor () {
    // TODO add dependencies to thermistor implementation
    this.temperature = DEFAULT_TEMP;
  }
  measureTemperature () {
    return new Promise ((resolve)=>{
      // TODO call thermistor & mux implementation.
      setTimeout(()=>{
        // console.log("Air temp measured.");
        resolve()
      }, 50);
    });
  }
}

const DEFAULT_TEMP = 25.0;
const CONTROL_TYPE = {
  HEATING:1,
  HOLDING:2,
  COOLLING:3
};

const WELL_SYNC_INTERVAL = 5000;

class Well  {
  constructor () {
    /*
      TODO add dependencies to...
      * blocks count
      * air
      * well block
    */
    this.targetTemp = DEFAULT_TEMP;
    this.controlType = CONTROL_TYPE.HOLDING;
    
    // If true, all wells' output settings are syncronyzed with the most slow one.
    // If false, all wells are controlled individually to keep the target temperature.
    this.needSync = false;
  
    const BLOCKS_COUNT = 4;
    this.air = new Air();
    this.blocks = [];
    for (let i=0; i<BLOCKS_COUNT; i++) {
      const block = new WellBlock(i);
      this.blocks.push(block);
    }
  }
  resetSyncTime () {
    this.lastSync = new Date().getTime();
  }
  async start () {
    this.startTime = new Date().getTime();
    this.resetSyncTime();
    await this.air.measureTemperature();
  }
  setTargetTemp (targetTemp) {
    this.resetSyncTime();
    if (targetTemp > this.targetTemp) {
      this.controlType = CONTROL_TYPE.HEATING;
      this.needSync = true;
    } else if (targetTemp < this.targetTemp) {
      this.controlType = CONTROL_TYPE.COOLLING;
      this.needSync = true;
    } else {
      this.controlType= CONTROL_TYPE.HOLDING;
      this.needSync = false;
    }
    this.blocks.forEach((block)=>{ block.setTargetTemp(targetTemp); });
    this.targetTemp = targetTemp;
  }
  synchronizeWells () {
    // Find "rear" (skip wells which already achieved the target)
    this.resetSyncTime();
    // Find "rear" well
    let tmpTemp = null;
    let tmpIndex = null;
    let count = 0;
    for (let i=0; i<this.blocks.length; i++) {
      let block = this.blocks[i];
      if (block.targetAchieved) {
        continue;
      }
      count ++;
      let isTmpRear = false;
      if (tmpIndex == null) {
        isTmpRear = true;
      } else if (this.controlType = CONTROL_TYPE.HEATING) {
        if (block.temperature < tmpTemp) {
          isTmpRear = true;
        }
      } else {
        if (block.temperature > tmpTemp) {
          isTmpRear = true;
        }
      }
      
      if (isTmpRear) {
        tmpTemp = block.temperature;
        tmpIndex = i;
      }
    }
    if (count <= 1) {
      this.needSync = false;
      return;
    }
    const rear = this.blocks[tmpIndex];
    const toSync = this.blocks.filter((block, index)=>{ return !block.targetAchieved && index != tmpIndex});
    // TODO: Fit dT/dt vs (T(well)-T(air))
    // TODO: Calculate coefficients of temp prediction
    // TODO: Calc max power
    console.log("Rear=%d", tmpIndex);
    console.log("Count=%d", toSync.length);
    rear.update();
    toSync.forEach((block)=>{
      block.syncWith(rear);
    });
  }
  async update () {
    // Read all thermistors
    let timestamp = new Date().getTime() - this.startTime;
    await this.air.measureTemperature();
    for (let block of this.blocks) {
      await block.measureTemperature(this.air.temperature, timestamp);
    }
    
    if (this.needSync & new Date().getTime () - this.lastSync >= WELL_SYNC_INTERVAL) {
      this.synchronizeWells();
    }
    // TODO: Control all wells
    // TODO: Isn't the controlled ramp speed to fast? (Shift to "fast ramp" mode.)
    
    console.log(timestamp/1000 + "sec\t" + this.blocks.map((block)=>{return block.temperature}).join("\t"));
  }
  
}

const well = new Well();
well.start();
well.setTargetTemp(90);
setInterval(
  ()=>{
    well.update();
  },
  1000
);
