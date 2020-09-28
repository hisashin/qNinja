"use strict";

const Well = require('./well_multi.js');
const HeatModel = require('./heat_model.js');
const WellBlock = require('./well_block.js');
const PID = require("./heat_control/pid.js");

const DEFAULT_TEMP = 25.0;
class DummyAir {
  constructor (model) {
    this.model = model;
    this.temperature = DEFAULT_TEMP;
  }
  measureTemperature () {
    return new Promise ((resolve)=>{
      // TODO call thermistor & mux implementation.
      setTimeout(()=>{
        resolve()
      }, 50);
    });
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

const WELL_KP = 0.25;
const WELL_KI = 0.1;
const WELL_KD = 0.1;

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
// Heating rate when wellTemp-airTemp=0 & full drive
const Y_INTERCEPT = 2.0; // deg/sec
const X_INTERCEPT = 110; // wellTemp - airTemp at the equilibrium
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

// TODO: separate dummy well sensing and dummy heater output
function initWellInstance () {
  // TODO replace with real items
  const blocks = [];
  const models = [];

  for (let i=0; i<BLOCKS_COUNT; i++) {
    const pid = new PID(WELL_KP, WELL_KI, WELL_KD);
    pid.setOutputRange(-1, 1.0);
    let model = new HeatModel();
    const wellSensing = new DummySensing(model);
    const output = new DummyHeater(model);
    models.push(model);
    const block = new WellBlock(pid, wellSensing, output);
    block.tmpId = i;
    // Dummy well
    blocks.push(block);
  }
  const fan = new DummyFan(models);
  const air = new DummyAir();
  const well = new Well(blocks, fan, air);
  return well;
}

const well = initWellInstance();

/*
well.start();
well.setTargetTemperature(70);
let flg = false;
setInterval(
  ()=>{
    const temp = well.blocks[0].temperature;
    
    if (temp > 70 && !flg) {
      console.log("TEMPLOG SWITCH!")
      well.setTargetTemperature(30);
      flg = true;
    }
    well.control();
  },
  500
);
*/
module.exports = well;