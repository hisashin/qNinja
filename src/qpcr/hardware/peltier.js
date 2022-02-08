"use strict";
const Relay = require("./relay.js");
class Peltier {
    constructor (absOutput, relay) {
      this.absOutput = absOutput;
      this.relay = relay;
    }
    start () {
      if (this.absOutput.start) {
        this.absOutput.start();
      }
      this.relay.start();
    }
    setOutput (value) {
      if (value > 0) {
        this.relay.setDirection(Relay.Direction.FORWARD);
      } else if (value < 0) {
        this.relay.setDirection(Relay.Direction.BACKWARD);
      } else {
        this.relay.setDirection(Relay.Direction.OFF);
      }
      this.absOutput.setOutput(Math.abs(value));
    }
    off () {
      this.relay.off();
      if (this.absOutput.off) {
        this.absOutput.off();
      }
    }
}
module.exports = Peltier;
