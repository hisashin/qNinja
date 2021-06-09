// PCA9955B (16ch I2C LED driver)
// Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9955B.pdf
"use strict";
const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');

const i2c = require('i2c-bus');
const DEFAULT_BUS_NUMBER = 1;
const REG_ADDR_LEDOUT0 = 0x02;
const REG_ADDR_LEDOUT1 = 0x03;
const REG_ADDR_LEDOUT2 = 0x04;
const REG_ADDR_LEDOUT3 = 0x05;

const LED_COUNT = 16;
/*
  SPI channel example: "/dev/spidev0.0"
*/ 
class PCA9955B {
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
  applyLED () {
    const firstBit = REG_ADDR_LEDOUT0 | (0b01 << 7);
    let regValues = [firstBit]; // Auto-increment + First reg address
    for (let groupIndex = 0; groupIndex < LED_COUNT/4; groupIndex++) {
      let regVal = 0b00000000;
      for (let i=0; i<4; i++) {
        let modeVal = (this.leds[groupIndex * 4 + i]) ? 0b10 : 0b00;
        regVal = regVal | (modeVal << (i*2));
      }
      regValues.push(regVal);
    }
    this.i2c.i2cWriteSync(this.address, regValues.length, new Buffer(regValues));
    
  }
  // Select single channel
  selectChannel (ch) {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = (ch == i);
    }
    this.applyLED();
  }
  
  onAll () {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = true;
    }
    this.applyLED();
  }
  
  offAll () {
    for (let i=0; i<LED_COUNT; i++) {
      this.leds[i] = false;
    }
    this.applyLED();
  }
  
  setDuty (val) {
    if (this.useBlankPWM) {
      this.blank.write(val);
    }
  }
  
  off () {
    this.offAll();
  }
}
module.exports = PCA9955B;

