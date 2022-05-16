// ADS1219IPWR (4ch ADC)
"use strict";
// TODO Support DRDY
// Wait for DRDY to transition low
const i2c = require('i2c-bus');
const DEFAULT_BUS_NUMBER = 1;
// Datasheet: https://www.ti.com/store/ti/en/p/product/?p=ADS1219IPWR
// PDF: https://www.ti.com/lit/ds/symlink/ads1219.pdf?&ts=1589885438370
// Voltage->Value -FS->800000h, 0->000000h, FS->7FFFFFh

const DATA_RATE_20SPS = 0b000;
const DATA_RATE_45SPS = 0b001;
const DATA_RATE_90SPS = 0b010;
const DATA_RATE_175SPS = 0b011;
const DATA_RATE_330SPS = 0b100;
const DATA_RATE_600SPS = 0b101;
const DATA_RATE_1000SPS = 0b110;

const DATA_RATE = [];
DATA_RATE[20] = DATA_RATE_20SPS;
DATA_RATE[45] = DATA_RATE_45SPS;
DATA_RATE[90] = DATA_RATE_90SPS;
DATA_RATE[175] = DATA_RATE_175SPS;
DATA_RATE[330] = DATA_RATE_330SPS;
DATA_RATE[600] = DATA_RATE_600SPS;
DATA_RATE[1000] = DATA_RATE_1000SPS;

const VREF_INTERNAL = 0b00; // Internal 2.048V (default)
const VREF_EXTERNAL = 0b01; // External ref (REFP-REFN)
const VREF_ANALOG_SUPPLY = 0b10; // Analog supply (AVDD-AVSS)

const MUX_DIFF_PA0_NA1 = 0b0000;
const MUX_DIFF_PA0_NA2 = 0b0001;
const MUX_DIFF_PA0_NA3 = 0b0010;
const MUX_DIFF_PA1_NA0 = 0b0011;
const MUX_DIFF_PA1_NA2 = 0b0100;
const MUX_DIFF_PA1_NA3 = 0b0101;
const MUX_DIFF_PA2_NA3 = 0b0110;
const MUX_DIFF_PA3_NA2 = 0b0111;

const MUX_SINGLE_END_A0 = 0b1000;
const MUX_SINGLE_END_A1 = 0b1001;
const MUX_SINGLE_END_A2 = 0b1010;
const MUX_SINGLE_END_A3 = 0b1011;

const MUX_DIFF = [[],[],[],[]];
MUX_DIFF[0][1] = MUX_DIFF_PA0_NA1;
MUX_DIFF[0][2] = MUX_DIFF_PA0_NA2;
MUX_DIFF[0][3] = MUX_DIFF_PA0_NA3;
MUX_DIFF[1][0] = MUX_DIFF_PA1_NA0;
MUX_DIFF[1][2] = MUX_DIFF_PA1_NA2;
MUX_DIFF[1][3] = MUX_DIFF_PA1_NA3;
MUX_DIFF[2][3] = MUX_DIFF_PA2_NA3;
MUX_DIFF[3][2] = MUX_DIFF_PA3_NA2;

const MUX_SINGLE = [];
MUX_SINGLE[0] = MUX_SINGLE_END_A0;
MUX_SINGLE[1] = MUX_SINGLE_END_A1;
MUX_SINGLE[2] = MUX_SINGLE_END_A2;
MUX_SINGLE[3] = MUX_SINGLE_END_A3;

const MUX_SINGLE_END_VALS = [
  MUX_SINGLE_END_A0,
  MUX_SINGLE_END_A1,
  MUX_SINGLE_END_A2,
  MUX_SINGLE_END_A3
];

/* Commands */
const COMMAND_RESET = 0b00000110;
const COMMAND_SSYNC = 0b00001000;
const COMMAND_PDOWN = 0b00000010;
// const COMMAND_RDATA = 0b00010000;
const COMMAND_RDATA = 0x10;
const COMMAND_RREG = 0b00100000; // 0010 rrxx : Read register at address rr
const COMMAND_WREG = 0b01000000; // 0100 rrxx : Write register at address rr

