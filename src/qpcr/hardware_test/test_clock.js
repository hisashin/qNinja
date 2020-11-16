"use strict";

/* 
  Usage
  sudo node test_clock.js 64000 # 64kHz
*/
const raspi = require('raspi');
const pwm = require('raspi-pwm');

// Requires sudo

const freq = parseInt(process.argv[2]);
console.log("freq=%d", freq);

raspi.init(() => {
  // const led0 = new pwm.PWM(23); // Use GPIO{n} number
  // const led1 = new pwm.PWM(1); // Use GPIO{n} number
  if (! (freq > 0)) {
    console.log("Invalid freq");
    return;
  }
  const led0 = new pwm.PWM({pin:23, frequency:freq});
  let val = 0.5;
  led0.write(val);
});
