// Digital potentiometer MCP4551T-502E/MS (5kOhm, full range)

const i2c = require('i2c-bus');
class MCP4551T {
  constructor (i2cBusNumber, slaveAddress) {
    this.slaveAddress = slaveAddress;
    this.i2c = null;
    if (i2cBusNumber == null) {
      i2cBusNumber = DEFAULT_DEVICE_NUMBER;
    }
    if ( !(i2cBusNumber == 1 || i2cBusNumber == 2)) {
      throw new Error("i2cBusNumber should be 1 or 2.");
    }
    this.i2cBusNumber = i2cBusNumber;
  }
  initialize () {
    this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2
    
  }
  setWiper (wiperVal) {
    /*
    
  Wire.write(temp);
  temp = (value & 0xFF);
  Wire.write(temp);
  */
  /*
    const val0 = 0b10000000 | (0b10 & (wiperVal>>7));
    const val1 = 0xFF & resVal;
    */
    const val0 = wiperVal >> 8 & 0x01;
    const val1 = wiperVal & 0xFF;
    this.i2c.i2cWriteSync(this.slaveAddress, 2, new Buffer([val0, val1]));
  }
  incrementWiper () {
    const val = 0x04;
    this.i2c.i2cWriteSync(this.slaveAddress, 1, new Buffer([val]));
  }
  decrementWiper () {
    const val = 0x08;
    this.i2c.i2cWriteSync(this.slaveAddress, 1, new Buffer([val]));
  }
}
module.exports = MCP4551T;