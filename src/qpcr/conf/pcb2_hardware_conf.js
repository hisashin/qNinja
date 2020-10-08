"use strict";
const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");
const demoWell = require("../control/well_multi_demo.js");
const i2c = require('i2c-bus');


// ADC and wrapper
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");


const raspi = require('raspi'); // For SoftPWM
const pwm = require('raspi-soft-pwm');
const rpio = require('rpio');
// Potentiometer
const MCP4551T = require("../hardware/pot_mcp4551t.js");
// LED Driver
const TLC59281DBQR = require("../hardware/led_driver_tlc59281dbqr.js");

// Pins
const SPI_CHANNEL = "/dev/spidev0.0";
const I2C_CHANNEL = 1; // SDA1 & SCL1

const ADC_DATA_RATE = 90;
const ADC_DEVICE_ADDR = 0x40;
const POT_DEVICE_ADDR = 0x2F;
/*
  Dummy hardware conf
  (Without any hardware control.
  This config is for development.)
  */
class HardwareConf {
  constructor () {
    this.ledUnit = null;
    this.spi = SPI.initialize(SPI_CHANNEL);
    this.i2c = i2c.openSync(I2C_CHANNEL);
    const adc = new ADS1219IPWR(this.i2c, ADC_DEVICE_ADDR);
    this.adcManager = new ADCManager(adc, ADC_DATA_RATE);
  }
  start () {
  }
  /*
    Return number of wells
    */
  wellsCount () {
    return 16;
  }
  /*
    Return HeatUnit object as implementation of the well.
    */
  getWell () {
    // Dummy well with heat simulation
    return demoWell;
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
      console.log("getLEDUnit() create...");
      const pot = new MCP4551T(this.i2c, POT_DEVICE_ADDR);
      const ledDriver = new TLC59281DBQR(this.spi, PIN_NUM_LED_DRIVER_LATCH, PIN_NAME_PD_REF_PWM, 1000 /* Hz (=1kHz) */);
      this.ledUnit = new LEDUnit(pot, ledDriver);
    }
    return this.ledUnit;
  }
  /*
    Return fluorescence measurement unit (Including MUX)
    */
  getFluorescenceSensingUnit() {
    const pdMux = new ADG731BSUZ(this.spi, PIN_NUM_PD_SYNC);
    return new FluorescenceSensingUnit(pdMux, this.adcManager);
  }
};
const MAX_ABSOLUTE_FLUORESCENCE = 0.7;
const DUMMY_BASELINE_RATIO = 0.05;

/* 
  PIN_NUM_* means pin number.
  PIN_NAME_* means pin's GPIO name
*/

const PIN_NAME_PWM_WELL_HEATER1 = 23;
const PIN_NAME_PWM_WELL_HEATER2 = 0;
const PIN_NAME_PWM_LID_HEATER1 = 2;
const PIN_NAME_PWM_LID_HEATER2 = 24;

const PIN_NAME_PWM_FAN1 = 21;
const PIN_NAME_PWM_FAN2 = 22;

const PIN_NUM_ADC_DRDY = 24;

const PIN_NAME_PD_REF_PWM = 26; // GPIO26
const PIN_NUM_SPI_SWITCH = 18; //GPIO15
const PIN_NUM_LED_DRIVER_LATCH = 15;

const PIN_NUM_PD_SYNC = 22 //GPIO6

// LED unit with given potentiometer & led driver (Not dependent on specific hardware implementation)
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
  selectChannel (channel) {
    rpio.write(PIN_NUM_SPI_SWITCH, rpio.LOW);
    this.pot.setWiper(0);
    this.flg = !this.flg;
    this.ledDriver.selectChannel(channel);
    // Nothing to do
  }
  off () {
    // Nothing to do
  }
  shutdown () {
    console.log("Shutting down LED unit.");
  }
}

// Photodiode
class FluorescenceSensingUnit {
  constructor (mux, adcManager) {
    this.mux = mux;
    this.adcManager = adcManager;
  }
  start () {
    // Do nothing. Assume that adc and mux are already up.
  }
  select (well) {
    // TODO: use channel mapping
    this.mux.selectChannel(well.index);
  }
  measure(well, callback) {
    adcManager.readChannelValue(well.index, (val)=>{
      callback(val);
    });
  }
  shutdown () {
    console.log("Shutting down photosensing unit.");
  }
}

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

module.exports = new HardwareConf();