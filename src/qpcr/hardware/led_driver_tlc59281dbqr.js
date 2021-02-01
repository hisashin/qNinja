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
    if (this.spi == null) {
      this.spi = SPI.initialize(this.spiCh);
    }
    this.blank = new pwm.PWM({pin:this.pinBlank, frequency:this.blankFrequency}); // Use GPIO{n} number
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
  setDuty (val) {
    this.blank.write(val);
  }
}
module.exports = TLC59281DBQR;

