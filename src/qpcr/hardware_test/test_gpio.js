"use strict";

/* 
  Simple blinkey for GPIO test
  sudo node test_gpio.js {pin_number}
*/
const rpio = require('rpio');

const startBlink = (pin /* J8 pin number (not GPIO ID) */, interval /* msec */) => {
  let on = false;
  setInterval(()=>{
    on = !on;
    const val = (on) ? rpio.HIGH : rpio.LOW;
    rpio.write(pin, val);
  }, interval);  
}
const DEFAULT_PIN = 29;
console.log("test_gpio", process.argv);
const pinArgv = parseInt(process.argv[2]);
const valueArgv = parseInt(process.argv[3]);
const pin = (pinArgv >= 0) ? pinArgv : DEFAULT_PIN;
console.log("test_gpio Pin=%d", pin);

rpio.open(pin, rpio.OUTPUT, rpio.LOW);
if (valueArgv) {
  console.log("test_gpio value=%d", valueArgv);
  
  rpio.write(pin, valueArgv);
} else {
  startBlink(pin, 3000);
}
