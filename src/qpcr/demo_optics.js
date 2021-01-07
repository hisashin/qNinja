"use strict";
const hardwareConf = require("conf/batch3_hardware_conf");

// Run optics demo with batch3 boards.
class OpticsDemo {
  constructor () {
    const hardwareConf = require(boardConfFile);
    this.led = hardwareConf.getLEDUnit();
    this.photosensing = hardwareConf.getFluorescenceSensingUnit();
    this.wellsCount = hardwareConf.wellsCount();
    this.opticsStarted = false;
    this.ledStarted = false;
    this.photosensingStarted = false;
  }
  runOpticsDemo () {
    // Combination of LED and Photosensing
    this.optics = new Optics(this.led, this.photosensing, this.wellsCount);
    this.optics.start();
    this.opticsStarted = true;
    setInterval(()=>{
      this.optics.measureAll((values)=>{
        console.log(values);
      });
    }, 2000);
  }
  runLEDDemo () {
    // Test only LEDs
    this.led.start();
    this.ledStarted = true;
    let ch = 0;
    setInterval(()=>{
      this.led.selectChannel(ch);
      ch = (ch + 1) % 16;
    }, 2000);
  }
  runPhotosensingDemo () {
    // Test photosensing
    this.photosensing.start();
    this.photosensingStarted = true;
    let ch = 0;
    setInterval(()=>{
      this.photosensing.measure(ch, (measurement)=>{
        console.log("ch%d=%f", ch, measurement);
        ch = (ch + 1) % 16;
      });
    }, 2000);
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
// demo.runLEDDemo();
// demo.runPhotosensingDemo();

process.on('SIGINT', () => {
    console.log('Received SIGINT');
    demo.shutdown();
    process.exit(1);
});