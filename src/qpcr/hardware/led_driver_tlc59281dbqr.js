// TLC59281DBQR
// RPi SPI: https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md
// Datasheet: https://www.ti.com/store/ti/en/p/product/?p=TLC59281DBQR
// npm pi-spi https://www.npmjs.com/package/pi-spi
const SPI = require('pi-spi');
const rpio = require('rpio');

class TLC59281DBQR {
  // SPI
  // TODO: Grayscale
  // TODO: Dot Correction
  // TODO: Channel On/Off
  constructor (spiCh, pinLat, pinBlank) {
    this.pinLat = pinLat;
    this.device = "/dev/spidev0.0";
    this.spi = null;
  }
  initialize () {
    this.spi = SPI.initialize(device);
  }
  selectChannel (ch) {
    buff = 0x0001;
    this.spi.write(buff, );
    //spi.write(outbuffer, cb);
    // latch
  }
}
module.exports = TLC59281DBQR;