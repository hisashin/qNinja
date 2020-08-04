'use strict';

const fs = require('fs');
const LogManager = require("./log_manager");

/* Statistics util */
const Stat = {
  average: (values)=>{
    let sum = 0;
    values.forEach((value)=>{
      sum += value;
    });
    return sum/values.length;
  },
  standardDeviation: (values, average)=>{
    if (average == null) {
      average = Stat.average(values);
    }
    let sum = 0;
    values.forEach((value)=>{
      sum += Math.pow(value-average, 2);
    });
    return Math.sqrt(sum/values.length);
  }
};
const DEFAULT_THRESHOLD_RATIO = 10; // Default threshold = baseline + SD * 10
class OpticsAnalysis {
  constructor (log) {
    this.log = log;
    this.baselines = [];
    this.thresholds = [];
    this.ct = null;
    this.ctIndex = 0;
    this.meltCurve = [];
    this.meltCurveIndex = 0;
  }
  calcBaseline () {
    let index = 0;
    const data = this.log.fluorescence.baseline;
    if (data==null || data.length == 0) {
      console.warn("OpticsAnalysis.calcBaseline baseline empty.");
      return;
    }
    const channelsCount = data[0].v.length;
    // {"repeat":0,"timestamp":22655,"values":[0.10839931087059657,0.14320391221901324,0.12286425068855174,0.14246562122693912,0.11768404832484902,0.11755829662844186,0.10416033499631905,0.12868933895027088]}
    let values = [];
    for (let i=0; i<channelsCount; i++) {
      values.push([]);
    }
    data.forEach((line)=>{
      line.v.forEach((value, index)=>{
        values[index].push(value);
      });
    });
    this.baselines = [];
    this.thresholds = [];
    values.forEach((channel, index)=>{
      const baseline = Stat.average(channel);
      const sd = Stat.standardDeviation(channel);
      const threshold = baseline + sd * DEFAULT_THRESHOLD_RATIO;
      this.baselines.push(baseline);
      this.thresholds.push(threshold);
      console.log("Channel %d avg=%f, sd=%f, threshold=%f", index, baseline, sd, threshold);
    });
  }
  calcCt () {
    if (this.thresholds.length == 0) {
      console.warn("this.thresholds is empty.");
      return;
    }
    if (this.ct == null) {
      this.ct = this.thresholds.map((v)=>{return -1;});
      this.ctIndex = 0;
    }
    const data = this.log.fluorescence.qpcr;
    for (let i=this.ctIndex; i<data.length; i++) {
      //console.log("Repeat %d %s", data[i].repeat, JSON.stringify(data[i].v));
      for (let ch=0; ch<this.ct.length; ch++) {
        if (this.ct[ch] < 0 && this.thresholds[ch] < data[i].v[ch]) {
          //console.log("Ch[%d] OK at %d", ch, data[i].repeat);
          this.ct[ch] = data[i].repeat;
        } 
      }
      this.ctIndex = i;
    }
    console.log("Ct=" + JSON.stringify(this.ct));
  }
  calcMeltCurve () {
    // this.meltCurve = [];
    // this.meltCurveIndex = 0;
    const rawData = this.log.fluorescence.melt_curve;
    if (rawData == null || rawData.length == 0) {
      console.warn("Melt curve data is empty.");
      return;
    }
    for (let i=this.meltCurveIndex; i<rawData.length; i++) {
      // TODO use moving average
      this.meltCurve[i] = rawData[i];
      let derivatives = [];
      if (i > 0) {
        const prevTemp = rawData[i-1].temp;
        const temp = rawData[i].temp;
        for (let ch=0; ch<this.ct.length; ch++) {
            // Calc derivative
            derivatives[ch] = (rawData[i].v[ch] - rawData[i-1].v[ch])/(temp-prevTemp);
        }
      }
      this.meltCurve[i].d = derivatives;
      console.log(this.meltCurve[i]);
    }
  }
  getBaselines () {
    return this.baselines;
  }
  getThresholds () {
    return this.thresholds;
  }
  standardCurve () {
    // TODO
  }
  meltCurve () {
    // TODO
  }
}
OpticsAnalysis.fromLogFile = (id, onCreate, onError)=>{
  console.log("OpticsAnalycic.fromLogFile path=%s",id);
  const logManager = new LogManager();
  logManager.getLog(id, (log)=>{
    onCreate(new OpticsAnalysis(log));
  }, onError);
};

module.exports = OpticsAnalysis;