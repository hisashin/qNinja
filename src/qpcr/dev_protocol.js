"use strict";
/*
  Very short protocol for development
*/
const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

const DEMO_TEMP_HIGH = 65.0;
const DEMO_TEMP_MEDIUM = 50.0;
const DEMO_TEMP_LOW = 35.0;
/* Initial extension */
const example_hold_stage = {
  type: STAGE_TYPE_HOLD,
  repeat: 1,
  steps: [
    { label:"initial", temp:DEMO_TEMP_HIGH, duration:5.0, data_collection:[] }
  ]
};

/* PCR */
const example_pcr_stage = {
  type: STAGE_TYPE_PCR,
  repeat: 7,
  steps: [
    { label:"denature", temp:DEMO_TEMP_HIGH, duration:5.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] },
    { label:"anneal", temp:DEMO_TEMP_MEDIUM, duration:5.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] },
    { label:"extend", temp:DEMO_TEMP_LOW, duration:5.0, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END] }
  ]
};

const example_melt_curve_stage = {
  type: STAGE_TYPE_MELT_CURVE,
  repeat: 1,
  steps: [
    { label:"denature", duration:10, temp:DEMO_TEMP_HIGH, data_collection:[] },
    { label:"cool", duration:10, temp:DEMO_TEMP_MEDIUM, data_collection:[] },
    { label:"melt", ramp_speed: 0.4, duration:10, temp:DEMO_TEMP_HIGH, data_collection:[MEASUREMENT_RAMP_CONTINUOUS] }
  ]
};

const protocol = {
  lidTemp: 40.0, // Celsius
  cycles: [
    example_hold_stage,
    example_pcr_stage,
    example_melt_curve_stage
  ]
};

module.exports = protocol;