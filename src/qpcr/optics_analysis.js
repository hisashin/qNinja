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
  }
  calcBaseline () {
    let index = 0;
    if (this.log.baseline==null || this.log.baseline.length == 0) {
      console.warn("OpticsAnalysis.calcBaseline baseline empty.");
      return;
    }
    const channelsCount = this.log.baseline[0].values.length;
    // {"repeat":0,"timestamp":22655,"values":[0.10839931087059657,0.14320391221901324,0.12286425068855174,0.14246562122693912,0.11768404832484902,0.11755829662844186,0.10416033499631905,0.12868933895027088]}
    let values = [];
    for (let i=0; i<channelsCount; i++) {
      values.push([]);
    }
    this.log.baseline.forEach((data)=>{
      data.values.forEach((value, index)=>{
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