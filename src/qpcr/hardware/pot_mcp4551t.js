// Digital potentiometer MCP4551T-502E/MS (5kOhm, full range)
"use strict";

const i2c = require('i2c-bus');
const DEFAULT_BUS_NUMBER = 1;
class MCP4551T {
  constructor (i2c, deviceAddress) {
    this.deviceAddress = deviceAddress;
    if (typeof(i2c)=="number") {
      console.log("I2C bus is specified by bus number.");
      if ( !(i2c == 1 || i2c == 2)) {
        throw new Error("i2cBusNumber should be 1 or 2.");
      }
      this.i2cBusNumber = i2c;
    } else if (i2c != null) {
      console.log("Setting I2C object");
      this.i2c = i2c;
    } else {
      this.i2cBusNumber = DEFAULT_BUS_NUMBER;
    }
  }
  
  initialize () {
    if (this.i2c == null) {
      this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2
    }
  }
  // 0 - 256
  setWiper (wiperVal) {
    const val0 = wiperVal >> 8 & 0x01;
    const val1 = wiperVal & 0xFF;
    this.i2c.i2cWriteSync(this.deviceAddress, 2, Buffer.from([val0, val1]));
  }
  incrementWiper () {
    const val = 0x04;
    this.i2c.i2cWriteSync(this.deviceAddress, 1, Buffer.from([val]));
  }
  decrementWiper () {
    const val = 0x08;
    this.i2c.i2cWriteSync(this.deviceAddress, 1, Buffer.from([val]));
  }
}
module.exports = MCP4551T;