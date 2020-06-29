const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

let LABEL_MAP = {};
LABEL_MAP[STAGE_TYPE_HOLD] = "Hold";
LABEL_MAP[STAGE_TYPE_PCR] = "PCR";
LABEL_MAP[STAGE_TYPE_MELT_CURVE] = "Melt Curve";

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

const DEFAULT_STAGE_HOLD = { type: STAGE_TYPE_HOLD, 
  repeat:1, 
  steps:[ {label:"hold", temp:94, duration:15, data_collection:[]} ] };
const DEFAULT_STAGE_PCR = { type: STAGE_TYPE_PCR, 
  repeat:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"anneal", temp:55, duration:12, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"extend", temp:72, duration:18, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]} ] };
const DEFAULT_STAGE_MELT_CURVE = { type: STAGE_TYPE_MELT_CURVE, 
  repeat:1, 
  steps:[ {label:"denature", temp:94, duration:10, speed:4, data_collection:[]}, 
  {label:"cool", temp:55, duration:5, speed:4, data_collection:[]}, 
  {label:"melt", temp:94, duration:15, speed:0.05, data_collection:[MEASUREMENT_RAMP_CONTINUOUS]} ] };
  
  new Vue({ 
    el: '#protocolViewer',
    data: {
      lidTemp: 110,
      stages: [ 
        DEFAULT_STAGE_HOLD,
        DEFAULT_STAGE_PCR,
        DEFAULT_STAGE_MELT_CURVE
      ]
    }
  });
new Vue({ 
  el: '#protocolEditor',
  data: {
    lidTemp: 110,
    stages: [ 
      DEFAULT_STAGE_HOLD,
      DEFAULT_STAGE_PCR,
      DEFAULT_STAGE_MELT_CURVE
    ]
  },
  methods: {
    confirmDelete: function (index) {
      if (window.confirm("Delete " + index + "?")) {
        this.stages.splice(index, 1);
      }
    },
    addHold: function () {
      console.log("addHold");
      this.stages.push(DEFAULT_STAGE_HOLD);
    },
    addPCR: function () {
      console.log("addPCR");
      this.stages.push(DEFAULT_STAGE_PCR);
    },
    addMeltCurve: function () {
      this.stages.push(DEFAULT_STAGE_MELT_CURVE);
    },
    save: function () {
      console.log(JSON.stringify(this.$data))
    }
  }
});