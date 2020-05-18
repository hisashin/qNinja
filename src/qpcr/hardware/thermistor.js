/*
  Temperature caculation module
*/

const THERMISTOR_BASE_TEMP = 25.0;
const KELVIN = 273.15;
const rs = require("./hardware/resistor_switch.js");

// B-constants of well Thermistor
const B_CONST_25_50 = 4250; // Low
const B_CONST_25_85 = 4311; // Medium
const B_CONST_25_100 = 4334; //High

const R_0_WELL = 100.0;

// Counter resistors (kOhm)
const R_SET = [100.0, 49.9, 10.0]; // R1, R2, R3
const R_LOW_TEMP = R_SET[0]; // Well low mode
const R_MID_TEMP = 1.0 / (1.0 / R_SET[0] + 1.0 / R_SET[1]);
const R_HIGH_TEMP = 1.0 / (1.0 / R_SET[0] + 1.0 / R_SET[1] + 1.0 / R_SET[2]);

const INVERSE_BASE_TEMP = 1.0 / (THERMISTOR_BASE_TEMP + KELVIN);

/*
http://localhost:8888/notebooks/git/jupyter_docker/PCR/4wells_PCR_thermistor_selection.ipynb
Resistors: [120.0, 49.9, 10.0]
Switching temp: [34.39999999999995, 67.20000000000041]
*/
const RANGE_LOW = { label:"L", maxTemp: 34.4, resistance:R_LOW_TEMP, mode:rs.MODE_LOW };
const RANGE_MEDIUM = { label:"M", maxTemp: 67.2, resistance:R_MID_TEMP, mode:rs.MODE_MEDIUM };
const RANGE_HIGH = { label:"H", maxTemp: 200, resistance:R_HIGH_TEMP, mode:rs.MODE_HIGH };
const RANGES = [
  RANGE_LOW,
  RANGE_MEDIUM,
  RANGE_HIGH
];

class Thermistor {

  constructor () {
  }

  getBConstForTemp (temp) {
    if (temp < 50) {
      return B_CONST_25_50;
    } if (temp < 85) {
      return B_CONST_25_85;
    }
    return B_CONST_25_100;
  }

  voltageToTemperature (voltage, range, refTemp) {
    let voltageRatio = voltage / 3.3;
    let resistance = range.resistance; //R_LOW_TEMP;
    let thermistorR = resistance * voltageRatio / (1.0 - voltageRatio);
    let bConst = this.getBConstForTemp(refTemp);
    return (1 / ((Math.log(thermistorR / R_0_WELL) / bConst) + INVERSE_BASE_TEMP)) - KELVIN;
  }

  getRangeForTemp (temp) {
    //return RANGE_MEDIUM;
    for (let range of RANGES) {
      if (temp <=  range.maxTemp) {
        return range;
      }
    }
    return RANGES[RANGES.length-1];
  }

  defaultRange () {
    //return RANGE_MEDIUM;
    return RANGE_LOW;
  }
}

const thermistor = new Thermistor();
module.exports = thermistor;
