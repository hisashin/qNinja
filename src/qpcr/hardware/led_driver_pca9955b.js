// PCA9955B (16ch I2C LED driver)
// Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9955B.pdf
"use strict";
const rpio = require('rpio');
const raspi = require('raspi');

const i2c = require('i2c-bus');
const DEFAULT_BUS_NUMBER = 1;
const REG_ADDR_LEDOUT0 = 0x02;
const REG_ADDR_LEDOUT1 = 0x03;
const REG_ADDR_LEDOUT2 = 0x04;
const REG_ADDR_LEDOUT3 = 0x05;

const LED_COUNT = 16;

class PCA9955B {
  /**
   * 
   * @param {(number|i2c-bus)} i2c Number of I2C bus or i2c-bus object
   * @param {!number} address Device address
   */
  constructor (i2c, address) {
    if (typeof(i2c)=="number") {
      console.log("ADC channel is specified by bus number.");
      if ( !(i2c == 1 || i2c == 2)) {
        throw new Error("i2cBusNumber should be 1 or 2.");
      }
      this.i2cBusNumber = i2c;
    } else if (i2c != null) {
      this.i2c = i2c;
    } else {
      this.i2cBusNumber = DEFAULT_BUS_NUMBER;
    }
    this.leds = [];
    for (let i=0; i<LED_COUNT; i++) {
      this.leds.push(false)
    }
    this.address = address;
  }
  start () {
    if (this.i2c == null) {
      console.log("ADC channel opening: %d", this.i2cBusNumber);
      this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2
        console.log("ADC channel opened: %d", this.i2cBusNumber);
    }
  }
  // Call this to get ready for blank control (by OD pin)
  setBlankControlMode () {
    // Enable  auto increment
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([0x00, 0b10001001]));
    this._writeRegisterSeqSameValues(0x18, 0xFF, 16); // Current value
  }

  /**
   * On single channel
   * @param {!number} ch Channel index
   */
  selectChannel (ch) {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = (ch == i);
    }
    this._applyLEDSelection();
  }
  /**
   * On multiple channels
   * @param {!number[]} chs Array of activated channels
   */
  selectChannels (chs) {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = false;
    }
    chs.forEach((ch)=>{
      this.leds[ch] = true;
    });
    this._applyLEDSelection();
  }

  /**
   * Set output gain control value for specified channel
   * @param {!number} ch Traget channel (0 - 15)
   * @param {!number} iref IREFn value (0 - 255)
   */
  setIREF (ch, iref) {
    if (ch < 0 || ch > 15) {
      throw "Parameter ch should be within 0-15";
    }
    if (iref < 0 || iref > 255) {
      throw "Parameter iref should be within 0-255";
    }
    const registerAddress = ch + 0x18;
    this._writeRegisterSingle (registerAddress, iref);
  }
  
  /**
   * On all channels
   */
  onAll () {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = true;
    }
    this._applyLEDSelection();
  }
  
  /**
   * Off all channels
   */
  offAll () {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = false;
    }
    this._applyLEDSelection();
  }
  
  /**
   * Set PWM duty
   * @param {!number} val 
   */
  setDuty (val) {
    if (this.useBlankPWM) {
      this.blank.write(val);
    }
  }
  
  off () {
    this.offAll();
  }

  _writeRegisterSingle (regAddr, value) {
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([regAddr, value]));
  }
  _writeRegisterSeq (startAddr, values) {
    const firstVal = startAddr | (0b01 << 7);
    let regValues = [firstVal].concat(values); // Auto-increment + First reg address
    this.i2c.i2cWriteSync(this.address, regValues.length, Buffer.from(regValues));
  }
  _writeRegisterSeqSameValues (startAddr, value, count) {
    const firstVal = startAddr | (0b01 << 7);
    let regValues = [firstVal];
    for (let i=0; i<count; i++) {
      regValues.push(value);
    }
    this.i2c.i2cWriteSync(this.address, regValues.length, Buffer.from(regValues));
  }
  _applyLEDSelection () {
    let regValues = [];
    for (let groupIndex = 0; groupIndex < LED_COUNT/4; groupIndex++) {
      let regVal = 0b00000000;
      for (let i=0; i<4; i++) {
        let modeVal = (this.leds[groupIndex * 4 + i]) ? 0b01 : 0b00;
        regVal = regVal | (modeVal << (i*2));
      }
      regValues.push(regVal);
    }
    this._writeRegisterSeq(REG_ADDR_LEDOUT0, regValues);
  }
}
module.exports = PCA9955B;

