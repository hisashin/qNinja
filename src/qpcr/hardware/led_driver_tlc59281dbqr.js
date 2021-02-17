// TLC59281DBQR
// RPi SPI: https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md
// $ sudo raspi-config
// and enable SPI, then reboot
// Datasheet: https://www.ti.com/store/ti/en/p/product/?p=TLC59281DBQR
// npm pi-spi https://www.npmjs.com/package/pi-spi
"use strict";
const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');

/*
  SPI channel example: "/dev/spidev0.0"
*/ 
class TLC59281DBQR {
  constructor (spi /* Channel name (string) or pi-spi object */, pinLatch, pinBlank, blankFrequency) {
    this.pinLatch = pinLatch;
    this.pinBlank = pinBlank;
    this.useBlankPWM = pinBlank > 0;
    if (!this.useBlankPWM) {
      console.log("Blank PWM is disabled.");
    }
    
    console.log("TLC59281DBQR.constructor");
    this.spi = null;
    if (typeof(spi)=='string') {
      this.spiCh = spi;
    } else if (spi != null) {
      this.spi = spi;
    } else {
      console.error("ADG731BSUZ.consrturcot spi is not specified. Please pass a SPI obect or channel name.");
    }
    this.blankFrequency = blankFrequency;
    rpio.open(this.pinLatch, rpio.OUTPUT, rpio.LOW);
  }
  start () {
    console.log("TLC59281DBQR.start");
    if (this.spi == null) {
      this.spi = SPI.initialize(this.spiCh);
    }
    if (this.useBlankPWM) {
      this.blank = new pwm.PWM({pin:this.pinBlank, frequency:this.blankFrequency}); // Use GPIO{n} number
    }
  }
  selectChannel (ch) {
    const buffVal = 0x0001 << ch;
    const lower = 0xFF & buffVal;
    const upper = 0xFF & (buffVal >> 8);
    this.spi.write(new Buffer([upper, lower]), ()=>{
      // Latch pulse
      rpio.write(this.pinLatch, rpio.HIGH);
      rpio.write(this.pinLatch, rpio.LOW);
    });
  }
  onAll () {
    this.spi.write(new Buffer([0xFF, 0xFF]), ()=>{
      // Latch pulse
      rpio.write(this.pinLatch, rpio.HIGH);
      rpio.write(this.pinLatch, rpio.LOW);
    });
  }
  offAll () {
    this.spi.write(new Buffer([0x00, 0x00]), ()=>{
      // Latch pulse
      rpio.write(this.pinLatch, rpio.HIGH);
      rpio.write(this.pinLatch, rpio.LOW);
    });
  }
  setDuty (val) {
    if (this.useBlankPWM) {
      this.blank.write(val);
    }
  }
  off () {
    this.spi.write(new Buffer([0x00, 0x00]), ()=>{
      // Latch pulse
      rpio.write(this.pinLatch, rpio.HIGH);
      rpio.write(this.pinLatch, rpio.LOW);
    });
  }
}
module.exports = TLC59281DBQR;

