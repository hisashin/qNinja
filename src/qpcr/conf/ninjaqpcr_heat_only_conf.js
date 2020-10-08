"use strict";

const PID = require("../control/heat_control/pid.js");
const Thermistor = require("../hardware/thermistor.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");

const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
const adcManager = new ADCManager(new ADS1219IPWR(1, 0x40), 90);
// const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");

// For well PID
const raspi = require('raspi');
// const pwm = require('raspi-pwm');
const softPwm = require('raspi-soft-pwm');


const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_MUX_SYNC = 40; // Pin number

const PIN_LED_LATCH = 15; // Pin number
const PIN_LED_PWM = 26; // GPIO{n} num
const PIN_WELL_PWM = 23; // GPIO{n} num
const FREQ_WELL_PWM = 1000; // Hz

const PIN_PWM_LID = 2;//13;

const FREQ_LED_PWM = 1000;
const PIN_PWM_FAN = 25;//37;

// Example pin assignment 
// https://docs.google.com/spreadsheets/d/1iU2gII_kSwVGeW8FTEcDqT59ksJSpKEOyM9GNM40jL0/edit#gid=1350445105

const fanPWM = new softPwm.SoftPWM(PIN_PWM_FAN);
const wellPWM = new softPwm.SoftPWM(PIN_WELL_PWM);
const lidPWM = new softPwm.SoftPWM(PIN_PWM_LID);
// const mux = new ADG731BSUZ(SPI_CHANNEL, PIN_MUX_SYNC);
const mux = null;

/* Hardware constants */
const ADC_CHANNEL_WELL_THERMISTOR = 0;
const ADC_CHANNEL_LID_THERMISTOR = 1;
// const ADC_CHANNEL_AIR_THERMISTOR = 2;
const ADC_CHANNEL_FLUORESCENCE_MEASUREMENT = 3;

let ch = 0;

const RES = 47.0; // kOhm
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

const WELL_THERMISTOR_POS = true; /* Thermistor is connected to 3.3V line */
const LID_THERMISTOR_POS = true; /* Thermistor is connected to 3.3V line */
const wellThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, WELL_THERMISTOR_POS , RES);
/*
const lidThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, LID_THERMISTOR_POS, RES);
*/

/* ADC, thermistor and customPID consts */
// TODO: make it independent from concrete ADC.
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
    adcManager.readChannelValue(this.adcChannel, (val)=>{
      const temp = this.thermistor.getTemp(val);
      callback(temp);
    });
  }
  off () {}
  shutdown () {
    console.log("Shutting down TempSensingUnit.");
    this.off();
  }
}
const wellSensing = new TempSensingUnit(ADC_CHANNEL_WELL_THERMISTOR);
const lidSensing = new TempSensingUnit(ADC_CHANNEL_LID_THERMISTOR);

// PWM
class WellOutput {
  // Combination of heater (PWM) and fan (PWM)
  constructor () {
    this.fanPWM = fanPWM;
    this.wellPWM = wellPWM;
    console.log("this.fanPWM = " + this.fanPWM);
    console.log("this.wellPWM = " + this.wellPWM);
  }
  start () {
  }
  setOutput (outputValue /* Range={-1,1.0} */) {
    outputValue = Math.min(1.0, Math.max(-1, outputValue));
    if (outputValue > 0) {
      this.wellPWM.write(outputValue);
      this.fanPWM.write(0);
    } else {
      this.wellPWM.write(0);
      this.fanPWM.write(-outputValue);
    }
  }
  off () {
    this.wellPWM.write(0);
    this.fanPWM.write(0);
  }
  shutdown () {
    console.log("Shutting down HeatLidOutput.");
    this.off();
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
    //this.pwm.write(outputValue);
  }
  off () {
    //this.pwm.write(0);
  }
  shutdown () {
    console.log("Shutting down HeatLidOutput.");
    this.off();
  }
}


