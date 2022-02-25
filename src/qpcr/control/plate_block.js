"use strict";

/*
  PlateBlock class represents a single metal block.
  A device's plate consists of one or more blocks.
*/
const DEFAULT_TEMP = 25.0;
const LOG_BUFF_CAPACITY = 10;

const OUTPUT_FIT_TOLERANCE = 0.05;
const TIME_SYNC_TOLERANCE = 1.0;
// Ring buffer of temp logs.
class TempLog {
  constructor () {
    this.buff = [];
    this.dataCount = 0;
    this.dataIndex = 0;
    this.prev = null;
    this.fitConstants = null;
  }
  add (output, plateTemp, airTemp, timestampMsec) {
    const timestamp = timestampMsec / 1000.0;
    let slope = null;
    if (this.prev != null) {
      slope = (plateTemp - this.prev.w) / (timestamp - this.prev.t)
    }
    const obj = {
      p: output,
      w: plateTemp,
      a: airTemp,
      t: timestamp,
      slope: slope
    };
    if (this.buff.length < this.dataIndex) {
      this.buff.push(obj);
    } else {
      this.buff[this.dataIndex] = obj;
    }
    this.dataCount ++;
    this.dataIndex = (this.dataIndex + 1) % LOG_BUFF_CAPACITY;
    this.prev = obj;
  }
  reset () {
    this.buff = [];
    this.dataCount = 0;
    this.dataIndex = 0;
  }
  debug () {
    console.log(JSON.stringify(this.buff.map(d=>d.p)));
  }
  estimate (targetTemperature) {
    if (this.prev == null) {
      return -1;
    }
    // this.prev.p ... Recent value of output
    // this.prev.a ... Recent value of air
    // this.prev.w ... Recent value of well
    // this.prev.t ... Timestamp of recent measurement
    const plot = this.buff.filter(
      (obj)=>{ return obj.slope != null && Math.abs(obj.p-this.prev.p) < OUTPUT_FIT_TOLERANCE }
    ).map(obj=>[(obj.w-obj.a), obj.slope]); // Mapped to (WellTemp-AirTemp, Slope of time vs temp plot)
    let consts = linearFit(plot);
    // const a = consts.a;
    // const b = consts.b;
    const A = consts.a; // Slope
    const B = consts.b; // Y-intercept
    const C = (this.prev.w - this.prev.a + B/A) / Math.exp(A * this.prev.t);
    const estimatedTime = (1.0 / A) * Math.log((targetTemperature-this.prev.a + B/A)/C);
    this.fitConstants = {
      A:A,
      B:B,
      C:C,
      targetTemperature:targetTemperature,
      estimatedTime:estimatedTime
    };
    return estimatedTime;
  }
  getEstimatedTime () {
    return this.fitConstants.estimatedTime;
  }
  getOutputRatioForEstimatedTime (targetTime) {
    const A = this.fitConstants.A;
    const B = this.fitConstants.B;
    const C = this.fitConstants.C;
    const estimatedTime = this.fitConstants.estimatedTime;
    if (Math.abs(estimatedTime - targetTime) < TIME_SYNC_TOLERANCE) {
      // console.log("Estimated times are almost equal.");
      return 1.0;
    }
    const targetTemperature = this.fitConstants.targetTemperature;
    const air = this.prev.a;
    const temperature = this.prev.w;
    const expTarget = Math.exp(A * targetTime);
    const expNow = Math.exp(A * this.prev.t);
    const ratio = (A/B) * (expTarget * (temperature - air) - expNow * (targetTemperature - air)) / (expNow - expTarget);
    return ratio;
    
  }
}
function linearFit (plot) {
  /* Array of [x, y] arrays */
  let n=0, sumX=0, sumY=0, sumXY=0, sumXX=0;
  plot.forEach((p)=>{
    const x = p[0];
    const y = p[1];
    n += 1;
    sumX += x;
    sumY += y;
    sumXY += x * y;
    sumXX += x * x;
  });
  // console.log("sumX=%f, sumY=%f", sumX/n, sumY/n)
  const a = (n * sumXY - sumX * sumY) / 
    (n * sumXX - sumX * sumX);
  const b = (sumXX * sumY - sumXY * sumX) / 
    (n * sumXX - sumX * sumX);
    // console.log("FIT %f, %f (n=%d)", a, b, n)
  return { a:a, b:b };
}

const TOLERANCE_TEMP = 0.5;
class PlateBlock {
  constructor (pid, sensing, output) {
    this.pid = pid;
    this.sensing = sensing;
    this.output = output;
    this.temperature = DEFAULT_TEMP;
    this.tempLog = new TempLog();
    
    this.maxDriveRatio = 1.0;
    this.targetAchieved = false;
    // TODO add dependencies to thermistor(s), heater and PID config
  }
  measureTemperature (airTemp, timestamp, callback) {
    this.sensing.readTemperature((temperature)=>{
      // TODO call sensing & mux implementation -> callback
      this.temperature = temperature;
      this.pid.setValue(this.temperature); // measured temp
      // Achieved?
      if (!this.targetAchieved  && (this.temperature > this.targetTemperature != this.transitionStartTemperature > this.targetTemperature
        || Math.abs(this.temperature - this.targetTemperature) <= TOLERANCE_TEMP)) {
          // Target is between start & current or current temp is within the "tolerance" range
          this.targetAchieved = true;
        }
      const output = this.maxDriveRatio;
      this.tempLog.add (output, this.temperature, airTemp, timestamp);
      callback();
    });
  }
  setTargetTemperature (targetTemperature) {
    this.tempLog.reset();
    this.targetTemperature = targetTemperature;
    this.transitionStartTemperature = this.temperature;
  }
  setOutput (outputValue) {
    this.outputValue = outputValue;
    this.output.setOutput(this.outputValue);
  }
  estimate () {
    // Remaining time to the target temperature
    this.estimatedTime = this.tempLog.estimate(this.targetTemperature);
  }
  // Sync and update max drive ratio.
  syncWith (rear) {
    let output = this.tempLog.getOutputRatioForEstimatedTime(rear.tempLog.getEstimatedTime());
    console.log("Estimated",rear.tempLog.getEstimatedTime());
    this.maxDriveRatio *= output;
    // console.log("SyncResult=%f", this.maxDriveRatio);
    this.sensing.dummyMaxDriveRatio = this.maxDriveRatio;
  }
  calcDesiredOutput () {
    const pidOutput = this.pid.getOutput();
    if (Math.abs(pidOutput) < 0.8 && !this.targetAchieved) {
      // console.log("TargetAchieved!");
      this.targetAchieved = true;
    }
    this.desiredOutput = Math.max(-this.maxDriveRatio, Math.min(this.maxDriveRatio, pidOutput));
    return this.desiredOutput;
  }
  off () {
    this.setOutput(0);
  }
}

module.exports = PlateBlock;