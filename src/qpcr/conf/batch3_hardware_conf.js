"use strict";
/*
  TODO
  (After designing batch3 board)
  - Define MUX channels of thermistors
  (Hardware testing)
  
*/
// Basic configuration
const OPTICS_CHANNELS_COUNT = 2;
const WELLS_COUNT = 16;

const SPI = require('pi-spi');
const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");
const demoPlate = require("../control/plate_multi_demo.js"); // Use it if you are runnint qPCR cycle without real haat unit.
const Plate = require("../control/plate_multi.js");
const PlateBlock = require("../control/plate_block.js");
const i2c = require('i2c-bus');
const Thermistor = require("../hardware/thermistor.js");

// ADC and wrapper
const ADS1219IPWR = require("../hardware/adc_ads1219ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");
const MUX16ch = require("../hardware/mux_16ch.js");

const PIN_NUM_PD_MUX_1 = 22; //GPIO6
const PIN_NUM_PD_MUX_2 = 16; //GPIO4
const PIN_NUM_PD_MUX_3 = 12; //GPIO1
const PIN_NUM_PD_MUX_4 = 10; //GPIO16
const PIN_NUM_PD_MUX_5 = 8; //GPIO15
const PIN_MUX_SWITCH = PIN_NUM_PD_MUX_1;

const PIN_LATCH = 15;

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

// TODO change according to the circuit design
const ADC_CHANNEL_FLUORESCENCE_MEASUREMENT = 0;
// const ADC_CHANNEL_FLUORESCENCE_MEASUREMENT = 2;
const ADC_CHANNEL_AIR_THERMISTOR = 1; // TODO waiting for next main board design (with thermistor mux)
const ADC_CHANNEL_LID_THERMISTOR= 2; // TODO TODO waiting for next main board design (with thermistor mux)
const ADC_CHANNEL_PLATE_THERMISTOR = 3; // TODO TODO waiting for next main board design (with thermistor mux)

const RES = 47.0; // kOhm
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];

const PLATE_THERMISTOR_POS = true; /* Thermistor is connected to 3.3V line */
const LID_THERMISTOR_POS = true; /* Thermistor is connected to 3.3V line */
const AIR_THERMISTOR_POS = true; /* Thermistor is connected to 3.3V line */

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

const PIN_NUM_SPI_SWITCH = 18; //GPIO5
const VALUE_SPI_SWITCH_LED = rpio.LOW;
const VALUE_SPI_SWITCH_MUX = rpio.HIGH;

const PIN_NUM_LED_DRIVER_LATCH = 15;

const PIN_NUM_PD_SYNC = 22 //GPIO6

const PLATE_KP = 0.25;
const PLATE_KI = 0.1;
const PLATE_KD = 0.1;

const HEATER_KP = 1.0;
const HEATER_KI = 1.0;
const HEATER_KD = 1.0;


class HeatLidOutput {
  // Heater (with PWM)
  constructor (pwm) {
  // TODO active low / active high
    this.pwm = pwm;
  }
  start () {
    rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, rpio.LOW);
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

class HardwareConf {
  constructor () {
    this.ledUnit = null;
    this.spi = SPI.initialize(SPI_CHANNEL);
    this.i2c = i2c.openSync(I2C_CHANNEL);
    const adc = new ADS1219IPWR(this.i2c, ADC_DEVICE_ADDR);
    this.adcManager = new ADCManager(adc, ADC_DATA_RATE);
    
    this.pwmPlate1 = new pwm.SoftPWM(PIN_NAME_PWM_PLATE_HEATER1);
    this.pwmPlate2 = new pwm.SoftPWM(PIN_NAME_PWM_PLATE_HEATER2);
    
    this.pwmLid1 = new pwm.SoftPWM(PIN_NAME_PWM_LID_HEATER1);
    this.pwmLid2 = new pwm.SoftPWM(PIN_NAME_PWM_LID_HEATER2);
    
    this.pwmFan1 = new pwm.SoftPWM(PIN_NAME_PWM_FAN1);
    this.pwmFan2 = new pwm.SoftPWM(PIN_NAME_PWM_FAN2);
    
    const blocks = [];
    // PLATE_THERMISTOR_POS TODO: switch mux
    {
      const sensing = new PlateSensing(new Thermistor(B_CONST, R0, BASE_TEMP, PLATE_THERMISTOR_POS , RES), 
        this.adcManager, 
        ADC_CHANNEL_PLATE_THERMISTOR);
      const output = new PlateHeater(this.pwmPlate1);
      const block = new PlateBlock(this.createPID(), sensing, output);
      blocks.push(block);
    }
    {
      const sensing = new PlateSensing(new Thermistor(B_CONST, R0, BASE_TEMP, PLATE_THERMISTOR_POS , RES), 
        this.adcManager, 
        ADC_CHANNEL_PLATE_THERMISTOR);
      const output = new PlateHeater(this.pwmPlate2);
      const block = new PlateBlock(this.createPID(), sensing, output);
      blocks.push(block);
    }
    
    const fan = new Fan([this.pwmFan1, this.pwmFan2]);
    const airThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, AIR_THERMISTOR_POS , RES);
    const air = new AirSensing(airThermistor, this.adcManager, ADC_CHANNEL_AIR_THERMISTOR);
    this.plate = new Plate (blocks, fan, air);
  
