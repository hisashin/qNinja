"use strict";
const PIGPIO_PORT = 8888;
const PIGPIO = require('../lib/pigpio_client_wrapper.js');
PIGPIO.init({port:PIGPIO_PORT});
const Peltier = require("../hardware/peltier.js");
const Relay = require("../hardware/relay.js");
const FREQ_PELTIER = 1E5;
const PIN_PELTIER_RELAY_A = 36; // Pin 36, GPIO27
const PIN_PELTIER_RELAY_B = 38; // Pin 38, GPIO28
const PIN_BCM_NUM_PWM_PELTIER = 12; // Pin 32, GPIO26, BCM 12 (Hardware PWM available)

const relay = new Relay(PIN_PELTIER_RELAY_A, PIN_PELTIER_RELAY_B);

const pwmPeltier = new PIGPIO.HardPWM(PIN_BCM_NUM_PWM_PELTIER, FREQ_PELTIER);
const peltierAbsControl = {
  start: ()=>{
  },
  setOutput: (vOut)=>{
    pwmPeltier.write(vOut);
  },
  off: ()=>{
    pwmPeltier.write(0);
  }
}
const peltier = new Peltier(peltierAbsControl, relay);

let output = 0;
let started = false;

setInterval(()=>{
   if (started) {
    peltier.setOutput(output)
    output+= 0.2;
    if (output > 1) {
        output -= 2;
    }

   } else {
    peltier.start();
    started = true;
   }
}, 2000);
process.on('SIGINT', ()=>{
  console.log("Off");
  peltier.shutdown();
  setTimeout(()=>{
    console.log("Exit.");
    process.exit(0);
  }, 2000);
});