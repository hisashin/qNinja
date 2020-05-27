const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');

const spi0 = SPI.initialize("/dev/spidev0.0");
const spi1 = SPI.initialize("/dev/spidev1.0");

/*
*/
/*

const buffVal = 0x0001 << ch;
const lower = 0xFF & buffVal;
const upper = 0xFF & (buffVal >> 8);
this.spi.write(new Buffer([upper, lower]), ()=>{
  // Latch pulse
  rpio.write(this.pinLatch, rpio.HIGH);
  rpio.write(this.pinLatch, rpio.LOW);
});
*/
レーニンの