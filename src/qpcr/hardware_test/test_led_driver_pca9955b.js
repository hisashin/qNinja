"use strict";
// PCA9955 test
const PCA9955 = require("../hardware/led_driver_pca9955b.js");
const rpio = require('rpio');


const MCP4551T = require("../hardware/pot_mcp4551t.js");

const DELAY = 1000;
const CHANNEL_OFFSET = 0;
const CHANNEL_COUNT = 16; //16;
const PIN_LATCH = 15;
const PIN_NAME_BLANK= 23; //26(ADA) 23 (Free)
const PIN_NUM_SPI_SWITCH = 18; //GPIO5
const VALUE_SPI_SWITCH_MUX = rpio.LOW;
// const I2C_ADDR_PCA9955B = 0x05;
const I2C_ADDR_PCA9955B = 0x70;

const I2C_CHANNEL = 1; // SDA1 & SCL1
const LED_WELL_TO_CHANNEL_MAP = [
  
  8,9,10,11,12,13,14,15,
  0,1,2,3,4,5,6,7
];

rpio.open(32, rpio.INPUT);

rpio.open(PIN_NUM_SPI_SWITCH, rpio.OUTPUT, VALUE_SPI_SWITCH_MUX);
const ledDriver = new PCA9955(I2C_CHANNEL, I2C_ADDR_PCA9955B);
ledDriver.start();
const pot = new MCP4551T(ledDriver.i2c, 0x2F);
let channel = 0;
let duty = 0.0;
let switchVal = true;
ledDriver.setBlankControlMode();
const interval = setInterval(()=>{
  pot.setWiper(0);
  /*
  if (channel == 0) {
    switchVal = !switchVal;
    console.log("Switch. %d", switchVal);
    const v = (switchVal)?rpio.LOW:rpio.HIGH;
    rpio.write(PIN_NUM_SPI_SWITCH, v);
    //ledDriver.setDuty(1.0 - duty);
    duty += 0.1;
    if (duty > 1.0) {
      duty = 0.0;
    }
  }
  */
  /*
  if (channel % 2 == 0) {
    ledDriver.onAll();
  } else {
    ledDriver.offAll();
  }
  */
  const ch = CHANNEL_OFFSET + channel;
  console.log("Ch=%d", ch);
  /*
  const v = (ch>8)?rpio.LOW:rpio.HIGH;
  rpio.write(VALUE_SPI_SWITCH_MUX, v);
  */
  ledDriver.selectChannel(/*LED_WELL_TO_CHANNEL_MAP[ch]*/ch);
  channel = (channel + 1) % CHANNEL_COUNT;
  
}, DELAY);