class ADS1219IPWR {
  constructor (i2c, address) {
    if (typeof(i2c)=="number") {
      console.log("ADC channel is specified by bus number.");
      if ( !(i2c == 1 || i2c == 2)) {
        throw new Error("i2cBusNumber should be 1 or 2.");
      }
      this.i2cBusNumber = i2c;
    } else if (i2c != null) {
      this.i2c = i2c;
    } else {
      this.i2cBusNumber = DEFAULT_BUS_NUMBER;
    }
    this.address = address;
  }
  initialize () {
    if (this.i2c == null) {
      console.log("ADC channel opening: %d", this.i2cBusNumber);
      this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2
        console.log("ADC channel opened: %d", this.i2cBusNumber);
    }
  }
  start () {
    this.selectVoltageReferenceExternal();
  }
  readRegister (addr) {
    const val = COMMAND_RREG | (0b11&addr) << 2;
    this.i2c.sendByteSync(this.address, val);
    return this.i2c.receiveByteSync(this.address);
  }
  writeRegister (addr, value) {
    const addrVal = COMMAND_WREG | (0b11&addr) << 2;
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([addrVal, value]));
    this.sync();
  }
  selectDataRate (rate) {
    console.log("SelectDataRate %d", rate);
    let rateBits = DATA_RATE[rate];
    if (rateBits == null) {
      console.warn("Data rate %d is invalid. Supported values are 20, 90, 330 and 1000.", rate);
    }
    const currentVal = this.readRegister(0x01);
    const val = (0b00011111 & currentVal) | (rateBits << 5);
    this.writeRegister(0x01, val);
  }
  _selectVoltageReference (refType) {
    const currentVal = this.readRegister(0x01);
    const val = (0b11111001 & currentVal) | (refType << 1);
    this.writeRegister(0x01, val);
  }
  selectVoltageReferenceInternal () {
    // Internal 2.048V (default)
    this._selectVoltageReference(VREF_INTERNAL);
  }
  selectVoltageReferenceExternal () {
    // External ref (REFP-REFN)
    this._selectVoltageReference(VREF_EXTERNAL);
  }
  selectVoltageReferenceSupply () {
    // Analog supply (AVDD-AVSS)
    this._selectVoltageReference(VREF_ANALOG_SUPPLY);
  }
  
  // Measure diff signals
  selectDiff (pCh, nCh) {
    if (!MUX_DIFF[pCh]) {
      console.warn("Invalid combination", pCh, nCh);
      return;
    }
    const muxBits = MUX_DIFF[pCh][nCh];
    if (muxBits == null) {
      console.warn("Invalid combination", pCh, nCh);
    }
    const currentVal = this.readRegister(0x00);
    const val = (0b00001111 & currentVal) | (muxBits << 4);
    this.writeRegister(0x00, val);
  }
  // Measure single-ended signals
  selectChannel (channel) {
    const muxBits = MUX_SINGLE[channel];
    if (muxBits == null) {
      console.warn("Invalid channel", channel);
      return;
    }
    const currentVal = this.readRegister(0x00);
    const val = (0b00001111 & currentVal) | (muxBits << 4);
    this.writeRegister(0x00, val);
  }
  
  sync () {
    this.i2c.sendByteSync(this.address, COMMAND_SSYNC);
  }
  /* Returns raw ADC value */
  readConversionDataSync () {
    this.i2c.sendByteSync(this.address, COMMAND_RDATA);
    // Read 3 bytes
    let val = this.i2c.receiveByteSync(this.address);
    val <<= 8;
    val |= this.i2c.receiveByteSync(this.address);
    val <<= 8;
    val |= this.i2c.receiveByteSync(this.address);
    if(val & 0x00800000){
      val = ~val + 1;
      val = -(val & 0xFFFFFF);
    }
    return val / (1.0 * 0x00800000);
  }
  
  readConversionData (callback) {
    let buff = Buffer.alloc(3, 0x00);
    this.i2c.readI2cBlock(this.address, COMMAND_RDATA, 3, buff, ()=>{
      let buffVal = [buff[0], buff[1], buff[2]];
      let val = (buff[0] << 16) | (buff[1] << 8) | buff[2];
      let origVal = val;
      if(val & 0x00800000){
        val = ~val + 1;
        val = -(val & 0xFFFFFF);
      }
      if (val < 0) {
        val = 0;
      }
      origVal = val;
      callback(origVal/0x800000, buffVal);
    });
  }
  
  debug () {
    this.hoge = !this.hoge;
    if (this.hoge)
      console.log("Reg 1h", this.readRegister(0x01).toString(2));
    else
      this.writeRegister(0x01, 0b00000110);
  }
  
  reset () {
    
  }
}
module.exports = ADS1219IPWR;