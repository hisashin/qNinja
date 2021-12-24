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
const HeatLidMulti = require("../control/heat_lid_multi.js");
const PlateBlock = require("../control/plate_block.js");
const Thermistor = require("../hardware/thermistor.js");

// Hardware lilbraries
const ADS122C04IPWR = require("../hardware/adc_ads122c04ipwr.js");
const ADCManager = require("../hardware/adc_manager.js");
const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");
const MUX16ch = require("../hardware/mux_16ch.js");
const MUX8ch = require("../hardware/mux_8ch.js");
const MCP4551T = require("../hardware/pot_mcp4551t.js");
const PCA9955B = require("../hardware/led_driver_pca9955b.js");
const PromiseQueue = require("../lib/promise_queue.js");
const Relay = require("../hardware/relay.js");
const Peltier = require("../hardware/peltier.js");

const PIGPIO_PORT = 8888;
const PIGPIO = require('../lib/pigpio_client_wrapper.js');
PIGPIO.init({port:PIGPIO_PORT});


// Pins
const I2C_CHANNEL = 1; // SDA1 & SCL1

const I2C_ADDR_PCA9955B = 0x05;
// const I2C_ADDR_PCA9955B = 0x70;
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
const B_CONST = [
  { minTemp:0.0, bConst:4250, voltageLimit:0.0 }, // 4250 for 0-50 deg 
  { minTemp:50.0, bConst:4311, voltageLimit:0.0 }, // 4311 for 50-85 deg 
  { minTemp:85.0, bConst:4334, voltageLimit:0.0 } // 4334 for 85-100 deg 
];
const THERMISTOR_POSITION = false; /* Thermistor is connected to 0V line */

/* 
  PIN_NUM_* means pin number.
  PIN_NAME_* means pin's GPIO name
*/
const PIN_NUM_VIN_SENSE = 11; //GPIO0

const PIN_NUM_MUX_SELECT = 22; // Pin22, GPIO6
const PIN_NUM_PD_MUX_1 = 16; // Pin 16, GPIO4 (Mux channel)
const PIN_NUM_PD_MUX_2 = 12; // Pin 12, GPIO1 (Mux channel)
const PIN_NUM_PD_MUX_3 = 10; // Pin 10, GPIO16 (Mux channel)
const PIN_NUM_PD_MUX_4 = 8; // Pin 8, GPIO15 (Mux channel)
const PIN_NUM_AMP_GAIN_SWITCH = 7;// Pin 7, GPIO7
const PIN_NUM_THERMISTOR_R = 26;// Pin 26, GPIO 11
const PIN_BCM_NUM_PWM_PLATE_HEATER = 13; // Pin 33, GPIO23, BCM 13 (Hardware PWM available)
const PIN_BCM_NUM_PWM_LID_HEATER = 27; // Pin 13, GPIO2, BCM 27
const PIN_BCM_NUM_PWM_FAN = 5; // Pin 29, GPIO 21, BCM 5
const PIN_BCM_NUM_PWM_PELTIER = 12; // Pin 32, GPIO26, BCM 12 (Hardware PWM available)

const PIN_PELTIER_RELAY_A = 36; // Pin 36, GPIO27
const PIN_PELTIER_RELAY_B = 38; // Pin 38, GPIO28

const PIN_NUM_DOOR_OPEN = 35; // Pin 35, GPIO24
const PIN_NUM_DOOR_LOCK = 36; // Pin 37, GPIO25
const PIN_NUM_ADC_DRDY = 24; // Pin 24, GPIO10
const PIN_SHUTDOWN = PIN_NUM_VIN_SENSE; // TODO tmp

/* Pin COnfig */
const PLATE_KP = 1.0;
const PLATE_KI = 0.02;
const PLATE_KD = 0.02;

const HEATER_KP = 1.0;
const HEATER_KI = 1.0;
const HEATER_KD = 1.0;

const MUX_CHANNEL_THERMISTOR_PLATE_BLOCK = 0;
const MUX_CHANNEL_THERMISTOR_AIR = 1;
const MUX_CHANNEL_THERMISTOR_LID = 2;
const MUX_CHANNEL_THERMISTOR_EXT1 = 3;
const MUX_CHANNEL_THERMISTOR_EXT2 = 4;
const MUX_CHANNEL_THERMISTOR_EXT3 = 5;

// Well name -> Channel index

const MUX_MAP_PHOTODIODES_N = [
  [15,14,13,12,11,10,9,8], // Opt channel 1
    [0,1,2,3,4,5,6,7], // Opt channel 0
];
const MUX_MAP_PHOTODIODES_S = [
  [8,9,10,11,12,13,14,15], // Opt channel 0
  [7,6,5,4,3,2,1,0] // Opt channel 1
];

