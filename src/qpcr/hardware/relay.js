"use strict";
const rpio = require('rpio');
class Relay {
    constructor (pinSwitchA, pinSwitchB, /* Optional */ pinGate) {
      // TODO remove pinGate
      this.pinSwitchA = pinSwitchA;
      this.pinSwitchB = pinSwitchB;
      this.pinGate = pinGate;
      this.direction = Relay.Direction.NONE;
    }
    start () {
      rpio.open(this.pinSwitchA, rpio.OUTPUT, rpio.LOW);
      rpio.open(this.pinSwitchB, rpio.OUTPUT, rpio.LOW);
      if (this.pinGate) {
        rpio.open(this.pinGate, rpio.OUTPUT, rpio.LOW);
      }
    }
    off () {
      rpio.write(this.pinSwitchA, 0);
      rpio.write(this.pinSwitchB, 0);
      if (this.pinGate) {
        rpio.write(this.pinGate, 0);
      }
    }
    setDirection (direction) {
      if (direction == Relay.Direction.OFF) {
        rpio.write(this.pinSwitchA, 0);
        rpio.write(this.pinSwitchB, 0);
      } else if (direction == Relay.Direction.FORWARD) {
        //console.log("%d->1, %d->0", this.pinSwitchA, this.pinSwitchB);

        rpio.write(this.pinSwitchA, 0);
        rpio.write(this.pinSwitchB, 1);
        if (this.pinGate) {
            rpio.write(this.pinGate, 1);
        }
      } else if (direction == Relay.Direction.BACKWARD) {
        // console.log("%d->0, %d->1", this.pinSwitchA, this.pinSwitchB);
        
        rpio.write(this.pinSwitchA, 1);
        rpio.write(this.pinSwitchB, 0);
        if (this.pinGate) {
             rpio.write(this.pinGate, 1);
        }
      }
      this.direction = direction;
    }
    shutdown () {
      this.off();
    }
  }
  Relay.Direction = {
    NONE: -1,
    OFF: 0,
    FORWARD: 1,
    BACKWARD: 2
  };
  module.exports = Relay;