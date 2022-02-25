/* 
  Plate class represents a total system of the PCR plate.
  It consists of
   * One metal block
   * Fan
  */

  
const PlateBlock = require('./plate_block.js');
const PromiseQueue = require("../lib/promise_queue.js");
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
  constructor (block, fan, air) {
    this.block = block;
    this.fan = fan;
    this.air = air;
    this.targetTemperature = DEFAULT_TEMP;
    this.controlType = CONTROL_TYPE.HOLDING;
    
    // If true, all blocks' output settings are syncronyzed with the most slow one.
    // If false, all blocks are controlled individually to keep the target temperature.
    this.isOff = true;
  
  }
  start () {
    this.startTime = new Date().getTime();
    this.air.measureTemperature(()=>{
      this.isOff = false;
      
    });
  }
  off () {
    this.isOff = true;
    this.block.off();
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
    if (targetTemperature > this.targetTemperature) {
      this.controlType = CONTROL_TYPE.HEATING;
    } else if (targetTemperature < this.targetTemperature) {
      this.controlType = CONTROL_TYPE.COOLLING;
    } else {
      this.controlType= CONTROL_TYPE.HOLDING;
    }
    this.block.setTargetTemperature(targetTemperature); 
    this.targetTemperature = targetTemperature;
    this.block.pid.setSetpoint(this.targetTemperature);
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
    queue.push(this._measureBlockTemperatureTask(this.block, timestamp));
    new PromiseQueue(queue).exec().then(()=>{
      this._control();
      callback();
    });
  }
  _control() {
    this.temperature = this.block.temperature;
    
    if (!this.isOff) {
      this.block.calcDesiredOutput();
      
      let minDesiredOutput = 0;
      minDesiredOutput = Math.min(minDesiredOutput, this.block.desiredOutput);
      // TODO: consider heater & fan ratio
      if (minDesiredOutput < 0) {
        this.fan.setOutput(-minDesiredOutput);
      } else {
        this.fan.setOutput(minDesiredOutput);
      }
      const output = this.block.desiredOutput - minDesiredOutput;
      this.block.setOutput(output);
    }
  }
  getTemperature () {
    return this.temperature();
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

