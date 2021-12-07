"use strict";


let pigpio = null;
let pigpioInit = null;
let GPIO = {
  init: (option)=>{
    pigpio = require('pigpio-client').pigpio(option);
    pigpioInit = (()=>{
      let isReady = false;
      let handlers = [];
      let obj = {
        onReady: function (handler) {
          if (isReady) {
            handler();
          } else {
            handlers.push(handler);
          }
        }
      };
      pigpio.once('connected', (info)=>{
        console.log(info)
        isReady = true;
        handlers.forEach((handler)=>{handler()});
      });
      pigpio.once('error', (error)=>{console.log(error)});
      return obj;
    })();
  }
};

class SoftPWM {
  constructor (pinNumBCM) {
    pigpioInit.onReady(()=>{
      console.log("SoftPWM init on %d", pinNumBCM);
      this.pin = pigpio.gpio(pinNumBCM);
      // this.pin.modeSet('output');
    });
  }
  write (duty/* 0-1.0 */) {
    if (this.pin) {
      this.pin.analogWrite(Math.floor(duty*255.0));
    }
  }
}

class HardPWM {
  constructor (pinNumBCM, freq) {
    pigpioInit.onReady(()=>{
      this.freq = freq;
      console.log("HardPWM init on %d", pinNumBCM);
      this.pin = pigpio.gpio(pinNumBCM);
      this.pin.modeSet('output');
    });
  }
  write (duty/* 0-1.0 */) {
    if (this.pin) {
      this.pin.hardwarePWM(this.freq, Math.floor(1E6*duty));
    }
  }

}

GPIO.HardPWM = HardPWM;
GPIO.SoftPWM = SoftPWM;

module.exports = GPIO;
/*
usage
GPIO.init({port:8888})
*/