"use strict";

/* Thermistors */
const rpio = require('rpio');
const MUX8ch = require("../hardware/mux_8ch.js");
const R_SWITCH_PIN = 26;
rpio.open(R_SWITCH_PIN, rpio.OUTPUT, rpio.LOW);
let switchHigh = false;

const PIN_NUM_FAN = 29;
const PIN_NUM_HEATER = 33;
const PIN_NUM_PD_MUX_1 = 16; //GPIO4 (Mux channel)
const PIN_NUM_PD_MUX_2 = 12; //GPIO1 (Mux channel)
const PIN_NUM_PD_MUX_3 = 8; //GPIO15 (Mux channel)

let mux = new MUX8ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3);
mux.initialize();
let muxCh = 0;

const ADS122C04IPWR = require("../hardware/adc_ads122c04ipwr.js");
const Thermistor = require("../hardware/thermistor.js");
const I2C_CHANNEL = 1; // SDA1 & SCL1
const ADC_DEVICE_ADDR = 0x40;

const adc = new ADS122C04IPWR(I2C_CHANNEL, ADC_DEVICE_ADDR);
adc.initialize();
adc.selectDataRate(20);
adc.selectVoltageReferenceExternal();

const RES = 47.0; // kOhm (47 or 10)
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

let fixedPeltierValue = parseFloat(process.argv[2]); // Negative->, Positive->Cool
let heaterValue = parseInt(process.argv[3]);
let fanValue = parseFloat(process.argv[4]);
rpio.open(PIN_NUM_FAN, rpio.OUTPUT, fanValue);
rpio.open(PIN_NUM_HEATER, rpio.OUTPUT, heaterValue);

const thermistor = new Thermistor(B_CONST, R0, BASE_TEMP, 
  false /* Thermistor is connected to 3.3V line */, RES);
const measureTemp = ()=>{
  adc.selectChannel(1);
  mux.selectChannel(muxCh);
  setTimeout(()=>{
    adc.readConversionData((val)=>{
      const temp = thermistor.getTemp(val);
      console.log(temp);

    rpio.write(R_SWITCH_PIN, rpio.LOW);
    });
  }, 125);
}

/* Peltier */
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

console.log("fixedPeltierValue %f", fixedPeltierValue)

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
  // peltier.setOutput(0)
  if (started) {
  peltier.setOutput(fixedPeltierValue)
  output+= 0.2;
  if (output > 1.0) {
      output = -0.2;
  }

  } else {
  peltier.start();
  started = true;
  }
  measureTemp();
}, 2000);
process.on('SIGINT', ()=>{
  console.log("Off");
  peltier.shutdown();
  rpio.write(PIN_NUM_FAN, rpio.LOW);
  rpio.write(PIN_NUM_HEATER, rpio.LOW);
  qpcr.exit();
});