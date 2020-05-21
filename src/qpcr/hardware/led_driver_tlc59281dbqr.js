// TLC59281DBQR
// RPi SPI: https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md
// $ sudo raspi-config
// and enable SPI, then reboot
// Datasheet: https://www.ti.com/store/ti/en/p/product/?p=TLC59281DBQR
// npm pi-spi https://www.npmjs.com/package/pi-spi
const SPI = require('pi-spi');
const rpio = require('rpio');

class TLC59281DBQR {
  constructor (spiCh, pinLatch, pinBlank) {
    this.pinLatch = pinLatch;
    this.pinBlank = pinBlank;
    this.device = spiCh;
    this.spi = null;
    rpio.open(this.pinLatch, rpio.OUTPUT, rpio.LOW);
  }
  initialize () {
    this.spi = SPI.initialize(this.device);
    // TODO: Start PWM on BLANK pin
  }
  selectChannel (ch) {
    const buffVal = 0x01 << ch;
    this.spi.write(new Buffer([buffVal]), ()=>{
      // Latch pulse
      rpio.write(this.pinLatch, rpio.HIGH);
      rpio.write(this.pinLatch, rpio.LOW);
    });
  }
}
module.exports = TLC59281DBQR;