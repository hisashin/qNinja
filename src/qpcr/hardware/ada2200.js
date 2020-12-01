"use strict";

const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');

const CLKIN_DIV_1   = 0b00000000;
const CLKIN_DIV_16  = 0b00000100;
const CLKIN_DIV_64  = 0b00001000;
const CLKIN_DIV_256 = 0b00010000;

const RCLK_DIV_4 = 0b00000001;
const RCLK_DIV_8 = 0b00000010;

const REG_CLOCK_CONFIGURATION = 0x002B;

class ADA2200 {
  constructor (spi /* Channel name (string) or pi-spi object */, pinCs /* Chip select */) {
    this.pinCs = pinCs;
  
    this.spi = null;
    if (typeof(spi)=='string') {
      this.spiCh = spi;
    } else if (spi != null) {
      this.spi = spi;
    } else {
      console.error("ADA2200.consrturcot spi is not specified. Please pass a SPI obect or channel name.");
    }
  }
  start () {
    if (this.spi == null) {
      this.spi = SPI.initialize(this.spiCh);
    }
    // Initialize CS port
    rpio.open(this.pinCs, rpio.OUTPUT, rpio.HIGH);
  }
  a () {
    console.log("a");
    const addrByte = 0xFF & REG_CLOCK_CONFIGURATION;
    const valByte = 0xFF & (CLKIN_DIV_1 | RCLK_DIV_4);
    rpio.write(this.pinCs, rpio.LOW); // CS true
    this.spi.write(new Buffer([0x00, addrByte, valByte]), ()=>{
      rpio.write(this.pinCs, rpio.HIGH); // CS false
    });
    
  }
  b () {
    console.log("b");
    const addrByte = 0xFF & REG_CLOCK_CONFIGURATION;
    const valByte = 0xFF & (CLKIN_DIV_1 | RCLK_DIV_8);
    rpio.write(this.pinCs, rpio.LOW); // CS true
    this.spi.write(new Buffer([0x00, addrByte, valByte]), ()=>{
      rpio.write(this.pinCs, rpio.HIGH); // CS false
    });
    
  }
}