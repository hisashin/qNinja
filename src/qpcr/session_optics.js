const eventBus = require("./lib/event_bus.js");
// Run optics demo. It calls measureAll every 3s
class OpticsSession {
  constructor () {
    eventBus.subscribe("optics.command", (topic, data)=>{
      // TODO
    });
    this.measurement = [];
    for (let i=0; i<16; i++) {
      this.measurement.push(
        {
          id:i,
          vl:0,// Small gain
          vs:0// Small gain
        }
      );
    }
  }
  setHardware (thermalCycler, optics) {
    this.optics = optics;
    /*
    if (!USE_DUMMY) {
      rpio.open(32, rpio.INPUT); // To disable PWM pin for ADA2200's RCLK
    }
    */
  }
  transform (values) {
    for (let i=0; i<16; i++) {
      let v = values[0][i];
      /*
      if (v.s=="10M") {
        this.measurement[i].vl = v.v;
      } else {
        this.measurement[i].vs = v.v;
      }
      */
      this.measurement[i] = v;
    }
    return this.measurement;
  }
  start () {
    console.log("runOpticsDemo");
    this.optics.start();
    this.opticsStarted = true;
    setInterval(()=>{
      this.optics.measureAll((values)=>{
        values.forEach((ch, chId)=>{
          ch.forEach((well, wellId)=>{
            well.id = wellId;
          });
        });
        eventBus.publish("optics.update.measurement", this.transform(values));
      });
    }, 3500);
  }
  shutdown () {
    console.log("Shutting down demo_optics_batch8");
    if (this.opticsStarted) {
      try {
        this.optics.shutdown();
      } catch (e) {
        console.warn(e);
      }
    }
    if (this.ledStarted) {
      try {
        this.led.shutdown();
      } catch (e) {
        console.warn(e);
      }
    }
    if (this.photosensingStarted) {
      try {
        this.photosensing.shutdown();
      } catch (e) {
        console.warn(e);
      }
    }
  }
}

module.exports = OpticsSession;