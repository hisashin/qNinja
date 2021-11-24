const eventBus = require("./lib/event_bus.js");
// Run optics demo with batch3 boards.
const MAXTEMP = 50;
class PlateControlSession {
  constructor () {
  }
  setHardware (thermalCycler, optics) {
    this.thermalCycler = thermalCycler;
    this.plate = thermalCycler.plate;
    
    const plateSensing = this.plate.sensing;
    console.log("ThermalCycler")
    console.log(thermalCycler)
    const plateOutput = this.plate.output;
    this.heater = plateOutput.plateHeaterPWM; // Example: this.plateHeaterPWM.write(value) 0..1
    this.peltier = plateOutput.peltier; // Example: this.peltier.setOutput(value) -1..1
    this.fan = plateOutput.fanPWM; // Example: this.fanPWM.write(value); 0..1
  }
  setOutput (heater, peltier, fan) {
    console.log("SessionPlateControl.setOutput heater=%f, peltier=%f, fan=%f", heater, peltier, fan);
  }
  off () {
    this.setOutput(0, 0, 1.0);
  }
  start () {
    console.log("SessionPlateControl.start");
    // Start temperature monitoring
    this.interval = setInterval(()=>{
      this.thermalCycler.tempMonitor.getMeasurement((detail)=>{
        eventBus.publish("plate.update.measurement", detail);
        if (detail.plate.block > MAXTEMP) {
          console.log("MAXTEMP");
          this.off();
        }
      }, 500);
    }, 500);
    this.setOutput(0, 0, 0);
    this.subId = eventBus.subscribe("plate.command", (topic, data)=>{
      if (topic == "plate.command.setOutput") {
        this.setOutput(data.heater, data.peltier, data.fan);
      }
      else if (topic == "plate.command.off") {
        this.off();
      } else {
        console.log(topic)
        console.log(data)
      }
    });
  }
  shutdown () {
    console.log("Shutting down demo_optics_batch8");
    eventBus.unsubscribe(this.subId);
    clearInterval(this.interval);
  }
}

module.exports = PlateControlSession;