    this.lids = [];
    {
      const lidThermistor = new Thermistor(B_CONST, R0, BASE_TEMP, PLATE_THERMISTOR_POS , RES)
      const lidSensing = new LidSensing(lidThermistor, this.adcManager, ADC_CHANNEL_LID_THERMISTOR);
      const pid = new PID(HEATER_KP, HEATER_KI, HEATER_KD);
      pid.setOutputRange(0, 1.0);
      const output = new HeatLidOutput(this.pwmLid1);
      this.lids.push(new HeatUnit(pid, lidSensing, output));
    }
  }
  shutdown () {
      // TODO
      // Shutdown all
  }
  createPID () {
    return new PID(PLATE_KP, PLATE_KI, PLATE_KD);
  }
  start () {
    this.adcManager.start();
  }
  
  /* Hardware specifications */
  wellsCount () {
    return WELLS_COUNT;
  }
  opticsChannelsCount () {
    return OPTICS_CHANNELS_COUNT;
  }
  
  /* Getters of hardware units */
  getPlate () {
    return this.plate;
  }
  getHeatLids () {
    return this.lids;
  }
  getLEDUnit () {
    console.log("getLEDUnit()");
    if (this.ledUnit == null) {
      console.log("getLEDUnit() create...");
      const pot = new MCP4551T(this.i2c, POT_DEVICE_ADDR);
      const ledDriver = new TLC59281DBQR(this.spi, PIN_LATCH, 0, 1000 /* Hz (=1kHz) */);
      this.ledUnit = new LEDUnit(pot, ledDriver);
    }
    return this.ledUnit;
  }
  getFluorescenceSensingUnit() {
    // ADG731BSUZ (SPI)
    
    // Generic 16ch MUX
    const muxWrapper = new GenericGPIOMuxWrapper();
    // const muxWrapper = new SPIMuxWrapper(this.spi, PIN_NUM_PD_SYNC);
    return new FluorescenceSensingUnit(muxWrapper, this.adcManager, ADC_CHANNEL_FLUORESCENCE_MEASUREMENT);
  }
};
// Channel name (Not index)
const MUX_MAP_N = [
  //0ch
  [8,6,4,2,16,14,12,10],
  [7,5,3,1,15,13,11,9]
];
const MUX_MAP_S = [
  [1,3,5,7,9,11,13,15],
  [2,4,6,8,10,12,14,16]
];

