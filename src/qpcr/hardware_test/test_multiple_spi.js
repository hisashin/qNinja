"use strict";

const SPI = require('pi-spi');
const rpio = require('rpio');
const raspi = require('raspi');
const pwm = require('raspi-pwm');

const spi0 = SPI.initialize("/dev/spidev0.0");
const spi1 = SPI.initialize("/dev/spidev1.0");
