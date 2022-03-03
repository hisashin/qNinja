"use strict";

const Validator = require("./validator");

const LID_TEMP_MAX = 120;
const LID_TEMP_MIN = 0;
const PLATE_TEMP_MAX = 100;
const PLATE_TEMP_MIN = 25;

const RULE_DATA_COLLECTION = {
  ramp_end: { type:"boolean", required:false },
  hold_end: { type:"boolean", required:false },
  ramp_continuous: { type:"boolean", required:false },
  measurement_interval_temp: { type:"number", required:false, min:0.1, max: 10.0 }
};
const RULE_STEP = {
  label: { type:"string", required:true, min_length:1, max_length:255 },
  temp: { type:"number", required:true, min:PLATE_TEMP_MIN, max:PLATE_TEMP_MAX },
  duration: { type:"number", required:true, min:0, max: 24 * 60 * 60 * 1000 },
  ramp_speed: { type:"number", required:false, min:0, max:20 },
  data_collection: { type:"object", required:false, rule:RULE_DATA_COLLECTION },
  _func: ()=>{}
};
const RULE_STAGE = {
  type: { type:"number", required:false, min:1, max:4 },
  pause_after: { type: "boolean", required: false },
  cycles: { type:"integer", required:true, min:1, max:255 },
  steps: { type:"array", required:true, min_length:1, max_length:8, rule:RULE_STEP },
  _func: ()=>{}
  
};
const RULE_PROTOCOL = {
  name: { type:"string", required:true, min_length:1, max_length:255 },
  lid_temp: { type:"number", required:false, min:LID_TEMP_MIN, max:LID_TEMP_MAX },
  final_hold_temp: { type:"number", required:false, min:PLATE_TEMP_MIN, max:PLATE_TEMP_MAX },
  stages: { type:"array",required:true,  min_length:1, max_length:8, rule:RULE_STAGE },
  _func: ()=>{}
};

module.exports = new Validator(RULE_PROTOCOL);

