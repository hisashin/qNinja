// Generic 16ch MUX, controlled by 4 pins

// https://www.analog.com/media/en/technical-documentation/data-sheets/ADG706_707.pdf
// https://www.ti.com/lit/ds/symlink/cd74hc4067.pdf?ts=1609907160299
// https://www.ti.com/lit/ds/symlink/mpc506.pdf?ts=1609917448908&ref_url=https%253A%252F%252Fwww.ti.com%252Fstore%252Fti%252Fen%252Fp%252Fproduct%252F%253Fp%253DMPC506AU
// S0-S3 GPIO
"use strict";
const rpio = require('rpio');

class MUX16ch {
  constructor (s0, s1, s2, s3) {
    this.s0 = s0;
    this.s1 = s1;
    this.s2 = s2;
    this.s3 = s3;
    
  }
  initialize() {
    rpio.open(this.s0, rpio.OUTPUT, rpio.LOW);
    rpio.open(this.s1, rpio.OUTPUT, rpio.LOW);
    rpio.open(this.s2, rpio.OUTPUT, rpio.LOW);
    rpio.open(this.s3, rpio.OUTPUT, rpio.LOW);
  }
  selectChannel (ch) {
    const val0 = 0x01 & (ch >> 0);
    const val1 = 0x01 & (ch >> 1);
    const val2 = 0x01 & (ch >> 2);
    const val3 = 0x01 & (ch >> 3);
    rpio.write(this.s0, val0 ? rpio.HIGH : rpio.LOW);
    rpio.write(this.s1, val1 ? rpio.HIGH : rpio.LOW);
    rpio.write(this.s2, val2 ? rpio.HIGH : rpio.LOW);
    rpio.write(this.s3, val3 ? rpio.HIGH : rpio.LOW);
    /*
    console.log("%d %d->%d, %d->%d, %d->%d, %d->%d", 
      ch,
      this.s0, val0,
      this.s1, val1,
      this.s2, val2,
      this.s3, val3);
      */
  }
}
module.exports = MUX16ch;