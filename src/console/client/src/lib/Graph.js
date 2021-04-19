"use strict";


const colors = [
  "rgba(253,64,132, 1)",
  "rgba(0,164,239, 1)",
  "rgba(106,180,62, 1)",
  "rgba(232,157,65, 1)",
  "rgba(115,92,176, 1)",
];
const createDataset = (color, name, showLine)=>{
  return {
    showLine: showLine,
    label: name,
    fill:false,
    borderColor: color,
    /*borderDash: [5, 5],*/
    pointColor: color,
    pointStrokeColor: "#fff",
    lineTension: 0.1,
    borderWidth: 1,
    data: [
    ],
    rawData: []
  };
};
class GraphSubChannelXY {
  constructor (color, name, showLine) {
    this.data = createDataset(color, name, showLine);
  }
  addData(data) {
    this.data.rawData.push(data);
  }
  setData(data) {
    this.data.rawData = data;
  }
  setVisibility (visibility) {
    this.data.hidden = !visibility;
  }
  setColor (color) {
    this.data.borderColor = color;
  }
  clearData() {
    this.data.data = [];
    this.data.rawData = [];
  }
  range () {
    if (this.data.data.length == 0) return null;
    return {
      xMin: Math.min.apply(null, this.data.data.map(v=>v.x)),
      xMax: Math.max.apply(null, this.data.data.map(v=>v.x)),
      yMin: Math.min.apply(null, this.data.data.map(v=>v.y)),
      yMax: Math.max.apply(null, this.data.data.map(v=>v.y))
    };
  }
  applyRange (xMin, xMax, yMin, yMax) { /* Do nothing */ }
}
class GraphSubChannelHLine {
  constructor (color, name, showLine) {
    this.y = 0;
    this.data = createDataset(color, name, true);
    this.updateRawData();
  }
  
  setVisibility (visibility) {
    this.data.hidden = !visibility;
  }
  setColor (color) {
    this.data.borderColor = color;
  }
  updateRawData() {
    this.data.rawData = [
      {x:0, y:this.y},
      {x:1, y:this.y}
    ];
  }
  setValue (y) {
    this.y = y;
    this.updateRawData();
  }
  clearData() {}
  range () {
    return null;
  }
  applyRange (xMin, xMax, yMin, yMax) {
    this.data.data[0].x = xMin;
    this.data.data[1].x = xMax;
  }
}
class GraphSubChannelVLine {
  constructor (color, name, showLine) {
    this.x = 0;
    this.data = createDataset(color, name, true);
    this.updateRawData();
  }
  setVisibility (visibility) {
    this.data.hidden = !visibility;
  }
  setColor (color) {
    this.data.borderColor = color;
  }
  updateRawData() {
    this.data.rawData = [
      {x:this.x, y:0},
      {x:this.x, y:1}
    ];
  }
  setValue (x) {
    this.x = x;
    this.updateRawData();
  }
  clearData() {}
  range () {
    return null;
  }
  applyRange (xMin, xMax, yMin, yMax) {
    this.data.data[0].y = yMin;
    this.data.data[1].y = yMax;
  }
}
class GraphChannel {
  constructor (option) {
    this.index = option.index || 0;
    this.color = colors[this.index%colors.length]
    this.label = option.label;
    this.subChannels = [];
  }
  clearData () {
    this.subChannels.forEach((subChannel)=>{ subChannel.clearData();});
  }
  applyRange (xMin, xMax, yMin, yMax) {
    this.subChannels.forEach(c=>c.applyRange(xMin, xMax, yMin, yMax));
  }
  setVisibility (visibility) {
    this.subChannels.forEach((subChannel)=>{
      subChannel.setVisibility(visibility);
    });
  }
  setColor (color) {
    this.subChannels.forEach((subChannel)=>{
      subChannel.setColor(color);
    });
  }
  addDataTo (data, subChannelIndex) {
    this.subChannels[subChannelIndex].addData(data);
  }
  addSubChannel (option) {
    const label = "LABEL";
    let subChannel = null;
    if (option.type == "hline") {
      subChannel = new GraphSubChannelHLine(this.color, null, false);
    } else if (option.type == "vline") {
      subChannel = new GraphSubChannelVLine(this.color, null, false);
    } else if (option.type == "dots") {
      subChannel = new GraphSubChannelXY(this.color, null, false);
      subChannel.data.pointRadius = 3;
      subChannel.data.pointFillColor = this.color;
    } else {
      subChannel = new GraphSubChannelXY(this.color, null, true);
    }
    subChannel.type = option.type
    this.subChannels.push(subChannel);
    return subChannel;
  }
  range () {
    let subRanges = this.subChannels.map(s=>s.range()).filter(r=>(r!=null));
    return {
      xMin: Math.min.apply(null, subRanges.map(r=>r.xMin)),
      xMax: Math.max.apply(null, subRanges.map(r=>r.xMax)),
      yMin: Math.min.apply(null, subRanges.map(r=>r.yMin)),
      yMax: Math.max.apply(null, subRanges.map(r=>r.yMax))
    };
  }
  
}

