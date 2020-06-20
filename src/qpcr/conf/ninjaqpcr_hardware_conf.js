"use strict";

const PID = require("../control/heat_control/pid.js");
const Thermistor = require("../hardware/thermistor.js");

const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
const Thermistor = require("../hardware/thermistor.js");

// For well PID
const raspi = require('raspi');
const pwm = require('raspi-pwm');
const softPwm = require('raspi-soft-pwm');

const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");


const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_LATCH = 15; // Pin number
const PIN_LED_PWM = 23; // GPIO{n} num
const PIN_WELL_PWM = 33;
const FREQ_WELL_PWM = 1000; // Hz


const PIN_PWM_LID = 13;
const PIN_LED_PWM = 32;
const FREQ_LED_PWM = 1000;
const PIN_PWM_FAN = 37; // TODO これ適当にきめただけ


// Example pin assignment 
// https://docs.google.com/spreadsheets/d/1iU2gII_kSwVGeW8FTEcDqT59ksJSpKEOyM9GNM40jL0/edit#gid=1350445105

const wellPWM = new pwm.PWM({pin:PIN_WELL_PWM, frequency:FREQ_WELL_PWM});
const lidPWM = new softPwm.SoftPWM(PIN_PWM_LID);
const fanPWM = new softPwm.SoftPWM(PIN_PWM_FAN);

/* Hardware constants */
const ADC_CHANNEL_WELL_THERMISTOR = 0;
const ADC_CHANNEL_LID_THERMISTOR = 1;

const adcManager = new ADCManager(new ADS1219IPWR(1, 0x40), 90);
let ch = 0;

const RES = 47.0; // kOhm
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

const wellThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, 
  true /* Thermistor is connected to 3.3V line */, RES);
const lidThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, 
  true /* Thermistor is connected to 3.3V line */, RES);


/* ADC, thermistor and customPID consts */
class TempSensingUnit  {
  constructor (adcChannel) {
    this.thermistor = wellThermistor;
    this.adcChannel = adcChannel;
  }
  start () {
    // start ADC (if inactive)
    adcManager.start();
  }
  getTemperature (callback) {
    adcManager.readChannelValue(2, (val)=>{
      const temp = this.thermistor.getTemp(val);
      callback(temp);
    });
  }
}
const wellSensing = new TempSensingUnit(ADC_CHANNEL_WELL_THERMISTOR);
const lidSensing = new TempSensingUnit(ADC_CHANNEL_LID_THERMISTOR);

// PWM

class WellOutput {
  // Combination of heater (PWM) and fan (PWM)
  constructor () {
    this.wellPWM = wellPWM;
    this.fanPWM = fanPWM;
    // TODO active low / active high
  }
  start () {
  }
  setOutput (outputValue /* Range={-1,1.0} */) {
    outputValue = Math.min(1.0, Math.max(0, outputValue));
    if (outputValue > 0) {
      this.wellPWM.write(outputValue);
      this.fanPWM.write(0);
    } else {
      this.wellPWM.write(0);
      this.fanPwm.write(-outputValue);
    }
  }
  off () {
    this.wellPWM.write(0);
    this.fanPWM.write(0);
  }
}

class HeatLidOutput {
  // Heater (with PWM)
  constructor () {
  // TODO active low / active high
    this.pwm = lidPWM;
  }
  start () {
    
  }
  setOutput (outputValue /* Range={0,1.0} */) {
    outputValue = Math.min(1.0, Math.max(0, outputValue));
    this.pwm.write(outputValue);
  }
  off () {
    this.pwm.write(0);
  }
}


const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_LATCH, PIN_BLANK, FREQ_WELL_PWM);

class LEDUnit {
  construtor (ledDriver) {
    this.ledDriver = ledDriver;
    
  }
  start () {
    this.ledDriver.start();
  }
  selectChannel (channel) {
    this.ledDriver.setDuty(0.5);
    this.ledDriver.selectChannel(channel);
  }
  off () {
    this.ledDriver.setDuty(0);
  }
}

class NinjaQPCRHardwareConf {
  // TODO
  wellsCount () {
    return 8;
  }
  getWell () {
    // TODO
    const WELL_KP = 1.0;
    const WELL_KI = 1.0;
    const WELL_KD = 1.0;
    const pid = new PID(LID_KP, LID_KI, LID_KD);
    pid.setOutputRange(-1, 1.0);
    const output = new WellOutput();
    return new HeatUnit(pid, wellSensing, output);
  }
  getHeatLid () {
    // TODO
    const HEATER_KP = 1.0;
    const HEATER_KI = 1.0;
    const HEATER_KD = 1.0;
    const pid = new PID(HEATER_KP, HEATER_KI, HEATER_KD);
    pid.setOutputRange(0, 1.0);
    const output = new HeatLidOutput();
    return new HeatUnit(pid, wellSensing, output);
  }
  getLEDUnit () {
    return new LEDUnit(ledDriver);
  }
  getFluorescenceSensingUnit () {
    // TODO
    return null;
  }
};

module.exports = new NinjaQPCRHardwareConf();