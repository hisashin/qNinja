'use strict';

const fs = require('fs');

class BaselineAlgorithmDefault {
  
}
class ThresholdAlgorithmDefault {
  
}
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
  },
  sum: (values)=>{
      let sum = 0;
      values.forEach((value)=>{
        if (sum != null) sum += value;
      });
      return sum;
  },
  sq: (v)=>{
    return Math.pow(v, 2);
  },
  eachXY: (xValues, yValues, f) => {
    let array = [];
    for (let i=0; i<xValues.length; i++) {
      array.push(f(xValues[i], yValues[i]));
    }
    return array;
  },
  linearLSM: (xValues, yValues)=>{
    const n = xValues.length;
    const sumX = Stat.sum(xValues);
    const sumY = Stat.sum(yValues);
    const sumXX = Stat.sum(xValues.map(v=>Stat.sq(v)));
    const sumXY = Stat.sum(Stat.eachXY(xValues, yValues, (x, y)=>{ return x * y }));
    const denominator = n * sumXX - Stat.sq(sumX);
    const a = (n * sumXY - sumX * sumY) / denominator;
    const b = (sumXX * sumY - sumXY * sumX) /  denominator;
    const fit = xValues.map(x=> a * x + b);
    return {
      slope: a,
      yIntercept: b,
      xIntercept: -b/a
    }
  }
};
const DEFAULT_THRESHOLD_RATIO = 10; // Default threshold = baseline + SD * 10
const DEFAULT_BASELINE_START = 0;
const DEFAULT_BASELINE_END = 10;
class OpticsAnalysis {
  constructor (experiment) {
    this.experiment = experiment;
    const hardware = this.experiment.hardware;
    this.wellsCount = hardware.wells.count;
    this.channelsCount = hardware.channels.count;
    
    this.baselines = [];
    this.thresholds = [];
    this.ct = null;
    this.ctIndex = 0;
    this.meltCurve = [];
    this.meltCurveIndex = 0;
    
    this.fluorescenceTable = this.initChannelWellMatrix([]);
    // [channel][well][cycle]
    if (this.experiment.log.fluorescence && this.experiment.log.fluorescence.qpcr) {
      const qpcr = this.experiment.log.fluorescence.qpcr;
      for (let measurement of qpcr) {
        this.eachWell((channelIndex, wellIndex)=>{
          this.fluorescenceTable[channelIndex][wellIndex].push(measurement.v[channelIndex][wellIndex]);
        });
      }
    }
  }
  eachWell (func /* (channelIndex, wellIndex)=>{} */) {
    for (let channelIndex = 0; channelIndex < this.channelsCount; channelIndex++) {
      for (let wellIndex = 0; wellIndex < this.wellsCount; wellIndex++) {
        func(channelIndex, wellIndex);
      }
    }
  }
  /* Returns Channel x Well matrix filled with default values */
  initChannelWellMatrix (defaultValue) {
    let a = [];
    for (let channelIndex = 0; channelIndex < this.channelsCount; channelIndex++) {
      let row = [];
      for (let wellIndex = 0; wellIndex < this.wellsCount; wellIndex++) {
        row.push(JSON.parse(JSON.stringify(defaultValue)));
      }
      a.push(row);
    }
    return a;
  }
  calcBaseline () {
    this.baselines = this.initChannelWellMatrix([]);
    this.thresholds = this.initChannelWellMatrix([]);
    this.eachWell((channelIndex, wellIndex)=>{
      const values = this.fluorescenceTable[channelIndex][wellIndex];
      // TODO use baseline target value
      const target = values.slice(DEFAULT_BASELINE_START, DEFAULT_BASELINE_END);
      const baseline = Stat.average(target);
      const sd = Stat.standardDeviation(target);
      //const threshold = baseline + sd * DEFAULT_THRESHOLD_RATIO;
      const threshold = Math.pow(10, 2.5); // TODO Debug
      this.baselines[channelIndex][wellIndex] = baseline;
      this.thresholds[channelIndex][wellIndex] = threshold;
      // console.log("Channel %d Well %d avg=%f, sd=%f, threshold=%f", channelIndex, wellIndex, baseline, sd, threshold);
    });
  }
  calcCt () {
    this.cts = this.initChannelWellMatrix(null);
    this.eachWell((channelIndex, wellIndex)=>{
      // Baseline subtraction
      const baseline = this.baselines[channelIndex][wellIndex];
      const values = this.fluorescenceTable[channelIndex][wellIndex].map(v=>v-baseline);
      const threshold = this.thresholds[channelIndex][wellIndex];
      this.cts[channelIndex][wellIndex] = null;
      for (let i=0; i<values.length-1; i++) {
        if (values[i] <= threshold && threshold < values[i+1]) {
          const ct = i + (threshold-values[i])/(values[i+1]-values[i]);
          this.cts[channelIndex][wellIndex] = ct;
        }
      }
    });
  }
  // TODO
  calcMeltCurve (limitCount) {
    // this.meltCurve = [];
    // this.meltCurveIndex = 0;
    const rawData = this.experiment.fluorescence.melt_curve;
    if (rawData == null || rawData.length == 0) {
      console.warn("Melt curve data is empty.");
      return false;
    }
    let updated = false;
    let toIndex = (limitCount!=null && limitCount>0)?
      Math.min(this.meltCurveIndex+limitCount,rawData.length)
      :
      rawData.length;
    for (let i=this.meltCurveIndex; i < toIndex; i++) {
      // TODO use moving average
      this.meltCurve[i] = rawData[i];
      let derivatives = [];
      updated = true;
      if (i > 0) {
        const prevTemp = rawData[i-1].temp;
        const temp = rawData[i].temp;
        for (let ch=0; ch<this.ct.length; ch++) {
            // Calc derivative
            derivatives[ch] = -(rawData[i].v[ch] - rawData[i-1].v[ch])/(temp-prevTemp);
        }
      }
      this.meltCurve[i].d = derivatives;
      // console.log(this.meltCurve[i]);
    }
    // console.log(this.meltCurve.length);
    this.meltCurveIndex = toIndex;
    return updated;
  }
  _slopeToAmpFactor (slope) {
    return Math.pow(10, -1.0/slope);
  }
  _slopeToEfficiency (slope) {
    return (this._slopeToAmpFactor(slope) - 1) * 100.0;
  }
  calcStandardCurve () {
    this.standardCurves = [];
    if (!this.experiment.config.series_list) {
      console.log("NO SERIES");
      return;
    }
    for (let channel=0; channel<this.experiment.hardware.channels.count; channel++) {
      let channelCurves = [];
      this.experiment.config.series_list.forEach ((series, seriesIndex)=>{
        const startQuantity = (series.start_quantity > 0) ? series.start_quantity : 1; // User relative quantity if not specified
        const wells = series.wells.map((index)=>{ return this.experiment.config.wells[index] });
        const quantities = series.wells.map((index, i)=>{ 
          return series.start_quantity * Math.pow(series.factor, i);
        });
        const cts = series.wells.map((index)=>{ 
          return this.cts[channel][index];
        });
        const logQuantities = quantities.map(v=>Math.log10(v));
        const fit = Stat.linearLSM(logQuantities, cts);
        fit.quantities = quantities;
        fit.cts = cts;
        fit.channel = channel;
        fit.series = seriesIndex;
        fit.ampFactor = this._slopeToAmpFactor(fit.slope);
        fit.efficiency = this._slopeToEfficiency(fit.slope);
        channelCurves.push(fit);
      });
      this.standardCurves.push(channelCurves);
    }
  }
  calcQuantityes () {
    // TODO support external reference
    this.quantities = this.initChannelWellMatrix(0);
    for (let channel=0; channel<this.experiment.hardware.channels.count; channel++) {
      const curves = this.standardCurves[channel];
      if(!curves || curves.length == 0) return 
      const curve = curves[0];
      for (let wellIndex=0; wellIndex<this.experiment.hardware.wells.count; wellIndex++) {
        const well = this.experiment.config.wells[wellIndex];
        if (!well.is_in_series && well.type != "empty") {
          const ct = this.cts[channel][wellIndex];
          const quantity = this.calcQuantity(curve, ct);
          // console.log("Ch %d W %d FIT %f->%f", channel, wellIndex, ct, quantity);
          this.quantities[channel][wellIndex] = quantity;
        }
      }
      this.experiment.config.series_list.forEach ((series, seriesIndex)=>{
        const quantities = series.wells.map((wellIndex, i)=>{ 
          return this.quantities[channel][wellIndex] = series.start_quantity * Math.pow(series.factor, i);
        });
      });
    }
  }
  calcQuantity (standardCurve, ct) {
    if (!ct) {
      return 0;
    }
    return Math.pow(10, (ct - standardCurve.yIntercept) / standardCurve.slope);
  }
  getBaselines () {
    return this.baselines;
  }
  getThresholds () {
    return this.thresholds;
  }
  getCts () {
    return this.cts;
  }
  getMeltCurve () {
    return this.meltCurve;
  }
  analyze () {
    this.calcBaseline();
    this.calcCt();
    this.calcStandardCurve ();
    this.calcQuantityes();
    return { 
      "baseline": this.baselines,
      "threshold": this.thresholds,
      "ct": this.cts,
      "standard_curve": this.standardCurves,
      "quantity": this.quantities,
      "is_valid": true,
      "updated": new Date().getTime()
    };
  }
}
module.exports = OpticsAnalysis;