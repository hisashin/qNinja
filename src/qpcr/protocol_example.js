"use strict";
const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

/* Initial extension */
const example_hold_stage = {
  type: STAGE_TYPE_HOLD,
  repeat: 1,
  steps: [
    { label:"initial", temp:94.0, duration:15.0, data_collection:[] }
  ]
};

/* PCR */
const example_pcr_stage = {
  type: STAGE_TYPE_PCR,
  repeat: 35,
  steps: [
    { label:"denature", temp:94.0, duration:15.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] },
    { label:"anneal", temp:55.0, duration:15.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] },
    { label:"extend", temp:72.0, duration:15.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] }
  ]
};

const example_melt_curve_stage = {
  type: STAGE_TYPE_MELT_CURVE,
  repeat: 1,
  steps: [
    { label:"denature", ramp_speed: 1.0, hold_duration:15, temp:95.0, data_collection:[] },
    { label:"cool", ramp_speed: 1.0, hold_duration:15, temp:55.0, data_collection:[] },
    { label:"melt", ramp_speed: 1.0, hold_duration:15, temp:95.0, data_collection:[MEASUREMENT_RAMP_CONTINUOUS] }
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