class SPIMuxWrapper {
  constructor (spi, pinSync) {
    this.mux = new ADG731BSUZ(spi, pinSync);
  }
  start () {
    this.mux.initialize();
  }
  select (wellIndex, channel) {
    let muxCh = 0;
    if (wellIndex < 8) {
        // North (switch=high)
        muxCh = MUX_MAP_N[channel][wellIndex] - 1;
    } else {
        // North (switch=low)
        muxCh = 16 + MUX_MAP_S[channel][wellIndex-8] - 1;
    }
    // console.log("W %d O %d M %d @%d", wellIndex, channel, muxCh, new Date().getTime()%10000);
    rpio.write(PIN_NUM_SPI_SWITCH, VALUE_SPI_SWITCH_MUX);
    this.mux.selectChannel(muxCh);
  }
}
/* 4bit GPIO MUX  + Switch */
class GenericGPIOMuxWrapper {
  constructor () {
    this.mux = new MUX16ch(PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3, PIN_NUM_PD_MUX_4, PIN_NUM_PD_MUX_5);
    this.muxSwitch = PIN_MUX_SWITCH;
  }
  start () {
    rpio.open(this.muxSwitch, rpio.OUTPUT, rpio.LOW);
    this.mux.initialize();
    
  }
  select (wellIndex, channel) {
    const channelOffset = channel;
    let muxSwitchVal = 0;
    let muxChName = 1;
    if (wellIndex < 8) {
        // North
        muxSwitchVal = 0;
        muxChName = MUX_MAP_N[channel][wellIndex];
    } else {
        // South
        muxSwitchVal = 1;
        muxChName = MUX_MAP_S[channel][wellIndex-8];
    }
    muxSwitchVal = 0;
    const muxChannel = muxChName - 1;
    // console.log("W %d O %d M %d S %d @%d", wellIndex, channel, muxChannel, muxSwitchVal, new Date().getTime()%10000);
    rpio.write(this.muxSwitch, muxSwitchVal);
    this.mux.selectChannel(muxChannel);
  }
}

let debug = 0;
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
    rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, VALUE_SPI_SWITCH_LED);
    this.ledUnit = new LEDUnit(this.pot, this.ledDriver);
    this.pot.initialize();
  }
  select (channel) {
    channel = debug;
    // channel = 0;
    rpio.write(PIN_NUM_SPI_SWITCH, VALUE_SPI_SWITCH_LED);
    this.pot.setWiper(0);
    this.flg = !this.flg;
    this.ledDriver.selectChannel(channel);
    // Nothing to do
  }
  off () {
    this.ledDriver.off();
    debug = (debug + 1) % 16;
    console.log("Debug value=%d", debug);
  }
  shutdown () {
    console.log("Shutting down LED unit.");
  }
}

// Photodiode
class FluorescenceSensingUnit {
  constructor (mux, adcManager, adcChannel) {
    this.mux = mux;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
  }
  start () {
    this.adcManager.start();
    this.mux.start();
  }
  select (wellIndex, opticalChannel) {
    this.mux.select(wellIndex, opticalChannel);
  }
  measure(callback) {
    /*
    this.adcManager.readChannelValue(this.adcChannel, (val)=>{
      callback(val);
    });
    */
    
    this.adcManager.readChannelValue(2, (val0)=>{
      this.adcManager.readChannelValue(3, (val3)=>{
        callback(val3-val0);
      });
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

class LidSensing {
  constructor (thermistor, adcManager, adcChannel) {
    this.thermistor = thermistor;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
  }
  measureTemperature() {
    this.adcManager.readChannelValue(this.adcChannel, (val)=>{
      const temp = this.thermistor.getTemp(val);
      callback(temp);
    });
  }
}

class AirSensing {
  constructor (thermistor, adcManager, adcChannel) {
    this.thermistor = thermistor;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
  }
  measureTemperature() {
    this.adcManager.readChannelValue(this.adcChannel, (val)=>{
      const temp = this.thermistor.getTemp(val);
      callback(temp);
    });
  }
}

class PlateSensing {
  // TODO mux?
  constructor (thermistor, adcManager, adcChannel) {
    this.thermistor = thermistor;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
  }

  measureTemperature() {
    this.adcManager.readChannelValue(this.adcChannel, (val)=>{
      const temp = this.thermistor.getTemp(val);
      callback(temp);
    });
  }
}

class Fan {
  constructor (pwms) {
    this.pwms = pwms;
  }
  setOutput (value) {
    value = Math.max(0.0, Math.min(1.0, value));
    for (let pwm of this.pwms) {
      pwm.write(value);
    }
  }
}

class PlateHeater  {
  constructor (pwm) {
    this.pwm = pwm;
  }
  setOutput (value) {
    value = Math.max(0.0, Math.min(1.0, value));
    this.pwm.write(value);
  }
}

module.exports = new HardwareConf();