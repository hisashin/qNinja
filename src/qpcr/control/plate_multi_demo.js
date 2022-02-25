"use strict";

const Plate = require('./plate_multi.js');
const HeatModel = require('./heat_model.js');
const PlateBlock = require('./plate_block.js');
const PID = require("./heat_control/pid_simple.js");

const DEFAULT_TEMP = 25.0;
class DummyAir {
  constructor (model) {
    this.model = model;
    this.temperature = DEFAULT_TEMP;
  }
  measureTemperature (callback) {
    // TODO call thermistor & mux implementation.
    setTimeout(()=>{
      callback();
    }, 50);
  }
}

class DummyFan {
  constructor (models) {
    this.models = models;
  }
  setOutput (value) {
    this.models.forEach((model)=>{
      model.setNegativeInflux(value);
    });
  }
}

const PLATE_KP = 0.25;
const PLATE_KI = 0.1;
const PLATE_KD = 0.1;

const BLOCKS_COUNT = 4;

class DummyHeater {
  constructor (model) {
    this.model = model;
  }
  // API
  setOutput(value) {
    this.outputValue = value;
    this.model.setPositiveInflux(value);
  }
}
// Heating rate when plateTemp-airTemp=0 & full drive
const Y_INTERCEPT = 2.0; // deg/sec
const X_INTERCEPT = 110; // plateTemp - airTemp at the equilibrium
const MEASUREMENT_INTERVAL = 0.5;
class DummySensing {
  constructor (model) {
    this.model = model;
  }
  readTemperature (callback) {
    setTimeout(()=>{
      this.model.update();
      this.temperature = this.model.getTemperature();
      callback(this.temperature);
    }, 50);
    
  }
}

// TODO: separate dummy plate sensing and dummy heater output
function initPlateInstance () {
  // TODO replace with real items
  const blocks = [];
  const models = [];

  for (let i=0; i<BLOCKS_COUNT; i++) {
    const pid = new PID(PLATE_KP, PLATE_KI, PLATE_KD);
    pid.setOutputRange(-1, 1.0);
    let model = new HeatModel();
    const plateSensing = new DummySensing(model);
    const output = new DummyHeater(model);
    models.push(model);
    const block = new PlateBlock(pid, plateSensing, output);
    block.tmpId = i;
    // Dummy Plate
    blocks.push(block);
  }
  const fan = new DummyFan(models);
  const air = new DummyAir();
  return new Plate(blocks, fan, air);
}

const plate = initPlateInstance();

/*
plate.start();
plate.setTargetTemperature(70);
let flg = false;
setInterval(
  ()=>{
    const temp = plate.blocks[0].temperature;
    
    if (temp > 70 && !flg) {
      console.log("TEMPLOG SWITCH!")
      plate.setTargetTemperature(30);
      flg = true;
    }
    plate.control();
  },
  500
);
*/
module.exports = plate;