class Graph {
  constructor (canvas) {
    const ctx = canvas.getContext('2d');
    this.conversionFunction = null;
    this.channels = [];
    
    this.hLines = [];
    
    const emptyData = {
      datasets: [
      ]
    };
    
    this.chart = new Chart(ctx, {
      type: 'scatter',
      data: emptyData,
      options: {
        elements: {
            point:{ radius: 0 }
        },
        animation: false,
        legend: {
          display:false
        },
        scales: {
            xAxes: [{
                ticks: {
                    min: 0,
                    max:100
                }
            }],
            yAxes: [{
                ticks: {
                    min: 20,
                    max: 115.0
                }
            }]
        }
      }
    });
    // this.data = [];
    this.autoMinMax = false;
  }
  setConversionFunction (f) {
    this.conversionFunction = f;
  }
  setAutoMinMax (conf) {
    this.autoMinMax = conf;
  }
  setSeries (series) { // Deprecate it.
    this.data = [];
    for (let i=0; i<series.length; i++) {
      const channel = this.addChannel({label:series[i], index: i});
      channel.addSubChannel({type:"line"});
    }
  }
  addChannel (option) {
    const channel = new GraphChannel({ index: option.index, label: option.label });
    this.channels.push(channel);
    return channel;
  }
  addData (channel, data, subChannelIndex) {
    if (!subChannelIndex) subChannelIndex = 0; // Default
    this.channels[channel].addDataTo(data, subChannelIndex);
  }
  setVisibility (index, visibility) {
    if (this.channels[index]) {
      this.channels[index].setVisibility(visibility);
      
    }
  }
  setMinMaxX (min, max) {
    this.chart.options.scales.xAxes[0].ticks.min = min;
    this.chart.options.scales.xAxes[0].ticks.max = max;
  }
  setMinMaxY (min, max) {
    this.chart.options.scales.yAxes[0].ticks.min = min;
    this.chart.options.scales.yAxes[0].ticks.max = max;
  }
  addDot (channel, x, y) {
  }
  clearData () {
    this.channels.forEach((channel)=>{ channel.clearData() });
  }
  update () {
    let xMin = null;
    let xMax = null;
    let yMin = null;
    let yMax = null;
    // TODO: define data conversion function and axis mapping function separately
    this.chart.data.datasets = [];
    
    // Raw data -> Data to show
    this.channels.forEach((channel)=>{
      channel.subChannels.forEach((subChannel, subChannelIndex)=>{
        if (subChannel.conversionFunction != null) {
          subChannel.data.data = subChannel.data.rawData.map(subChannel.conversionFunction);
        } else {
          subChannel.data.data = subChannel.data.rawData;
        }
      });
    });
    let a = 0;
    if (this.autoMinMax) {
      const dat = this.chart.data.datasets;
      const ranges = this.channels.map(channel=>channel.range());
      xMin = Math.min.apply(null, ranges.map(range=>range.xMin));
      xMax = Math.max.apply(null, ranges.map(range=>range.xMax));
      yMin = Math.min.apply(null, ranges.map(range=>range.yMin));
      yMax = Math.max.apply(null, ranges.map(range=>range.yMax));
      
      this.chart.options.scales.xAxes[0].ticks.min = xMin;
      this.chart.options.scales.xAxes[0].ticks.max = xMax;
      this.chart.options.scales.yAxes[0].ticks.min = yMin;
      this.chart.options.scales.yAxes[0].ticks.max = yMax;
      
    }
    this.channels.forEach((channel)=>{ channel.applyRange(xMin, xMax, yMin, yMax) });
    // Set data
    this.channels.forEach((channel)=>{
      channel.subChannels.forEach((subChannel, subChannelIndex)=>{
        this.chart.data.datasets.push(subChannel.data);
      });
    });
    this.chart.update();
  }
  setScaleX (scale) {
    if (scale == Graph.Scale.Log) {
      this.chart.options.scales.xAxes[0].type = "logarithmic";
    } else {
      delete this.chart.options.scales.xAxes[0].type;
    }
  }
  setScaleY (scale) {
    if (scale == Graph.Scale.Log) {
      this.chart.options.scales.yAxes[0].type = "logarithmic";
    } else {
      delete this.chart.options.scales.yAxes[0].type;
    }
  }
}
Graph.Scale = {
  Linear: 0, // Default
  Log: 1
};
module.exports = Graph;