/*
const MUX_MAP_PHOTODIODES_N = [
  [6,4,2,0,8,10,12,14],
  [7,5,,3,1,9,11,13,15]
];
const MUX_MAP_PHOTODIODES_S = [
  [14,12,10,8,0,2,4,6],
  [15,13,11,9,1,3,5,7]
]
*/
const TEMPERATURE_CHANNELS_CONF = {
  // label, property
};
/* 
  Measurement Interval and Data Rate
  Interval > 1000 / DataRate
*/
const ADC_DATA_RATE = 90;
const THERMISTOR_MUX_WAIT_MSEC = 20;
const DEBUG_COEFF = 1;
const EXCITATION_DURATION_MSEC = 25 * DEBUG_COEFF;
const MEASUREMENT_ALL_MIN_INTERVAL_MSEC = 4000 * DEBUG_COEFF;

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
    this.thermistorMux = new MUX8ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3);
    const thermistorLowTemp = new Thermistor(B_CONST, R0, BASE_TEMP, THERMISTOR_POSITION , RES_LOW_TEMP);
    const thermistorHighTemp = new Thermistor(B_CONST, R0, BASE_TEMP, THERMISTOR_POSITION , RES_HIGH_TEMP);
    
    {
      const plateBlockSensing = new TemperatureSensing(thermistorLowTemp, thermistorHighTemp, SWITCHING_TEMP,
        this.adcManager, ADC_CHANNEL_THERMISTORS,
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_PLATE_BLOCK);
      const airSensing = new TemperatureSensing(thermistorLowTemp, thermistorHighTemp, SWITCHING_TEMP,
        this.adcManager, ADC_CHANNEL_THERMISTORS,
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_AIR);
      const plateSensing = new PlateSensing(plateBlockSensing, airSensing);
      
      const relay = new Relay(PIN_PELTIER_RELAY_A, PIN_PELTIER_RELAY_B);
      const peltierAbsControl = {
        start: ()=>{
        },
        setOutput: (vOut)=>{
          this.pwmPeltier.write(vOut);
        },
        off: ()=>{
          this.pwmPeltier.write(0);
        }
      }
      this.peltier = new Peltier(peltierAbsControl, relay);
      const plateOutput = new PlateOutput(this.pwmPlate, this.peltier, this.pwmFan);
      this.plate = new HeatUnit(new PID(PLATE_KP, PLATE_KI, PLATE_KD), plateSensing, plateOutput);
    }
    {
      const lidSensing = new TemperatureSensing(thermistorLowTemp, thermistorHighTemp, SWITCHING_TEMP, 
        this.adcManager, ADC_CHANNEL_THERMISTORS, 
        this.thermistorMux, MUX_CHANNEL_THERMISTOR_LID);
      const pid = new PID(HEATER_KP, HEATER_KI, HEATER_KD);
      pid.setOutputRange(0, 1.0);
      const output = new HeatLidOutput(this.pwmLid);
      this.lid = new HeatUnit(pid, lidSensing, output);
    }
    {
      this.extraSensing = new ExtraSensing(thermistorLowTemp, thermistorHighTemp, SWITCHING_TEMP, 
        this.adcManager, ADC_CHANNEL_THERMISTORS, 
        this.thermistorMux, [MUX_CHANNEL_THERMISTOR_EXT1, MUX_CHANNEL_THERMISTOR_EXT2, MUX_CHANNEL_THERMISTOR_EXT3]);
    }
    // this.extraSensing
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
      console.log("getLEDUnit() create...");
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
        const temperature = plateTemperature;
        // TODO use simulated temperature as main
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
  constructor (thermistorLowTemp, thermistorHighTemp, switchingTemp, adcManager, adcChannel, mux, muxChannel) {
    this.thermistorLowTemp = thermistorLowTemp;
    this.thermistorHighTemp = thermistorHighTemp;
    this.switchingTemp = switchingTemp;
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
        this.adcManager.readDiffChannelValue(this.adcChannel[0], this.adcChannel[1], (val)=>{
          const temp = thermistor.getTemp(val);
          this.prevValue = temp;
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
  constructor (thermistorLowTemp, thermistorHighTemp, switchingTemp, adcManager, adcChannel, mux, muxChannels) {
    // muxChannels
    this.units = [];
    this.measurement = {};
    muxChannels.forEach ((channel)=>{
      const unit = new TemperatureSensing(thermistorLowTemp, thermistorHighTemp, switchingTemp, adcManager, adcChannel, mux, channel);
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
  }
  setOutput (outputValue /* Range={-1,1.0} */) {
    outputValue = Math.min(1.0, Math.max(-1, outputValue)); // -1 ... +1
    console.log("plate output=%d", outputValue)
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
    this.setFanOutput(0);
  }
  shutdown () {
    console.log("Shutting down PlateOutput.");
      this.setPlateHeaterOutput(0);
      this.setFanOutput(1.0);
  }
}

/* 4bit GPIO MUX  + Switch */
let debugLastMuxChannel = 0;
let debugLastMuxSwitch = 0;
class GenericGPIOMuxWrapper {
  constructor () {
    this.mux = new MUX16ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3, PIN_NUM_PD_MUX_4);
    this.muxSwitch = PIN_NUM_MUX_SELECT;
    
    this.selArgv = parseInt(process.argv[2]);
    this.channelArgv = parseInt(process.argv[3]);
    console.log("Sel=%d, Ch=%d", this.selArgv, this.channelArgv);
  }
  start () {
    this.openDone = true;
    rpio.open(this.muxSwitch, rpio.OUTPUT, rpio.LOW);
    this.mux.initialize();
  }
  select (wellIndex, channel) {
    const channelOffset = channel;
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
    if (this.selArgv >= 0) {
      muxSwitchVal = this.selArgv;
      
    }
    if (this.channelArgv >= 0) {
      muxChannel = this.channelArgv;
      
    }
    debugLastMuxChannel = muxChannel;
    debugLastMuxSwitch = muxSwitchVal;
    rpio.write(this.muxSwitch, muxSwitchVal);
    this.mux.selectChannel(muxChannel);
    // console.log(this.openDone, muxChannel, muxSwitchVal, dir);
    // console.log("W %d C %d M %d S %d @%d", wellIndex, channel, muxChannel, muxSwitchVal, new Date().getTime()%10000);
  }
}
class MUXWrapperThermistor {
  constructor () {
    this.mux = new MUX8ch(PIN_NUM_PD_MUX_1, PIN_NUM_PD_MUX_2, PIN_NUM_PD_MUX_3);
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

// TODO LED map (well to channel
/*const LED_WELL_TO_CHANNEL_MAP = [
  7,6,5,4,3,2,1,0,
  15,14,13,12,11,10,9,8
];*/

// TODO reverse (for debug)
const LED_WELL_TO_CHANNEL_MAP = [
  11,10,9,8,12,13,14,15,
  4,5,6,7,3,2,1,0
];
// LED unit with given potentiometer & led driver (Not dependent on specific hardware implementation)
let hoge = 0;
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
    this.pot.initialize();
    this.ledDriver.setBlankControlMode();
  }
  select (well) {
    this.pot.setWiper(0);
    this.flg = !this.flg;
    let channel = LED_WELL_TO_CHANNEL_MAP[well];
    channel = LED_WELL_TO_CHANNEL_MAP[hoge%8]; // Debug
    this.ledDriver.selectChannel(channel);
    console.log("Well=%d Channel=%d", well, channel);
    // this.ledDriver.off();
    if (well == 15) {
      console.log("Well %d", hoge);
      hoge = (hoge + 1) % 16;
    }
  }
  off () {
    this.ledDriver.off();
  }
  shutdown () {
    console.log("Shutting down LED unit.");
  }
}

const LARGE_GAIN_SIG = 0;
const SMALL_GAIN_SIG = 1;
const LARGE_GAIN_VALUE = 10.0; // MOhm
const SMALL_GAIN_VALUE = 1.0; // MOhm

const USE_GAIN_SWITCHING = false;
const DEFAULT_IS_STRONG_SIGNAL = true; // Set "false" to use the larger gain
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
      /*
      if (hoge%2==0)
        this.isStrongSignal = DEFAULT_IS_STRONG_SIGNAL;
      else
        this.isStrongSignal = !DEFAULT_IS_STRONG_SIGNAL;
        */
        this.isStrongSignal = false;
    }
    rpio.write(PIN_NUM_AMP_GAIN_SWITCH, (this.isStrongSignal)? SMALL_GAIN_SIG:LARGE_GAIN_SIG);
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
      callback({v:val,s:this.isStrongSignal?"1M":"10M",x:debugLastMuxSwitch, y:debugLastMuxChannel});
    });
  }
  shutdown () {
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
    outputValue = Math.min(1.0, Math.max(0, outputValue));
    this.pwm.write(outputValue);
  }
  off () {
    this.pwm.write(0);
  }
  shutdown () {
    console.log("Shutting down HeatLidOutput.");
    this.off();
  }
}

module.exports = new HardwareConf();