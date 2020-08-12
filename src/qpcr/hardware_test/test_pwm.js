"use strict";
const raspi = require('raspi');
const pwm = require('raspi-pwm');

// Requires sudo
 
raspi.init(() => {
  // const led0 = new pwm.PWM(23); // Use GPIO{n} number
  // const led1 = new pwm.PWM(1); // Use GPIO{n} number
  const led0 = new pwm.PWM({pin:23, frequency:1000});
  const led1 = new pwm.PWM({pin:1, frequency:1000});
  
  console.log(led0.frequency)
  let val = 0.5;
  setInterval(()=>{
    led0.write(val);
    led1.write(1.0-val);
    val += 0.1;
    if (val > 1.0) {
      val = 0;
    }
  }, 200);
});
