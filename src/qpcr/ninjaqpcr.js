"use strict";

const ThermalCycler = require("./thermal_cycler");
const Optics = require("./optics");

/* QPCR Interface */
class NinjaQPCR {
  constructor () {
    this.thermalCycler = new ThermalCycler();
    this.thermalCycler.setEventReceiver(this);
    this.optics = new Optics();
    this.optics.setEventReceiver(this);
  }
  setEventReceiver (receiver) {
    this.receiver = receiver;
    /*
      onThermalTransition(transition)
      onError(error)
      onExperimentFinish()
    */
  }
  start (protocol) {
    this.thermalCycler.start(protocol);
    this.optics.start();
  }
  getStatus () {
    const status = {
      thermalCycler: this.thermalCycler.getStatus(),
      fluorescence: this.optics.getStatus()
    };
    return status;
  }
  getThermalCyclerStatus () {
    return this.thermalCycler.getStatus();
  }
  getFluorescenceLogs () {
    return this.optics.getStatus();
  }
  onThermalTransition (data) {
    if (this.receiver != null) {
      this.receiver.onThermalTransition(data);
    }
  }
  
}

module.exports = new NinjaQPCR();