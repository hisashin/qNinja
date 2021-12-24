const PIGPIO = require('../lib/pigpio_client_wrapper.js');
// Usage: sudo node test_pigpio_client.js 8787
const port = process.argv[2];

const bcmHard = parseInt(process.argv[3]);
const bcmSoft = parseInt(process.argv[4]);



var freq = 1E5;
console.log("HardwarePWM bcm=%d SoftwarePWM bcm=%d", bcmHard, bcmSoft)

PIGPIO.init({port:port});
const gpioHard = new PIGPIO.HardPWM(bcmHard, freq);
const gpioSoft =  new PIGPIO.SoftPWM(bcmSoft);

let i = 1;
setInterval(()=>{
    gpioHard.write(i/16.0);
    gpioSoft.write(i/16.0);
  i = (i+1)%16;
}, 1000);
