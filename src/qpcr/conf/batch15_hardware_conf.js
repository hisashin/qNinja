"use strict";

// Basic configuration
const OPTICS_CHANNELS_COUNT = 2;
const WELLS_COUNT = 16;

const i2c = require('i2c-bus');
const rpio = require('rpio');
const PID = require("../control/heat_control/pid.js");
const HeatUnit = require("../control/heat_control/heat_unit.js");
const ExclusiveTaskQueue = require("../lib/exclusive_task_queue.js");
// const demoPlate = require("../control/plate_multi_demo.js"); // Use it if you are runnint qPCR cycle without real haat unit.
const Plate = require("../control/plate_multi.js");
// const HeatLidMulti = require("../control/heat_lid_multi.js");
// const PlateBlock = require("../control/plate_block.js");
const Thermistor = require("../hardware/thermistor.js");

// Hardware lilbraries
const ADS122C04IPWR = require("../hardware/adc_ads122c04ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
// const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");
const MUX16ch = require("../hardware/mux_16ch.js");
const MUX8ch = require("../hardware/mux_8ch.js");
const MCP4551T = require("../hardware/pot_mcp4551t.js");
const PCA9955B = require("../hardware/led_driver_pca9955b.js");
// const PromiseQueue = require("../lib/promise_queue.js");

const PIGPIO_PORT = 8888;
const PIGPIO = require('../lib/pigpio_client_wrapper.js');
PIGPIO.init({port:PIGPIO_PORT});
const Peltier = require("../hardware/peltier.js");
const Relay = require("../hardware/relay.js");


// Pins
const I2C_CHANNEL = 1; // SDA1 & SCL1

const I2C_ADDR_PCA9955B = 0x05;
const I2C_ADDR_ADC = 0x40;
const I2C_ADDR_POT = 0x2F;

const ADC_CHANNEL_FLUORESCENCE_MEASUREMENT = [3, 2]; // AIN3->P, AIN2->N
const ADC_CHANNEL_THERMISTORS = [1, 0]; // AIN0->P, AIN1->N

/* Thermistor config */
// http://localhost:8888/notebooks/PCR/Ninja_qPCR_thermistor_selection.ipynb
const RES_LOW_TEMP = 47.0; // kOhm
const RES_HIGH_TEMP = 10.0; // kOhm
const SWITCHING_TEMP = 66.0;
// const SWITCHING_TEMP = 40.0;
const R0 = 100.0;
const BASE_TEMP = 25.0;
const B_CONST_NX = [
  // { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  // { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];
const B_CONST_AKI = [
  { minTemp:0.0, bConst:4334, voltageLimit:0.0 },
];
const B_CONST_ALI = [
  { minTemp:0.0, bConst:3950, voltageLimit:0.0 },

];
const THERMISTOR_POSITION = false; /* Thermistor is connected to 0V line */

/* 
  PIN_NUM_* means pin number.
  PIN_NAME_* means pin's GPIO name
*/
const PIN_NUM_VIN_SENSE = 11; //GPIO0

const PIN_NUM_MUX_SELECT = 22; // Pin22, GPIO6
const PIN_NUM_PD_MUX_S0 = 16; // Pin 16, GPIO4 (Mux channel)
const PIN_NUM_PD_MUX_S1 = 12; // Pin 12, GPIO1 (Mux channel)
const PIN_NUM_PD_MUX_S2 = 8; // Pin 8, GPIO15 (Mux channel)
const PIN_NUM_PD_MUX_S3 = 10; // Pin 10, GPIO16 (Mux channel)
const PIN_NUM_AMP_GAIN_SWITCH = 7;// Pin 7, GPIO7
const PIN_NUM_THERMISTOR_R = 26;// Pin 26, GPIO 11
const PIN_BCM_NUM_PWM_PLATE_HEATER = 13; // Pin 33, GPIO23, BCM 13 (Hardware PWM available)
const PIN_BCM_NUM_PWM_LID_HEATER = 27; // Pin 13, GPIO2, BCM 27
const PIN_BCM_NUM_PWM_FAN = 5; // Pin 29, GPIO 21, BCM 5
const PIN_BCM_NUM_PWM_PELTIER = 12; // Pin 32, GPIO26, BCM 12 (Hardware PWM available)

const PIN_PELTIER_RELAY_A = 36; // Pin 36, GPIO27
const PIN_PELTIER_RELAY_B = 38; // Pin 38, GPIO28

const PIN_NUM_DOOR_OPEN = 35; // Pin 35, GPIO24
// const PIN_NUM_DOOR_LOCK = 36; // Pin 37, GPIO25
const PIN_NUM_ADC_DRDY = 24; // Pin 24, GPIO10
const PIN_SHUTDOWN = PIN_NUM_VIN_SENSE; // TODO tmp

// PID config
const PLATE_PID =  [
  { kp:0.60, ki:0.035, kd:0.005 },
  { kp:0.60, ki:0.035, kd:0.005, minValue: 50 },
  { kp:0.35, ki:0.035, kd:0.005, minValue:80 }
];

const LID_PID =  [
  { kp:0.25, ki:0.06, kd:0.005 },
  { kp:0.30, ki:0.035, kd:0.005, minValue:50 },
  { kp:0.35, ki:0.025, kd:0.001, minValue:90 }
];

const MUX_CHANNEL_THERMISTOR_PLATE_BLOCK = 0;
const MUX_CHANNEL_THERMISTOR_AIR = 1;
const MUX_CHANNEL_THERMISTOR_LID = 2;
const MUX_CHANNEL_THERMISTOR_EXT1 = 3;
const MUX_CHANNEL_THERMISTOR_EXT2 = 4;
const MUX_CHANNEL_THERMISTOR_EXT3 = 5;
const MUX_CHANNEL_THERMISTOR_PD1 = 6;
const MUX_CHANNEL_THERMISTOR_PD2 = 7;


// Well name -> Channel index

const MUX_MAP_PHOTODIODES_N = [
  [7,5,3,1,15,13,11,9], // Opt channel 1
    [6,4,2,0,14,12,10,8], // Opt channel 0
];
const MUX_MAP_PHOTODIODES_S = [
  [8,10,12,14,0,2,4,6], // Opt channel 0
  [9,11,13,15,1,3,5,7] // Opt channel 1
];

const TEMPERATURE_CHANNELS_CONF = {
  // label, property
};
/* 
  Measurement Interval and Data Rate
  Interval > 1000 / DataRate
*/
/*

DATA_RATE[20] = DATA_RATE_20SPS;
DATA_RATE[45] = DATA_RATE_45SPS;
DATA_RATE[90] = DATA_RATE_90SPS;
DATA_RATE[175] = DATA_RATE_175SPS;
DATA_RATE[330] = DATA_RATE_330SPS;
DATA_RATE[600] = DATA_RATE_600SPS;
DATA_RATE[1000] = DATA_RATE_1000SPS;
*/
const ADC_DATA_RATE = 600//330;
const THERMISTOR_MUX_WAIT_MSEC = 5;
const EXCITATION_DURATION_MSEC = Math.ceil(1000/ADC_DATA_RATE);
const FLUO_MEASUREMENT_COUNT = 8;
const MEASUREMENT_ALL_MIN_INTERVAL_MSEC = 4000;

const muxQueue = new ExclusiveTaskQueue();

class ShutdownPin {
  constructor () {
    this.handlers = [];
    const PIN = PIN_SHUTDOWN;
    rpio.open(PIN, rpio.INPUT, rpio.PULL_UP);
    this.done = false;
    rpio.poll(PIN, ()=>{
      if (!this.done) {
        this.done = true;
        this.handlers.forEach((handler)=>{
          handler();
        });
      }
    }, rpio.POLL_LOW);
  }
  addShutdownHandler (handler) {
    this.handlers.push(handler);
  }
}
const shutdownPin = new ShutdownPin();

class SoftPWM {
  constructor (pinNumBCM) {
    console.log("SoftPWM pinNumBCM=%d",pinNumBCM)
    this.pin = pigpio.gpio(pinNumBCM);
  }
  write (duty/* 0-1.0 */) {
     this.pin.analogWrite(duty/256.0);
  }
}

class HardwareConf {
  constructor () {
    this.ledUnit = null;
    this.i2c = i2c.openSync(I2C_CHANNEL);
    const adc = new ADS122C04IPWR(this.i2c, I2C_ADDR_ADC);
    this.adc = adc;
    this.adcManager = new ADCManager(adc, ADC_DATA_RATE);
    this.pwmPlate = new PIGPIO.SoftPWM(PIN_BCM_NUM_PWM_PLATE_HEATER);
    this.pwmLid = new PIGPIO.SoftPWM(PIN_BCM_NUM_PWM_LID_HEATER);
    this.pwmFan = new PIGPIO.SoftPWM(PIN_BCM_NUM_PWM_FAN);
    const FREQ_PELTIER = 1E5;
    this.pwmPeltier = new PIGPIO.HardPWM(PIN_BCM_NUM_PWM_PELTIER, FREQ_PELTIER);

    this.thermistorMux = new MUX8ch(PIN_NUM_PD_MUX_S0, PIN_NUM_PD_MUX_S1, PIN_NUM_PD_MUX_S2);
    /*
    const thermistorLowTemp = new Thermistor(B_CONST, R0, BASE_TEMP, THERMISTOR_POSITION , RES_LOW_TEMP);
    const thermistorHighTemp = new Thermistor(B_CONST, R0, BASE_TEMP, THERMISTOR_POSITION , RES_HIGH_TEMP);
    */
    // NX
    const thermistorConfNx = { low:new Thermistor(B_CONST_NX, R0, BASE_TEMP, THERMISTOR_POSITION , RES_LOW_TEMP), 
      high:new Thermistor(B_CONST_NX, R0, BASE_TEMP, THERMISTOR_POSITION , RES_HIGH_TEMP), 
      switchingTemp: SWITCHING_TEMP };
    const thermistorConfAki = { low:new Thermistor(B_CONST_AKI, R0, BASE_TEMP, THERMISTOR_POSITION , RES_LOW_TEMP), 
      high:new Thermistor(B_CONST_AKI, R0, BASE_TEMP, THERMISTOR_POSITION , RES_HIGH_TEMP), 
      switchingTemp: SWITCHING_TEMP };
    const thermistorConfAli = { low:new Thermistor(B_CONST_ALI, R0, BASE_TEMP, THERMISTOR_POSITION , RES_LOW_TEMP), 
      high:new Thermistor(B_CONST_ALI, R0, BASE_TEMP, THERMISTOR_POSITION , RES_HIGH_TEMP), 
      switchingTemp: SWITCHING_TEMP };
    
    {
      const plateBlockSensing = new TemperatureSensing(thermistorConfAli,
        this.adcManager, ADC_CHANNEL_THERMISTORS,
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_PLATE_BLOCK);
      const airSensing = new TemperatureSensing(thermistorConfNx,
        this.adcManager, ADC_CHANNEL_THERMISTORS,
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_AIR);
      const plateSensing = new PlateSensing(plateBlockSensing, airSensing);
      
      const relay = new Relay(PIN_PELTIER_RELAY_A, PIN_PELTIER_RELAY_B);
      const peltierAbsControl = {
        start: ()=>{
        },
        setOutput: (vOut)=>{
          // console.log("peltierAbsControl.setOutput %f", vOut);
          this.pwmPeltier.write(vOut);
        },
        off: ()=>{
          this.pwmPeltier.write(0);
        }
      }
      this.peltier = new Peltier(peltierAbsControl, relay);
      const plateOutput = new PlateOutput(this.pwmPlate, this.peltier, this.pwmFan);
      this.plate = new HeatUnit(new PID(PLATE_PID), plateSensing, plateOutput);
    }
    {
      const lidSensing = new TemperatureSensing(thermistorConfAli, 
        this.adcManager, ADC_CHANNEL_THERMISTORS, 
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_LID);
      const pid = new PID(LID_PID, true);
      pid.setOutputRange(0, 1.0);
      const output = new HeatLidOutput(this.pwmLid);
      this.lid = new HeatUnit(pid, lidSensing, output);
    }
    {
      this.extraSensing = new ExtraSensing(thermistorConfNx, 
        this.adcManager, ADC_CHANNEL_THERMISTORS, 
        this.thermistorMux, [MUX_CHANNEL_THERMISTOR_EXT1, MUX_CHANNEL_THERMISTOR_EXT2, MUX_CHANNEL_THERMISTOR_EXT3]);
    }
    try {
      this.adcManager.start();
      this.adc.initialize();
      console.log("adc.initialize()");
      this.adc.selectDataRate(ADC_DATA_RATE);
      console.log("adc.selectDataRate(%d)", ADC_DATA_RATE);
      this.adc.selectVoltageReferenceExternal();
      console.log("adc.selectVoltageReferenceExternal()");
      this.thermistorMux.initialize();
      console.log("thermistorMux.initialize()");
    } catch (ex) {
      console.log(ex);
    }
    
  }
  start () {
  }
  shutdown () {
  }
  
  /* Hardware specifications */
  wellsCount () {
    return WELLS_COUNT;
  }
  opticsChannelsCount () {
    return OPTICS_CHANNELS_COUNT;
  }
  temperatureChannels () {
    return TEMPERATURE_CHANNELS_CONF;
  }
  
  /* Getters of hardware units */
  getPlate () {
    return this.plate;
  }
  getHeatLid () {
    return this.lid;
  }
  getExtraSensing () {
    return this.extraSensing;
  }
  getLEDUnit () {
    console.log("getLEDUnit()");
    if (this.ledUnit == null) {
      const pot = new MCP4551T(this.i2c, I2C_ADDR_POT);
      const ledDriver = new PCA9955B(this.i2c, I2C_ADDR_PCA9955B);
      this.ledUnit = new LEDUnit(pot, ledDriver);
    }
    return this.ledUnit;
  }
  getShutdownSwitch () {
    return shutdownPin;
  }
  getFluorescenceSensingUnit() {
    // Generic 16ch MUX
    const muxWrapper = new GenericGPIOMuxWrapper();
    return new FluorescenceSensingUnit(muxWrapper, this.adcManager, ADC_CHANNEL_FLUORESCENCE_MEASUREMENT);
  }
};
class PlateSensing {
  constructor (plateBlockSensing, airSensing) {
    this.plateBlockSensing = plateBlockSensing;
    this.airSensing = airSensing;
  }
  start () {
    this.plateBlockSensing.start();
    this.airSensing.start();
  }
  measureTemperature (callback) {
    this.plateBlockSensing.measureTemperature((plateTemperature)=>{
      this.airSensing.measureTemperature((airTemperature)=>{
        // TODO sample temp simulation
        // TODO use simulated temperature as main
        const temperature = plateTemperature;
        const detailedMeasurement = {
          main:temperature,
          block:plateTemperature,
          air:airTemperature
        };
        callback(temperature, detailedMeasurement);
      });
    });
  }
}
const USE_TEMP_SWITCHING = false;
// Simple temperature sensing with a single thermistor
class TemperatureSensing {
  constructor (conf, adcManager, adcChannel, mux, muxChannel) {
    // { low:thermistorLowTemp, high:thermistorHighTemp, switchingTemp: SWITCHING_TEMP }
    this.thermistorLowTemp = conf.low;
    this.thermistorHighTemp = conf.high;
    this.switchingTemp = conf.switchingTemp;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
    this.mux = mux;
    this.muxChannel = muxChannel;
    this.prevValue = BASE_TEMP;
    console.log("LidSensing.muxChannel",this.muxChannel);
  }
  start () {
    this.adcManager.start();
    rpio.open(PIN_NUM_THERMISTOR_R, rpio.OUTPUT, rpio.LOW);
  }
  measureTemperature(callback) {
    const muxTaskId = muxQueue.request(()=>{
      this.mux.selectChannel(this.muxChannel);
      const muxTimestamp = new Date();
      let thermistor = null;
      let switchPinVal = 0;
      
      if (this.prevValue < this.switchingTemp) {
        thermistor = this.thermistorLowTemp;
      } else {
        thermistor = this.thermistorHighTemp;
        switchPinVal = 1;
      }
      rpio.write(PIN_NUM_THERMISTOR_R, switchPinVal);
      // Prev value
      // Switch
      setTimeout(()=>{
        this.adcManager.readDiffChannelValue(this.adcChannel[0], this.adcChannel[1], (val, raw)=>{
          const temp = thermistor.getTemp(val);
          if ((temp > 120 || temp < 10) && 
          (this.muxChannel == MUX_CHANNEL_THERMISTOR_PLATE_BLOCK || this.muxChannel == MUX_CHANNEL_THERMISTOR_LID)) {
            const interval = new Date().getTime() - muxTimestamp.getTime()
            console.log("IRREGULAR %d\t%f\t%f\t%f<=>%f", this.muxChannel, val, temp, this.prevValue,this.switchingTemp);
            console.log(raw)
            console.log(this.prevRaw)
          }
          this.prevRaw = raw;

          muxQueue.release(muxTaskId);
          const detailedMeasurement = {
            main:temp
          };
          callback(temp, detailedMeasurement);
        });
      }, THERMISTOR_MUX_WAIT_MSEC);
    });
  }
  shutdown () {
    
  }
}
/* Thermistor array */
class ExtraSensing {
  constructor (thermistorConf, adcManager, adcChannel, mux, muxChannels) {
    // muxChannels
    this.units = [];
    this.measurement = {};
    muxChannels.forEach ((channel)=>{
      const unit = new TemperatureSensing(thermistorConf, adcManager, adcChannel, mux, channel);
      this.units.push(unit);
    });
    this.measurement = {}; // Detailed temperature data object (may include multiple values)
    this.measurementTimestamp = null;
  }
  start () {}
  _measure(i, resolve) {
    const unit = this.units[i];
    this.measurementTimestamp = new Date().getTime();
    if (unit) {
      unit.measureTemperature((temperature)=>{
        this.measurement[i] = temperature;
        this._measure(i+1, resolve);
      });
      
    } else {
      resolve();
    }
  }
  control (resolve) {
    this._measure(0, resolve);
  }
  data () {
    return this.measurements;
  }
  measureTemperature (callback, expirationMsec) {
    if (expirationMsec > 0 && this.measurementTimestamp > 0 && this.measurementTimestamp + expirationMsec > new Date().getTime()) {
      // Latest measurement data is cached. Callback immediately.
      callback(this.measurement);
    } else {
      // Measurement data is expired or not existing
      this._measure (0, ()=>{
        this.measurementTimestamp = new Date().getTime();
        callback(this.measurement);
      });
    }
  }
}
class PlateOutput {
  // Combination of heater (PWM) and fan (PWM)
  constructor (plateHeaterPWM, peltier, fanPWM) {
    this.plateHeaterPWM = plateHeaterPWM;
    this.peltier = peltier;
    this.fanPWM = fanPWM;
    this.plateActualOutput = 0.0;
    this.setFanOutput(1.0);
    this.setPlateHeaterOutput(0);
  }
  setPlateHeaterOutput (value) {
    const actualOutput = Math.min(1.0, Math.min(value, this.plateActualOutput + 0.25));
    this.plateHeaterPWM.write(actualOutput);
    // this.plateHeaterPWM.write(value);
    // TODO peltier
    this.plateActualOutput = actualOutput;
  }
  setFanOutput (value) {
    this.fanPWM.write(value);
  }
  start () {
    this.peltier.start();
  }
  setOutput (outputValue /* Range={-1,1.0} */) {
    if (this.disposed) {
      return;
    }
    outputValue = Math.min(1.0, Math.max(-1, outputValue)); // -1 ... +1
    if (outputValue > 0) {
      this.setPlateHeaterOutput(outputValue);
      this.setFanOutput(0);
    } else {
      this.setPlateHeaterOutput(0);
      this.setFanOutput(-outputValue);
    }
    this.peltier.setOutput(outputValue);
  }
  off () {
    this.setPlateHeaterOutput(0);
    this.setFanOutput(0.0);
    this.peltier.off(0);
  }
  cool () {
    this.setPlateHeaterOutput(0);
    this.setFanOutput(1.0);
    this.peltier.off(0);

  }
  shutdown () {
    console.log("Shutting down PlateOutput.");
    this.setPlateHeaterOutput(0);
    this.setFanOutput(1.0);
    this.peltier.off(0);
    this.disposed = true;
    console.log("Shutting down PlateOutput...done");
  }
}

/* 4bit GPIO MUX  + Switch */
let debugLastMuxChannel = 0;
let debugLastMuxSwitch = 0;

class GenericGPIOMuxWrapper {
  constructor () {
    this.mux = new MUX16ch(PIN_NUM_PD_MUX_S0, PIN_NUM_PD_MUX_S1, PIN_NUM_PD_MUX_S2, PIN_NUM_PD_MUX_S3);
    this.muxSwitch = PIN_NUM_MUX_SELECT;
    
    this.selArgv = parseInt(process.argv[2]);
    this.channelArgv = parseInt(process.argv[3]);
  }
  start () {
    rpio.open(this.muxSwitch, rpio.OUTPUT, rpio.LOW);
    this.mux.initialize();
  }
  /**
   * 
   * @param {number} wellIndex Well index (0..15)
   * @param {number} channel Optical channel (0..1)
   */
  select (wellIndex, channel) {
    // wellIndex = 1;
    let muxSwitchVal = 0;
    let muxChannel = 0;
    let dir = "";
    if (wellIndex < 8) {
        // North
        muxSwitchVal = 0;
        muxChannel = MUX_MAP_PHOTODIODES_N[channel][wellIndex];
        dir = "N";
    } else {
        // South
        muxSwitchVal = 1;
        muxChannel = MUX_MAP_PHOTODIODES_S[channel][wellIndex-8];
        dir = "S";
    }
    debugLastMuxChannel = muxChannel;
    debugLastMuxSwitch = muxSwitchVal;
    rpio.write(this.muxSwitch, muxSwitchVal);
    this.mux.selectChannel(muxChannel);
    // console.log("W %d C %d M %d S %d @%d", wellIndex, channel, muxChannel, muxSwitchVal, new Date().getTime()%10000);
  }
}
class MUXWrapperThermistor {
  constructor () {
    this.mux = new MUX8ch(PIN_NUM_PD_MUX_S0, PIN_NUM_PD_MUX_S1, PIN_NUM_PD_MUX_S2);
    this.muxSwitch = PIN_NUM_MUX_SELECT;
  }
  start () {
    this.mux.initialize();
    rpio.open(this.muxSwitch, rpio.OUTPUT, rpio.LOW);
  }
  selectChannel (channel) {
    this.mux.selectChannel(channel);
    rpio.write(this.muxSwitch, 0);
  }
}
const LED_WELL_TO_CHANNEL_MAP = [
  11,10,9,8,12,13,14,15,
  4,5,6,7,3,2,1,0
];
// LED unit with given potentiometer & led driver (Not dependent on specific hardware implementation)
class LEDUnit {
  constructor (pot, ledDriver) {
    console.log("LEDUnit.init()")
    console.log(pot);
    console.log(ledDriver);
    this.pot = pot;
    this.ledDriver = ledDriver;
  }
  start () {
    this.pot.initialize();
    this.pot.setWiper(0);
    this.ledDriver.setBlankControlMode();
    this.ledDriver.offAll();
  }
  /**
   * 
   * @param {number} well Well index
   * @param {number} iref IREF value (sent to LED driver)
   */
  select (well, iref) {
    if (! (iref > 0) ) {
      iref = 255;
    }
    // this.pot.setWiper(wiper);
    let channel = LED_WELL_TO_CHANNEL_MAP[well];
    this.ledDriver.setIREF (channel, iref);
    setTimeout(()=>{
      this.ledDriver.selectChannel(channel);
    }, 1);
  }
  
  /**
   * Turn off LED driver
   */
  off () {
    this.ledDriver.off();
  }
  shutdown () {
    this.disposed = true;
    console.log("Shutting down LED unit.");
  }
}

const LARGE_GAIN_SIG = 0;
const SMALL_GAIN_SIG = 1;
const LARGE_GAIN_VALUE = 10.0; // MOhm
const SMALL_GAIN_VALUE = 1.0; // MOhm

const USE_GAIN_SWITCHING = false;
const DEFAULT_IS_STRONG_SIGNAL = false; // Set "false" to use the larger gain
// Photodiode
class FluorescenceSensingUnit {
  constructor (mux, adcManager, adcChannel) {
    this.mux = mux;
    this.adcManager = adcManager;
    this.adcChannel = adcChannel;
    this.measuredValues = [];
    for (let i=0; i<2; i++) {
      this.measuredValues.push([]);
      for (let j=0; j<16; j++) {
        this.measuredValues[i].push({v:0.15,s:true});
      }
    }
    this.wellIndex = 0;
    this.opticalChannel = 0;
    this.isStrongSignal = false;
  }
  start () {
    rpio.open(PIN_NUM_AMP_GAIN_SWITCH, rpio.OUTPUT, LARGE_GAIN_SIG);
    this.adcManager.start();
    this.mux.start();
  }
  excitationDuration () { return EXCITATION_DURATION_MSEC; }
  measurementCount () { return FLUO_MEASUREMENT_COUNT; }
  measurementAllMinInterval () { return MEASUREMENT_ALL_MIN_INTERVAL_MSEC; }
  _select (wellIndex, opticalChannel) {
    this.mux.select(wellIndex, opticalChannel);
    // Switch gain according to previous measurement
    this.opticalChannel = opticalChannel;
    this.wellIndex = wellIndex;
    if (USE_GAIN_SWITCHING) {
        
      const prev = this.measuredValues[this.opticalChannel][this.wellIndex];
      this.isStrongSignal = prev.s;
      if (prev.s /* 1M */ && prev.v  < 0.008) {
        // Measured by strong-signal (small gain) mode but the actual measurement was too weak
        this.isStrongSignal = false;
      }
      if (!prev.s /* 10M */  && prev.v  > 0.4) {
        // Measured by weak-signal (large gain) mode but amplified signal is saturated.
        this.isStrongSignal = true;
      }
    } else {
      // this.isStrongSignal = false;
      this.isStrongSignal = DEFAULT_IS_STRONG_SIGNAL;
    }
    const w = (this.isStrongSignal)? SMALL_GAIN_SIG:LARGE_GAIN_SIG;
    rpio.write(PIN_NUM_AMP_GAIN_SWITCH, w);
  }
  select (wellIndex, opticalChannel, callback) {
    this.muxTaskId = muxQueue.request(()=>{
      // Wait if MUX is in use
      this._select(wellIndex, opticalChannel);
      callback();
    });
  }
  release () {
    muxQueue.release(this.muxTaskId);
  }
  measure(callback) {
    this.adcManager.readDiffChannelValue(this.adcChannel[0], this.adcChannel[1], (_val)=>{
      const val = _val * 2;
      this.measuredValues[this.opticalChannel][this.wellIndex] = {v:val,s:this.isStrongSignal};
      callback({v:val/*,s:this.isStrongSignal?"1M":"10M"*/});
    });
  }
  shutdown () {
    this.disposed = true;
    console.log("Shutting down photosensing unit.");
  }
}

class HeatLidOutput {
  // Heater (with PWM)
  constructor (pwm) {
  // TODO active low / active high
    this.pwm = pwm;
  }
  start () {
  }
  setOutput (outputValue /* Range={0,1.0} */) {
    if (this.disposed) {
      return;
    }
    outputValue = Math.min(1.0, Math.max(0, outputValue));
    this.pwm.write(outputValue);
  }
  off () {
    this.pwm.write(0);
    console.log("PWM Off");
  }
  shutdown () {
    console.log("Shutting down HeatLidOutput.");
    this.off();
    this.disposed = true;
  }
}

module.exports = new HardwareConf();

