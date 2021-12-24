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
      // Calculate wiper value
      if (value > 0) {
        this.relay.setDirection(Relay.Direction.FORWARD);
      } else if (value < 0) {
        this.relay.setDirection(Relay.Direction.BACKWARD);
      } else {
        this.relay.setDirection(Relay.Direction.OFF);
      }
      // TODO Map value to vOut
      let vOut = Math.abs(value); // Required voltage
      this.absOutput.setOutput(vOut);
    }
    shutdown () {
      this.relay.off();
      if (this.absOutput.off) {
        this.absOutput.off();
      }
    }
}
module.exports = Peltier;
