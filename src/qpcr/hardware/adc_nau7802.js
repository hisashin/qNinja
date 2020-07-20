"use strict";
/*
  NAU7802 : 24bit A/D Converter
*/
const i2c = require('i2c-bus');

const NAU7802_ADDR = 0x2A; // Fixed
const DEFAULT_DEVICE_NUMBER = 1;

// Resisters
const REG = {
  PU_CTRL : 0x00,
  CTRL1 : 0x01,
  CTRL2 : 0x02,
  OCAL1_B2 : 0x03,
  OCAL1_B1 : 0x04,
  OCAL1_B0 : 0x05,
  GCAL1_B3 : 0x06,
  GCAL1_B2 : 0x07,
  GCAL1_B1 : 0x08,
  GCAL1_B0 : 0x09,
  OCAL2_B2 : 0x0A,
  OCAL2_B2 : 0x0B,
  OCAL2_B2 : 0x0C,
  GCAL2_B3 : 0x0D,
  GCAL2_B2 : 0x0E,
  GCAL2_B1 : 0x0F,
  GCAL2_B0 : 0x10,
  I2C_Control: 0x11,
  ADCO_B2 : 0x12,
  ADCO_B1 : 0x13,
  ADCO_B0 : 0x14,
  OTP_B1 : 0x15,
  OTP_B0 : 0x16,
  REVISION :  0x1F
};

const BIT = {
  PU_CTRL : {
    PR : 0, // Register Reset
    PUD : 1, // Power up digital circuit
    PUA : 2, // Power up analog circuit
    PUR : 3, // Power up ready (Read Only Status)
    CS : 4, // Cycle start
    CR : 5, // Cycle ready (Read only Status)
    OSCS : 6, // System clock source select
    AVDDS : 7 // AVDD source select
  },
  CTRL2 : {
    CALS : 2, // Calibration
    CHS : 7 // Channel Select 1=Ch2, 0=Ch1 (default)
  }
};

class ADC_NAU7802 {

  constructor (i2cBusNumber) {
    this.i2c = null;
    if (i2cBusNumber == null) {
      i2cBusNumber = DEFAULT_DEVICE_NUMBER;
    }
    if ( !(i2cBusNumber == 1 || i2cBusNumber == 2)) {
      throw new Error("i2cBusNumber should be 1 or 2.");
    }
    this.i2cBusNumber = i2cBusNumber;
  }

  start () {
    this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2

    // Reset registers
    this.resetResisters();
    // Power up digital
    this.setRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.PUD);
    // Power up analog
    this.setRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.PUA);

    this.calibrate();

    this.setRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.CS);
    this.waitForBitValue(REG.PU_CTRL, BIT.PU_CTRL.PUR, true, 1000);

    // Start conversion
    this.startCycle(REG.PU_CTRL, BIT.PU_CTRL.CS);
  }

  // Set sampling rates
  setRate10SPS () {
    // 000
    this.clearRegisterBit(REG.CTRL2, 4);
    this.clearRegisterBit(REG.CTRL2, 5);
    this.clearRegisterBit(REG.CTRL2, 6);
  }
  setRate20SPS () {
    // 001
    this.clearRegisterBit(REG.CTRL2, 4);
    this.clearRegisterBit(REG.CTRL2, 5);
    this.setRegisterBit(REG.CTRL2, 6);
  }
  setRate40SPS () {
    // 010
    this.clearRegisterBit(REG.CTRL2, 4);
    this.setRegisterBit(REG.CTRL2, 5);
    this.clearRegisterBit(REG.CTRL2, 6);
  }
  setRate80SPS () {
    // 011
    this.clearRegisterBit(REG.CTRL2, 4);
    this.setRegisterBit(REG.CTRL2, 5);
    this.setRegisterBit(REG.CTRL2, 6);
  }
  setRate320SPS () {
    // 111 (Default)
    this.clearRegisterBit(REG.CTRL2, 4);
    this.setRegisterBit(REG.CTRL2, 5);
    this.clearRegisterBit(REG.CTRL2, 6);
  }

  resetResisters () {
    this.setRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.RR);
    this.clearRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.RR);
  }

  calibrate () {
    this.setRegisterBit(REG.CTRL2, BIT.CTRL2.CALS);
    this.waitForBitValue(REG.CTRL2, BIT.CTRL2.CALS, true, 1000);
  }

  selectChannel1 () {
    this.setRegisterBit(REG.CTRL2, BIT.CTRL2.CHS);
    calibrate();
  }

  selectChannel2 () {
    this.clearRegisterBit(REG.CTRL2, BIT.CTRL2.CHS);
    calibrate();
  }

  startCycle () {
    this.setRegisterBit(REG.PU_CTRL, BIT.PU_CTRL.CS);
  }

  // Read 24bit value and return signed value
  readADCValue () {
    // Wait for "cycle ready" flag
    this.waitForBitValue(REG.PU_CTRL, BIT.PU_CTRL.CR, true, 1000);

    this.i2c.sendByteSync(NAU7802_ADDR, REG.ADCO_B2);
    let val = this.i2c.receiveByteSync(NAU7802_ADDR);
    val <<= 8;
    val |= this.i2c.receiveByteSync(NAU7802_ADDR);
    val <<= 8;
    val |= this.i2c.receiveByteSync(NAU7802_ADDR);
    if(val & 0x00800000){
      val = ~val + 1;
      val = -(val & 0xFFFFFF);
    }

    this.startCycle();
    return val;
  }

  // Read revision code (Desired value is 0x1F)
  getRevision () {
    return this.readRegValue(REG.REVISION);
  }

  /* Register Control */
  setRegValue (regAddress, value) {
    this.i2c.i2cWriteSync(NAU7802_ADDR, 2, new Buffer([regAddress, value]));
  }

  readRegValue (regAddress) {
    this.i2c.sendByteSync(NAU7802_ADDR, regAddress);
    return this.i2c.receiveByteSync(NAU7802_ADDR);
  }

  setRegisterBit (regAddress, index) {
    let value = this.readRegValue(regAddress) | (1<<index);
    this.setRegValue(regAddress, value);
  }

  clearRegisterBit (regAddress, index) {
    let value = this.readRegValue(regAddress) & ~(1 << index);
    this.setRegValue(regAddress, value);
  }

  waitForBitValue (regAddress, flagIndex, flagValue, timeoutMsec) {
    let startMillis = new Date().getTime();
    let elapsed = 0;
    do {
      let read_out = this.readRegValue(regAddress);
      let flagResult = (read_out & (0x01 << flagIndex)) != 0;
      elapsed = (new Date().getTime()-startMillis);
      if (flagResult == flagValue) {
          return true;
      }
    } while (elapsed < timeoutMsec);
    // Timeout
    return false;
  }
}

ADC_NAU7802.REG = REG;
ADC_NAU7802.BIT = BIT;
module.exports = ADC_NAU7802;
