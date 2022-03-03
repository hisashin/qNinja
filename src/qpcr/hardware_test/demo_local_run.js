"use strict";
const NinjaQPCR = require("../ninjaqpcr");

const qpcr = new NinjaQPCR("hardware.json");
const protocol = require("../dev_protocol");

const em = require("../experiment_manager");

const NO_SAVE = false;
const DEMO_CONFIG = {
  "series_list": [
    {
      "label": "Demo",
      "type": "standard",
      "start_quantity": 1,
      "factor": 10,
      "count": 5,
      "wells": [
        0,
        1,
        2,
        3,
        4
      ]
    }
  ],
  "wells": [
    {
      "id": 0,
      "label": "Std A",
      "quantity": 0.1,
      "is_in_series": true,
      "name": "A1",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 1,
      "series_quantity": 1
    },
    {
      "id": 1,
      "label": "Std B",
      "quantity": 0.2,
      "is_in_series": true,
      "name": "A2",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 2,
      "series_quantity": 2
    },
    {
      "id": 2,
      "label": "Std C",
      "quantity": 0.3,
      "is_in_series": true,
      "name": "A3",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 4,
      "series_quantity": 4
    },
    {
      "id": 3,
      "label": "Std D",
      "quantity": 0.4,
      "is_in_series": true,
      "name": "A4",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 8,
      "series_quantity": 8
    },
    {
      "id": 4,
      "label": "Std E",
      "quantity": 0.5,
      "is_in_series": true,
      "name": "A5",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 16,
      "series_quantity": 16
    },
    {
      "id": 5,
      "label": "Sample F",
      "quantity": "",
      "is_in_series": false,
      "name": "A6",
      "type": "unknown"
    },
    {
      "id": 6,
      "label": "Sample G",
      "quantity": "",
      "is_in_series": false,
      "name": "A7",
      "type": "unknown"
    },
    {
      "id": 7,
      "label": "Sample H",
      "quantity": "",
      "is_in_series": false,
      "name": "A8",
      "type": "unknown"
    },
    {
      "id": 8,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B1"
    },
    {
      "id": 9,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B2"
    },
    {
      "id": 10,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B3"
    },
    {
      "id": 11,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B4"
    },
    {
      "id": 12,
      "label": "",
      "type": "negative_control",
      "is_in_series": false,
      "name": "B5"
    },
    {
      "id": 13,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B6"
    },
    {
      "id": 14,
      "label": "",
      "type": "empty",
      "is_in_series": false,
      "name": "B7"
    },
    {
      "id": 15,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B8"
    }
  ]
};
/* Implementation example */
class NinjaQPCRDemo {
  constructor  () {
  }
  start () {
    qpcr.setEventReceiver(this);
    const option = {
      protocol: protocol,
      config:DEMO_CONFIG
    };
    if (NO_SAVE) {
      const experiment = em.createExperimentDraft(option);
      qpcr.start(experiment);
      this.isRunning = true;
    } else {
      em.create(option, (experiment)=>{
        qpcr.start(experiment);
        this.isRunning = true;
      }, (err)=>{
        console.error(err);
      })
    }
  }
  /* Callback functions */
  onStart (data) {
    console.log(data);
  }
  onComplete (data) {
    console.log(data);
    qpcr.shutdown();
    qpcr.exit();
  }
  onThermalTransition (data) {
    console.log(data);
  }
  
  onAutoPause (data) {
    console.log("onAutoPause. Resume after 5 seconds.");
    setTimeout(()=>{qpcr.finishAutoPause();}, 5000);
  }
  onProgress (data) {
    console.log("NINJA\tPROGRESS\t%d\t%f\t%f", data.elapsed, data.lid, data.plate);
  }
  onMeltCurveDataUpdate (data) {
    const dataToShow = data.v[0].map(well=>well.v);
    /*
    console.log(data.temp)
    console.log(dataToShow);
    */
    console.log("NINJA\tMELT\t%f\t%s", data.temp,dataToShow.join("\t"));
  }
  onFluorescenceDataUpdate (data) {
    // console.log(data);
    /*
{
  t: 288394,
  v: [
    [
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object]
    ],
    [
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object],
      [Object], [Object]
    ]
  ],
  stage: 1,
  cycle: 3,
  step: 0
}
    */
    const dataToShow = data.v[0].map(well=>well.v);
    console.log(dataToShow);
    console.log("NINJA\tFLUO\t%d\t%s", data.cycle,dataToShow.join("\t"));
  }
  onFluorescenceEvent (data) {
    // optics.start / optics.stop / optics.measure / optics.baseline
    console.log(data);
  }
  onComplete () {
    this.isRunning = false;
  }
  onDeviceStateChange (state) {
    console.log(state);
  }
}
new NinjaQPCRDemo().start();
process.on('SIGINT', () => {
    console.log('demo_local_run.js Received SIGINT');
    qpcr.shutdown();
    qpcr.exit();
});
