const raspi = require('raspi');
const pwm = require('raspi-pwm');
 
raspi.init(() => {
  const led0 = new pwm.PWM(23); // Use GPIO{n} number
  const led1 = new pwm.PWM(1); // Use GPIO{n} number
  let val = 0.1;
  setInterval(()=>{
    led0.write(val);
    led1.write(1.0-val);
    val += 0.1;
    console.log(val);
    if (val > 1.0) {
      val = 0;
    }
  }, 200);
});