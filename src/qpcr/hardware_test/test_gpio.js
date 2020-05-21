/* Simple blinkey for GPIO test */
const rpio = require('rpio');

const startBlink = (pin /* J8 pin number (not GPIO ID) */, interval /* msec */) => {
  let on = false;
  rpio.open(pin, rpio.OUTPUT, rpio.LOW);
  setInterval(()=>{
    on = !on;
    const val = (on) ? rpio.HIGH : rpio.LOW;
    console.log(val);
    rpio.write(pin, val);
  }, interval);
  
}
startBlink(3, 1000);