// ADS1219IPWR (4ch ADC)

const i2c = require('i2c-bus');
const DEFAULT_DEVICE_NUMBER = 1;
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
  constructor (i2cBusNumber, slaveAddress) {
    this.slaveAddress = slaveAddress;
    this.i2c = null;
    if (i2cBusNumber == null) {
      i2cBusNumber = DEFAULT_DEVICE_NUMBER;
    }
    if ( !(i2cBusNumber == 1 || i2cBusNumber == 2)) {
      throw new Error("i2cBusNumber should be 1 or 2.");
    }
    this.i2cBusNumber = i2cBusNumber;
  }
  initialize () {
    this.i2c = i2c.openSync(this.i2cBusNumber);  //i2c1 or i2c2
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
      this.i2c.sendByteSync(this.slaveAddress, COMMAND_RREG);
      return this.i2c.receiveByteSync(this.slaveAddress);
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
    this.i2c.i2cWriteSync(this.slaveAddress, 2, new Buffer([COMMAND_WREG, val]));
    this.i2c.sendByteSync(this.slaveAddress, COMMAND_SSYNC);
  }
  selectChannel (channel) {
    const currentVal = this.readConfigurationRegister();
    // console.log(currentVal);
    const muxBits = MUX_SINGLE_END_VALS[channel];
    // Note: By default, it uses internal ref voltage (2.048V)
    const val = (0b00011111 & currentVal) | (muxBits << 5) | 0x01; // Full range
    this.i2c.i2cWriteSync(this.slaveAddress, 2, new Buffer([COMMAND_WREG, val]));
    this.i2c.sendByteSync(this.slaveAddress, COMMAND_SSYNC);
  }
  sync () {
    this.i2c.sendByteSync(this.slaveAddress, COMMAND_SSYNC);
  }
  /* Returns raw ADC value */
  readConversionDataSync () {
    this.i2c.sendByteSync(this.slaveAddress, COMMAND_RDATA);
    // Read 3 bytes
    let val = this.i2c.receiveByteSync(this.slaveAddress);
    val <<= 8;
    val |= this.i2c.receiveByteSync(this.slaveAddress);
    val <<= 8;
    val |= this.i2c.receiveByteSync(this.slaveAddress);
    if(val & 0x00800000){
      val = ~val + 1;
      val = -(val & 0xFFFFFF);
    }
    return val / (1.0 * 0x00800000);
  }
  
  readConversionData (callback) {
    let buff = Buffer.alloc(3, 0x00);
    this.i2c.readI2cBlock(this.slaveAddress, COMMAND_RDATA, 3, buff, ()=>{
      let val = (buff[0] << 16) | (buff[0] << 16) | buff[2];
      if(val & 0x00800000){
        val = ~val + 1;
        val = -(val & 0xFFFFFF);
      }
      callback(val / (1.0 * 0x00800000));
    });
  }
  
  reset () {
    
  }
}
module.exports = ADS1219IPWR;