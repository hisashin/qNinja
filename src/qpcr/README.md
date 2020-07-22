# Ninja-qPCR core application

This directory contain the core application of Ninja-qPCR.

* ninjaqpcr.js : Core functionalities for running experiments and control devices. [More...](./API_ninjaqpcr.md)
* log_manager.js : Manager of experiment logs [More...](./API_log_manager.md)
* protocol_manager.js : Manager of experiment logs [More...](./API_protocol_manager.md)
* optics_analysis.js : Fluorescence analyzer class providing mathematical functionalities
  * Basic qPCR analysis
  * Baseline & threshold calculation (users can also set these values manually.)
  * Standard curve
  * Melt curve analysis


# Standalone demo

"demo.js" shows a demo of calling the core module. It simulates a typical qPCR + melt curve profile.

```
node demo.js
```

# Usage of NinjaQPCR class
Import the qPCR module.

```
const NinjaQPCR = require("./ninjaqpcr");
const hardwareConf = require("./conf/dummy_hardware_conf.js");
const qpcr = new NinjaQPCR(hardwareConf);

```

Start an experiment.
(Note: The data format below is undecided. More properties are needed.)

```
const protocol = {
  lidTemp: 110,
  stages: [
    {
      repeat: 1,
      steps: [
        { type:"initial denaturation", temp:94.0, duration:15.0 }
      ]
    },
    {
      repeat: 30,
      steps: [
        { type:"denaturation", temp:94.0, duration:15.0 },
        { type:"annealing", temp:55.0, duration:15.0 },
        { type:"extension", temp:72.0, duration:15.0 }
      ]
    },
    {
      repat: 1,
      steps: [
        { type:"final extension", temp:72.0, duration:30.0 }
      ]
    }
  ]
}
qpcr.start(protocol);
```