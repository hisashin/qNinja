"use strict";
const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");
const demoPlate = require("../control/plate_multi_demo.js");
const BoxMuller = require("../util/box_muller.js");


const raspi = require('raspi'); // For SoftPWM
const pwm = require('raspi-soft-pwm');
const rpio = require('rpio');
// Potentiometer
const MCP4551T = require("../hardware/pot_mcp4551t.js");
// LED Driver
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");

// Basic configuration
const OPTICS_CHANNELS_COUNT = 2;
const WELLS_COUNT = 16;
// Pins
const SPI_CHANNEL = "/dev/spidev0.0";
const I2C_CHANNEL = 1; // SDA1 & SCL1

/*
  Dummy hardware conf
  (Without any hardware control.
  This config is for development.)
  */
class DummyHardwareConf {
  constructor () {
    this.ledUnit = null;
  }
  start () {
    
  }
  
  /* Hardware specifications */
  wellsCount () {
    return WELLS_COUNT;
  }
  opticsChannelsCount () {
    return OPTICS_CHANNELS_COUNT;
  }
  /*
    Return HeatUnit object as implementation of the well.
    */
  getPlate () {
    // Dummy well with heat simulation
    return demoPlate;
  }
  /*
    Return HeatUnit object as implementation of the heater lid.
    */
  getHeatLid () {
    return new HeatLid(); // Dummy
  }
  // TODO support ambient temp sensor
  /*
    Return LED control (Including MUX, POT and LED driver)
    */
  getLEDUnit () {
    console.log("getLEDUnit()");
    if (this.ledUnit == null) {
      console.log("getLEDUnit() create...")
      const pot = new MCP4551T(/* Bus number*/I2C_CHANNEL, /* Address*/0x2F);
      const ledDriver = new TLC59281DBQR(SPI_CHANNEL, PIN_NUM_LED_DRIVER_LATCH, PIN_NAME_PD_REF_PWM, 1000 /* Hz (=1kHz) */);
      this.ledUnit = new LEDUnit(pot, ledDriver);
    }
    return this.ledUnit;
  }
  /*
    Return fluorescence measurement unit (Including MUX)
    */
  getFluorescenceSensingUnit() {
    return new DummyFluorescenceSensingUnit();
  }
};
const MAX_ABSOLUTE_FLUORESCENCE = 0.7;
const DUMMY_BASELINE_RATIO = 0.05;

/* 
  PIN_NUM_* means pin number.
  PIN_NAME_* means pin's GPIO name
*/

const PIN_NAME_PWM_PLATE_HEATER1 = 23;
const PIN_NAME_PWM_PLATE_HEATER2 = 0;
const PIN_NAME_PWM_LID_HEATER1 = 2;
const PIN_NAME_PWM_LID_HEATER2 = 24;

const PIN_NAME_PWM_FAN1 = 21;
const PIN_NAME_PWM_FAN2 = 22;

const PIN_NUM_ADC_DRDY = 24;

const PIN_NAME_PD_REF_PWM = 26; // GPIO26
const PIN_NUM_SPI_SWITCH = 18; //GPIO15
const PIN_NUM_LED_DRIVER_LATCH = 15;

const PIN_NUM_PD_SYNC = 22 //GPIO6

/*
  TODO shingo
  THERM_AIR
  THERM_LID1
  THERM_LID2
  PD_MUX_GPIO1
  PD_MUX_GPIO2?
  PD_MUX_GPIO3?
  PD_MUX_GPIO4
  PD_MUX_GPIO5
*/

class LEDUnit {
  constructor (pot, ledDriver) {
    console.log("LEDUnit.init()")
    console.log(pot);
    console.log(ledDriver);
    this.pot = pot;
    this.ledDriver = ledDriver;
    this.flg = true;
  }
  start () {
    this.ledDriver.start();
    rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, rpio.LOW);
    this.ledUnit = new LEDUnit(this.pot, this.ledDriver);
    console.log("LEDUnit.start()");
    this.pot.initialize();
    
  }
  select (wellIndex) {
    rpio.write(PIN_NUM_SPI_SWITCH, rpio.LOW);
    
    this.pot.setWiper(0);
    this.flg = !this.flg;
    this.ledDriver.select(wellIndex);
    // Nothing to do
  }
  off () {
    // Nothing to do
  }
  shutdown () {
    console.log("Shutting down dummy LED unit.");
  }
}

const DUMMY_TEMP_TRANSITION_PER_SEC = 5.0;
const TEMP_CONTROL_INTERVAL_MSEC = 500;
// instance of HeatUnit (Replace it with real hardware implementation)
class HeatLid {
  constructor () {
    this.temperature = 25;
    this.targetTemperature = 25;
  }
  start () {
    // Initialize hardware. This function is called once at the first run.
  }
  setTargetTemperature (targetTemperature) {
    this.targetTemperature = targetTemperature;
  }
  control () {
    this.temperature = getDummyTemp(this.temperature, this.targetTemperature, TEMP_CONTROL_INTERVAL_MSEC);
  }
  off () {
    // Do nothing
  }
  shutdown () {
    console.log("Shutting down dummy heat lid.");
    this.off();
  }
}

const DUMMY_BASELINE_MULTIPLIER = 10;
const DUMMY_BASELINE_OFFSET = 30;
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
    return Math.max(0, BoxMuller() * DUMMY_BASELINE_MULTIPLIER);
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
    const lambda = AMP_LAMBDA_DEFAULT + AMP_LAMBDA_STEP * wellIndex;
    const background = this.getDummyBaseline();
    const amplification = AMP_F_START + AMP_F_MAX / (1 + Math.exp(AMP_BETA*(lambda-cycle)));
    return amplification + background;
  }
  measure(wellIndex, callback) {
    let value = 0;
    if (this.debugValue != null) {
      if (this.debugValue.type == 3) {
        // Melt curve
        // TODO simulate melt curve
        const high = this.debugValue.high;
        const temperature = this.debugValue.currentTemp;
        value = this._getDummyMeltCurve(this.dummyValues[wellIndex], this.debugValue.current, this.debugValue.high, this.debugValue.low);
      } else {
        value = this._getDummyAmplification(wellIndex, this.debugValue.cycles);
        while (this.dummyValues.length <= wellIndex) {
          this.dummyValues.push(0);
        }
        this.dummyValues[wellIndex] = value;
        
      }
    } else {
      console.warn("debugValue is null.");
    }
    setTimeout(()=>{ callback(value); }, 10);
  }
}
module.exports = new DummyHardwareConf();