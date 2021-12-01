"use strict";
const raspi = require('raspi');
const pwm = require('raspi-soft-pwm');
 
raspi.init(() => {
  const leds = [
    /*
    new pwm.SoftPWM(21),
    new pwm.SoftPWM(22),
    new pwm.SoftPWM(23),
    new pwm.SoftPWM(24),
    */
    new pwm.SoftPWM(37)
  ];
  for (let i=0; i<leds.length; i++) {
    const led = leds[i];
    led.write(0.5);
  }
  let num = 0;
  setInterval(()=>{
    for (let i=0; i<leds.length; i++) {
      const led = leds[i];
      const duty = ((num + i) % 5) * 0.2;
      led.write(duty);
    }
    num = (num + 1) % 5;
  }, 200);
});