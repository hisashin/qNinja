# Ninja-qPCR core application

This directory contain the core application of Ninja-qPCR.
Only "ninjaqpcr.js" is supposed to be exposed to the web server or other interface apps (such as LCD UI).

# Current status

It is just a simple stub. The module simulates  simple PCR thermal profiles.

# Usage


"server_example.js" shows a demo of calling the core module. It simulates a typical PCR thermal profile 10 times faster than real.

```
node server_example.js
```

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
  cycles: [
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

The module returns current status in three ways:

```
// Returns thermal cycler's status
qpcr.getThermalCyclerStatus()
```

```
// Returns fluorescence measurement data
qpcr.getFluorescenceLogs()
```

```
// Returns both of above
qpcr.getStatus()
```


Respond to events by setting an event receiver and implement callback functions.

```
qpcr.setEventReceiver(this);

```

```
onThermalTransition (data) {
  // Do something
}
```

# TODO
* Implement real hardware
* Define data format
* More functions will be needed
* Define API
* Implement a simple simulator of fluorescence curves of realtime PCR
* Move private classes into subdirs
* and so on