"use strict";

/* 
  Usage
  sudo node test_clock.js 64000 25 # 64kHz, GPIO25
*/
const raspi = require('raspi');
// const pwm = require('raspi-pwm');
const pwm = require('raspi-soft-pwm');

// Requires sudo

const freq = parseInt(process.argv[2]);
const pin = parseInt(process.argv[3]);
console.log("freq=%f(kHz) pin=%d", freq/1000, pin);

raspi.init(() => {
  // const led0 = new pwm.PWM(23); // Use GPIO{n} number
  // const led1 = new pwm.PWM(1); // Use GPIO{n} number
  if (! (freq > 0)) {
    console.log("Invalid freq");
    return
  }
  const led0 = new pwm.SoftPWM({pin:pin, frequency:freq});
  console.log("Actual freq", led0.frequency)
  led0.write(0.5);
  let num = 0;
  setInterval(()=>{
    const duty = num * 0.2;
    led0.write(duty);
    num = (num + 1) % 5;
  }, 500);
});
