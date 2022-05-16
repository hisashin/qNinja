// ADS1219IPWR (4ch ADC)
"use strict";

const i2c = require('i2c-bus');
const DEFAULT_BUS_NUMBER = 1;
// Datasheet: https://www.ti.com/store/ti/en/p/product/?p=ADS1219IPWR
// PDF: https://www.ti.com/lit/ds/symlink/ads1219.pdf?&ts=1589885438370
// Voltage->Value -FS->800000h, 0->000000h, FS->7FFFFFh

const MUX_SINGLE_END_A0 = 0b011;
const MUX_SINGLE_END_A1 = 0b100;
const MUX_SINGLE_END_A2 = 0b101;
const MUX_SINGLE_END_A3 = 0b110;

const DATA_RATE_20SPS = 0b00;
const DATA_RATE_90SPS = 0b01;
const DATA_RATE_330SPS = 0b10;
const DATA_RATE_1000SPS = 0b11;

const MUX_DIFF_PA0_NA1 = 0b000;
const MUX_DIFF_PA2_NA3 = 0b001;
const MUX_DIFF_PA1_NA2 = 0b010;

const MUX_SINGLE_END_VALS = [
  MUX_SINGLE_END_A0,
  MUX_SINGLE_END_A1,
  MUX_SINGLE_END_A2,
  MUX_SINGLE_END_A3
];

/* Commands */
const COMMAND_RDATA = 0b00010000;
const COMMAND_SSYNC = 0b00001000;
const COMMAND_RREG = 0b00100000;
const COMMAND_WREG = 0b01000000;

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
  /*
    Command
    RESET: Reset 0000 011x
    START/SYNC: Start/Sync 0000 100x
    POWERDOWN: Power down 0000 001x
    RDATA: Read data 0001 xxxx
    RREG: Read register at addr r 0010 0rxx
    WREG: Write configuration register 0100 00xx
  */
  readConfigurationRegister () {
    // RREG: Read register at addr r 0010 0rxx
      this.i2c.sendByteSync(this.address, COMMAND_RREG);
      return this.i2c.receiveByteSync(this.address);
  }
  selectDataRate (rate) {
    console.log("SelectDataRate %d", rate);
    let rateBits = DATA_RATE_20SPS;
    if (rate == 20) {
      rateBits = DATA_RATE_20SPS;
    } else if (rate == 90) {
      rateBits = DATA_RATE_90SPS;
    } else if (rate == 330) {
      rateBits = DATA_RATE_330SPS;
    } else if (rate == 1000) {
      rateBits = DATA_RATE_1000SPS;
    } else {
      console.warn("Data rate %d is invalid. Supported values are 20, 90, 330 and 1000.", rate);
    }
    const currentVal = this.readConfigurationRegister();
    const val = (0b11110011 & currentVal) | (rateBits << 2)
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([COMMAND_WREG, val]));
    this.i2c.sendByteSync(this.address, COMMAND_SSYNC);
  }
  
  // Measure diff signals
  selectDiff (pChannel, nChannel) {
    let muxBits = null;
    if (pChannel == 0 && nChannel == 1) {
      muxBits = MUX_DIFF_PA0_NA1;
    } else if (pChannel == 2 && nChannel == 3) {
      muxBits = MUX_DIFF_PA2_NA3;
    } else if (pChannel == 1 && nChannel == 2) {
      muxBits = MUX_DIFF_PA1_NA2;
    }
    if (muxBits == null) {
      console.error("Wrong combination of P and N. Valid combinations are (0, 1), (2, 3) and (1, 2).");
    }
    const currentVal = this.readConfigurationRegister();
    const val = (0b00011111 & currentVal) | (muxBits << 5) | 0x01; // Full range
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([COMMAND_WREG, val]));
    this.i2c.sendByteSync(this.address, COMMAND_SSYNC);
  }
  // Measure single-ended signals
  selectChannel (channel) {
    const currentVal = this.readConfigurationRegister();
    const muxBits = MUX_SINGLE_END_VALS[channel]; //TODO debug
    // const muxBits = MUX_DIFF_PA2_NA3;
    // Note: By default, it uses internal ref voltage (2.048V)
    const val = (0b00011111 & currentVal) | (muxBits << 5) | 0x01; // Full range
    this.i2c.i2cWriteSync(this.address, 2, Buffer.from([COMMAND_WREG, val]));
    this.i2c.sendByteSync(this.address, COMMAND_SSYNC);
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
      callback(origVal/0x800000, buffVal); // TODO debug
      // callback( Math.max(0, val / (1.0 * 0x00800000))); // For single-ended
    });
  }
  
  reset () {
    
  }
}
module.exports = ADS1219IPWR;