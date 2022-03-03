"use strict";
/*
  Very short protocol for development
*/
const Constants = require("./constants");

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

const LID_TEMP = 80;
const DEMO_TEMP_HIGH = 72.0;
const DEMO_TEMP_MEDIUM =  60.0;
const DEMO_TEMP_LOW = 40.0;
/* Initial extension */
const example_hold_stage = {
  type: Constants.StageType.HOLD,
  cycles: 1,
  pause_after: false,
  steps: [
    { label:"hold", temp:DEMO_TEMP_HIGH, duration:5.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} }
  ]
};

/* PCR */
const example_pcr_stage = {
  type: Constants.StageType.QPCR,
  cycles:  10,
  pause_after: false,
  steps: [
    { label:"denature", temp:DEMO_TEMP_HIGH, duration: 5.0, data_collection:{ramp_end:true, hold_end:false, ramp_continuous:false} },
    { label:"anneal", temp:DEMO_TEMP_LOW, duration:5.0, data_collection:{ramp_end:true, hold_end:false, ramp_continuous:false} },
    { label:"extend", temp:DEMO_TEMP_MEDIUM, duration:5.0, data_collection:{ramp_end:true, hold_end:false, ramp_continuous:false} }
  ]
};

const example_melt_curve_stage = {
  type: Constants.StageType.MELT_CURVE,
  cycles: 1,
  pause_after: false,
  steps: [
    { label:"denature", duration:5, temp:DEMO_TEMP_HIGH, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} },
    { label:"cool", duration:5, temp:DEMO_TEMP_LOW, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} },
    { label:"melt", ramp_speed: 0.05, duration:5.0, temp:DEMO_TEMP_HIGH, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:true, measurement_interval_temp: 0.5} }
  ]
};

const protocol = {
  id: "2B93DB54-E14D-444F-BAEE-5B595F3FB917",
  lid_temp: LID_TEMP, // Celsius
  final_hold_temp:20,
  name: "Dev Protocol",
  pause_after: false,
  stages: [
    example_hold_stage,
    example_pcr_stage,
    example_melt_curve_stage
  ]
};

module.exports = protocol;