const MAX_ABSOLUTE_FLUORESCENCE = 0.7;
const DUMMY_BASELINE_RATIO = 0.05;
class LEDUnit {
  construtor () {
    // Nothing to do
  }
  start () {
    // Nothing to do
    
  }
  selectChannel (channel) {
    // Nothing to do
  }
  off () {
    // Nothing to do
  }
  shutdown () {
    console.log("Shutting down dummy LED unit.");
  }
}
class DummyFluorescenceSensingUnit {
  constructor () {
  }
  start () {
    this.startTimestamp = new Date();
    this.debugValue = null;
    this.dummyValues = [];
  }
  select (well) {
    // Do nothing
  }
  getDummySigmoid (channel) {
    const elapsedMsec = (new Date().getTime() - this.startTimestamp.getTime());
    const thresholdMsec = 150 * 1000;
    const intercept = 6.0;
    const x =  ((elapsedMsec - thresholdMsec - channel * 10 * 1000)/thresholdMsec) * intercept;
    const sigmoid = MAX_ABSOLUTE_FLUORESCENCE / (1 + Math.exp(-x));
    return sigmoid;
  }
  getDummyBaseline (value) {
    return 0.1 + Math.random() * DUMMY_BASELINE_RATIO *  (MAX_ABSOLUTE_FLUORESCENCE-value)/MAX_ABSOLUTE_FLUORESCENCE;
  }
  _getDummyMeltCurve (start, current, high, low) {
    const range = 12;
    const offset =1-1/(1+Math.exp(range/2));
    const normalized = 
        range*((current-low)/(high-low)-0.5);
    const sigmoid =1/(1+Math.exp(normalized));
    const value = start * sigmoid/offset;
    return value;
  }
  _getDummyAmplification (wellIndex, cycle) {
    const AMP_F_START = 1.0;
    const AMP_F_MAX = 20000; // Plateau height
    const AMP_BETA = 0.6;
    const AMP_LAMBDA_DEFAULT = 20;
    const AMP_LAMBDA_STEP = 1.1;
    const AMP_BACKGROUND_COEFF = 40;
    const lambda = AMP_LAMBDA_DEFAULT + AMP_LAMBDA_STEP * wellIndex;
    const background = Math.random() * AMP_BACKGROUND_COEFF;
    const amplification = AMP_F_START + AMP_F_MAX / (1 + Math.exp(AMP_BETA*(lambda-cycle)));
    return amplification + background;
  }
  measure(well, callback) {
    let value = 0;
    if (this.debugValue != null) {
      if (this.debugValue.type == 3) {
        // Melt curve
        // TODO simulate melt curve
        const high = this.debugValue.high;
        const temperature = this.debugValue.currentTemp;
        value = this._getDummyMeltCurve(this.dummyValues[well.index], this.debugValue.current, this.debugValue.high, this.debugValue.low);
      } else {
        /*
        value = this.getDummySigmoid(well.index);
        value += this.getDummyBaseline(value);
        */
        value = this._getDummyAmplification(well.index, this.debugValue.repeat);
        while (this.dummyValues.length <= well.index) {
          this.dummyValues.push(0);
        }
        this.dummyValues[well.index] = value;
        
      }
    } else {
      console.warn("debugValue is null.");
    }
    setTimeout(()=>{ callback(value); }, 10);
  }
}
class NinjaQPCRHardwareConf {
  start () {
    
  }
  // TODO
  wellsCount () {
    return 8;
  }
  start () {}
  getWell () {
    // TODO tuning
    const WELL_KP = 0.3;
    const WELL_KI = 0.1;
    const WELL_KD = 0.1;
    const pid = new PID(WELL_KP, WELL_KI, WELL_KD);
    pid.setOutputRange(-1, 1.0);
    const output = new WellOutput();
    return new HeatUnit(pid, wellSensing, output);
  }
  getHeatLid () {
    // TODO tunig
    const HEATER_KP = 1.0;
    const HEATER_KI = 1.0;
    const HEATER_KD = 1.0;
    const pid = new PID(HEATER_KP, HEATER_KI, HEATER_KD);
    pid.setOutputRange(0, 1.0);
    const output = new HeatLidOutput();
    return new HeatUnit(pid, lidSensing, output);
  }
  getLEDUnit () {
    return new LEDUnit();
  }
  getFluorescenceSensingUnit () {
    return new DummyFluorescenceSensingUnit();
  }
};

module.exports = new NinjaQPCRHardwareConf();