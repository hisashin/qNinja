// 32ch MUX ADG731BSUZ
const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');

class ADG731BSUZ {
  constructor (spiCh, sync) {
    this.spi = null;
    this.spiCh = spiCh;
    this.sync = sync;
    rpio.open(this.sync, rpio.OUTPUT, rpio.LOW);
  }
  initialize () {
    this.spi = SPI.initialize(this.spiCh);
  }
  selectChannel (channel) {
    const val = 0xFF & channel;
    rpio.write(this.sync, rpio.HIGH);
    this.spi.write(new Buffer([val]), ()=>{
      rpio.write(this.sync, rpio.LOW);
    });
    
  }
}
module.exports = ADG731BSUZ;

