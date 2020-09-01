"use strict";

const Constants = require("./constants");

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

/* Initial extension */
const example_hold_stage = {
  type: Constants.StageType.HOLD,
  repeat: 1,
  steps: [
    { label:"initial", temp:94.0, duration:15.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} }
  ]
};

/* qPCR */
const example_pcr_stage = {
  type: Constants.StageType.QPCR,
  repeat: 35,
  steps: [
    { label:"denature", temp:94.0, duration:15.0, data_collection:{ramp_end:true, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"anneal", temp:55.0, duration:15.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"extend", temp:72.0, duration:15.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} }
  ]
};

const example_melt_curve_stage = {
  type: Constants.StageType.MELT_CURVE,
  repeat: 1,
  steps: [
    { label:"denature", ramp_speed: 1.0, duration:15, temp:95.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"cool", ramp_speed: 1.0, duration:15, temp:55.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false, hold_continuous:false} },
    { label:"melt", ramp_speed: 1.0, duration:15, temp:95.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:true, hold_continuous:false} }
  ]
};

const protocol = {
  name: "Dev Protocol",
  id:"457DE8E9-604D-4CE6-9E7A-4E10CD9D9160",
  lid_temp: 110.0, // Celsius
  stages: [
    example_hold_stage,
    example_pcr_stage,
    example_melt_curve_stage
  ]
};

module.exports = protocol;