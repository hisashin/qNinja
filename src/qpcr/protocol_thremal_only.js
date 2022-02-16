"use strict";

const Constants = require("./constants");

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;


const protocol = {
  name: "Thermal Protocol",
  id:"457DE8E9-604D-4CE6-9E7A-4E10CD9D9160",
  lid_temp: 100, // Set "0" to disable lid heating
  stages: [
    {
      type: Constants.StageType.MELT_CURVE,
      cycles: 10,
      steps: [
        { label:"denature", duration:60, temp:85.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} },
        { label:"cool", duration:60, temp:50.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} },
        { label:"melt", duration:60, temp:68.0, data_collection:{ramp_end:false, hold_end:false, ramp_continuous:false} }
      ]
    }
  ]
};

module.exports = protocol;