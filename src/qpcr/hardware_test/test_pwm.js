const raspi = require('raspi');
const pwm = require('raspi-pwm');
 
raspi.init(() => {
  const led = new pwm.PWM(23);
  let val = 0.1;
  setInterval(()=>{
    led.write(val);
    val += 0.1;
    console.log(val);
    if (val > 1.0) {
      val = 0;
    }
  }, 200);
});