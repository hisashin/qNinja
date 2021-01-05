# Ninja-qPCR core application

This directory contain the core application of Ninja-qPCR.

* ninjaqpcr.js : Core functionalities for running experiments and control devices. [More...](./API_ninjaqpcr.md)
* experiment_manager.js : Manager of experiment logs [More...](./API_log_manager.md)
* protocol_manager.js : Manager of experiment logs [More...](./API_protocol_manager.md)
* optics_analysis.js : Fluorescence analyzer class providing mathematical functionalities
  * Basic qPCR analysis
  * Baseline & threshold calculation (users can also set these values manually.)
  * Standard curve
  * Melt curve analysis


## Standalone demo

"demo.js" shows a demo of calling the core module. It simulates a typical qPCR + melt curve profile.

```
node demo.js
```

## Usage of NinjaQPCR class
Import the qPCR module.

```
const NinjaQPCR = require("./ninjaqpcr");
const hardwareConf = require("./conf/dummy_hardware_conf.js");
const qpcr = new NinjaQPCR(hardwareConf);

```

## Protocols

### Examples

* protocol_example.js : Typical protocol with initial hold, qPCR cycles and melt curve.
* protocol_example.js : Very short protocol for rapid testing.

### Format

```
{
  id: "2B93DB54-E14D-444F-BAEE-5B595F3FB917",
  lid_temp: 40.0,
  final_hold_temp:20.0,
  name: "Dev Protocol",
  stages: [
    {  
      type: Constants.StageType.HOLD,
      repeat: 1,
      steps: [
        { label:"hold", temp:DEMO_TEMP_HIGH, duration:5.0, data_collection:[] }
      ]
    },
    {
      type: Constants.StageType.QPCR,
      repeat: 3,
      steps: [
        { label:"denature", temp:DEMO_TEMP_HIGH, duration:6.0, data_collection:[3, 4] },
        { label:"anneal", temp:DEMO_TEMP_MEDIUM, duration:6.0, data_collection:[3, 4] },
        { label:"extend", temp:DEMO_TEMP_LOW, duration:6.0, data_collection:[3, 4] }
      ]
    },
    {
      type: Constants.StageType.MELT_CURVE,
      repeat: 1,
      steps: [
        { label:"denature", duration:5, temp:DEMO_TEMP_HIGH, data_collection:[] },
        { label:"cool", duration:5, temp:DEMO_TEMP_MEDIUM, data_collection:[] },
        { label:"melt", ramp_speed: 0.4, duration:5.0, temp:DEMO_TEMP_HIGH, data_collection:[1] }
      ]
    }
  ]
};
```

### Fields

Protocol
* id : UUID of the protocol. It corresponds the name of the file.
* lid_temp : Temperature of the head lid (in Celsius)
* final_hold_temp : Temperature of the head lid (in Celsius)
* name : Name of the protocol
* stages : List of stages (See below.)

Stage
* type : Type of the stage. 1=HOLD, 2=QPCR, 3=MELT_CURVE, 4=PCR (without fluorescence measurement)
* repeat : Number of cycles
* steps : List of steps (See below.)

Step
* label : Name
* duration : Hold duration (in secs)
* temp : Well temperature (in Celsius)
* data_collection : List of fluorescence data collection. 1=RAMP_CONTINUOUS, 2=HOLD_CONTINUOUS, 3=RAMP_END, 4=HOLD_END