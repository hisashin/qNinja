// 32ch MUX ADG731BSUZ (SPI control)
"use strict";

const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');


class ADG731BSUZ {
  constructor (spi /* Channel name (string) or pi-spi object */ , sync) {
    this.spi = null;
    if (typeof(spi)=='string') {
      this.spiCh = spi;
    } else if (spi != null) {
      this.spi = spi;
    } else {
      console.error("ADG731BSUZ.consrturcot spi is not specified. Please pass a SPI obect or channel name.");
    }
    this.sync = sync;
    rpio.open(this.sync, rpio.OUTPUT, rpio.LOW);
  }
  initialize () {
    if (this.spi == null) {
      this.spi = SPI.initialize(this.spiCh);
    }
  }
  send (val, callback) {
    const b = new Buffer([val]);
    rpio.write(this.sync, rpio.HIGH);
    rpio.write(this.sync, rpio.LOW);
    this.spi.write(b, ()=>{
      if (callback) {
        callback();
      }
    });
    
  }
  selectChannel (channel) {
    const val = 0b00011111 & channel;
    this.send(val, ()=>{
      // this.send(0b01000000);
      
    });
    
  }
}
module.exports = ADG731BSUZ;

