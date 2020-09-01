"use strict";

/* Simple blinkey for GPIO test */
const rpio = require('rpio');

const startBlink = (pin /* J8 pin number (not GPIO ID) */, interval /* msec */) => {
  let on = false;
  rpio.open(pin, rpio.OUTPUT, rpio.LOW);
  setInterval(()=>{
    on = !on;
    const val = (on) ? rpio.HIGH : rpio.LOW;
    rpio.write(pin, val);
  }, interval);  
}
const DEFAULT_PIN = 37;
console.log(process.argv);
console.log(process.argv[2]);
const pinArgv = parseInt(process.argv[2]);
const pin = (pinArgv >= 0) ? pinArgv : DEFAULT_PIN;
startBlink(pin, 1000);
