/*
  Temperature caculation module
*/
"use strict";
/* Library */
const KELVIN = 273.15;
const voltageToTemp = (voltageRatio, resistance, b_constant, r0, baseTemp) => {
  const thermistorR = resistance * voltageRatio / (1.0 - voltageRatio);
  return (1 / ((Math.log(thermistorR / r0) / b_constant) + (1.0 / (baseTemp + KELVIN))))  - KELVIN;
}
const tempToVoltageRatio  = (tempCelsius, resistance, 
  bConst, r0, baseTemp) => {
  const thermistorR = r0 * Math.exp(bConst * (1 / (tempCelsius + KELVIN) - 1 / (baseTemp + KELVIN)));
    // bConst, r0, baseTemp);
  return thermistorR / (thermistorR + resistance);
}
class Thermistor {
  constructor (
      bConstRanges, 
      r0, 
      baseTemp, 
      highSide /* Which side? */, 
      r /* Counter resistance */
    ) {
    this.bConstRanges = bConstRanges;
    this.r0 = r0;
    this.baseTemp = baseTemp;
    this.highSide = highSide;
    this.r = r;
    this.calcVoltageLimits();
  }
  getTemp (val) {
    if (this.highSide) {
      val = 1.0 - val;
    }
    const temp =  voltageToTemp(val, this.r, this.bConstantForVoltage(val), this.r0, this.baseTemp);
    if (isNaN(temp)) {
      console.log("getTemp NaN val=" + val);
    }
    return temp;
  }
  bConstantForVoltage (voltageRatio) {
    let bConstant = this.bConstRanges[0].bConst;
    for (let i=1; i < this.bConstRanges.length; i++) {
      const range = this.bConstRanges[i];
      if (voltageRatio < range.voltageLimit) {
        bConstant = range.bConst;
      }
    }
    return bConstant;
  }
  calcVoltageLimits () {
    for (let i=1; i<this.bConstRanges.length; i++) {
      const range = this.bConstRanges[i];
      const vLimit = tempToVoltageRatio(range.minTemp, this.r, 
        range.bConst, this.r0, this.baseTemp);
      range.voltageLimit = vLimit;
    }
  }
}

module.exports = Thermistor;
