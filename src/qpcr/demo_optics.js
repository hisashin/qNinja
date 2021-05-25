"use strict";
const USE_DUMMY = false;
const hardwareConf = (USE_DUMMY) ? require("./conf/dummy_hardware_multi_conf.js") : require("./conf/batch3_hardware_conf.js");
const Optics = require("./control/optics.js");
const SINGLE_TARGET_WELL_INDEX = 7;
let rpio = null;
if (!USE_DUMMY) {
  rpio = require('rpio');
}

// Run optics demo with batch3 boards.
class OpticsDemo {
  constructor () {
    // const hardwareConf = require(boardConfFile);
    this.led = hardwareConf.getLEDUnit();
    this.photosensing = hardwareConf.getFluorescenceSensingUnit();
    this.wellsCount = hardwareConf.wellsCount();
    this.opticsChannelsCount = hardwareConf.opticsChannelsCount();
    this.opticsStarted = false;
    this.ledStarted = false;
    this.photosensingStarted = false;
    if (!USE_DUMMY) {
      rpio.open(32, rpio.INPUT); // To disable PWM pin for ADA2200's RCLK
    }
  }
  runOpticsDemo () {
    console.log("runOpticsDemo");
    // Combination of LED and Photosensing
    this.optics = new Optics(this.led, this.photosensing, this.wellsCount, this.opticsChannelsCount);
    this.optics.start();
    this.opticsStarted = true;
    setInterval(()=>{
      this.optics.measureAll((values)=>{
        values.forEach((ch, chId)=>{
          ch.forEach((well, wellId)=>{
            well.id = wellId;
          });
        });
        console.log(values);
      });
    }, 3000);
  }
  perWellDemo () {
    console.log("perWellDemo");
    // Combination of LED and Photosensing
    this.optics = new Optics(this.led, this.photosensing, this.wellsCount, this.opticsChannelsCount);
    this.optics.start();
    this.opticsStarted = true;
    let MEASURE_COUNT = 5;
    let sum = 0;
    let count = 0;
    const targetCh = 0;
    const targetWell = 1;
    const interval = setInterval(()=>{
      this.optics.measureAll((values)=>{
        // console.log(values);
        const value = values[targetCh][targetWell];
        console.log(value);
        /*
        let str = value.toString(2);
        while (str.length < 24) {
          str = "0" + str;
        }
        console.log(str);
        console.log(value, 0x800000, );
        */
        /*
        sum += value;
        count ++;
        if (count == MEASURE_COUNT) {
          const avg = sum / MEASURE_COUNT;
          clearInterval(interval);
          console.log("Ch %d Well %d %s", targetCh, targetWell, new Date());
          console.log(avg);
        }
        */
      });
    }, 3000);
  }
  runContinuousDemo () {
    console.log("runContinuousDemo");
    this.optics = new Optics(this.led, this.photosensing, this.wellsCount, this.opticsChannelsCount);
    this.optics.start();
    this.optics.startContinuousDataCollection((values)=>{
      console.log("Continuous:" + JSON.stringify(values));
    });
  }
  runSimulationDemo () {
    console.log("runSimulationDemo");
    const sim = this.photosensing.sim;
    sim.cts = [[24.0]];
    for (let i=0; i<40; i++) {
      const val = sim._getDummyAmplification(i);
      console.log(val);
    }
  }
  //  Event handlers
  runLEDDemo () {
    console.log("runLEDDemo");
    // Test only LEDs
    this.led.start();
    this.ledStarted = true;
    let ch = 0;
    setInterval(()=>{
      this.led.select(ch);
      ch = (ch + 1) % 16;
    }, 4000);
  }
  runPhotosensingDemo () {
    console.log("runPhotosensingDemo");
    // Test photosensing
    this.photosensing.start();
    this.photosensingStarted = true;
    let ch = 0;
    setInterval(()=>{
      const optCh = (ch < 16) ? 0:1;
      const well = ch % 16;
      this.photosensing.measure((measurement)=>{
        console.log("Value=%f", measurement);
        this.photosensing.select(well, optCh); // Next
        console.log("Ch %d %d", well, optCh);
      });
      ch = (ch + 1) % 32;
    }, 1000);
  }
  shutdown () {
    if (this.opticsStarted) {
      this.optics.shutdown();
    }
    if (this.ledStarted) {
      this.led.shutdown();
    }
    if (this.photosensingStarted) {
      this.photosensing.shutdown();
    }
  }
}
const demo = new OpticsDemo();
demo.runOpticsDemo();
// demo.perWellDemo(0,  7);
// demo.runLEDDemo();
// demo.runPhotosensingDemo();
// demo.runSimulationDemo();
process.on('SIGINT', () => {
    console.log('Received SIGINT');
    demo.shutdown();
    process.exit(1);
});