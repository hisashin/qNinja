"use strict";


const colors = [
  "rgba(253,64,132, 1)",
  "rgba(0,164,239, 1)",
  "rgba(106,180,62, 1)",
  "rgba(232,157,65, 1)",
  "rgba(115,92,176, 1)",
];
const createDataset = (channelIndex, name, showLine)=>{
  let color = colors[channelIndex%colors.length]
  return {
    showLine: showLine,
    label: name,
    fill:false,
    borderColor: color,
    pointColor: color,
    pointStrokeColor: "#fff",
    lineTension: 0.1,
    borderWidth: 1,
    data: [
    ]
  };
};
const createDotDataset = (channelIndex, x, y)=>{
  let color = colors[channelIndex%colors.length]
  return {
    showLine: false,
    fill:false,
    borderColor: color,
    pointColor: color,
    pointStrokeColor: color,
    pointRadius:3,
    lineTension: 0.1,
    borderWidth: 1,
    data: [{x:x,y:y}
    ]
  };
};

class Graph {
  constructor (canvas) {
    const ctx = canvas.getContext('2d');
    this.conversionFunction = null;
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
    this.data = [];
    this.autoMinMax = false;
  }
  setConversionFunction (f) {
    this.conversionFunction = f;
  }
  setAutoMinMax (conf) {
    this.autoMinMax = conf;
  }
  setSeries (series) {
    this.data = [];
    for (let i=0; i<series.length; i++) {
      this.chart.data.datasets[i] = createDataset(i, series[i], true);
      this.data.push([]);
    }
  }
  addData (index, data) {
    this.data[index].push(data);
  }
  setVisibility (index, visibility) {
    this.chart.data.datasets[index].hidden = !visibility;
  }
  setMinMaxX (min, max) {
    this.chart.options.scales.xAxes[0].ticks.min = min;
    this.chart.options.scales.xAxes[0].ticks.max = max;
  }
  setMinMaxY (min, max) {
    this.chart.options.scales.yAxes[0].ticks.min = min;
    this.chart.options.scales.yAxes[0].ticks.max = max;
  }
  setHLines (values) {
    this.hLines = values;
    for (let i=0; i<values.length; i++) {
      if (this.chart.data.datasets.length < this.data.length + i + 1) {
        this.chart.data.datasets[this.data.length + i] = createDataset(i, null, true);
      }
    }
  }
  clearHLines () {
    this.chart.data.datasets = this.chart.data.datasets.slice(0, this.data.length);
    console.log("clearHLines %d", this.chart.data.datasets.length);
  }
  addDot (channel, x, y) {
    this.chart.data.datasets.push(createDotDataset(channel, x, y));
  }
  clearData () {
    for (let i=0; i<this.data.length; i++) {
        this.data[i] = [];
    }
  }
  update () {
    let xMin = null;
    let xMax = null;
    let yMin = null;
    let yMax = null;
    for (let i=0; i<this.data.length; i++) {
      if (this.conversionFunction != null) {
        this.chart.data.datasets[i].data = this.data[i].map(this.conversionFunction);
      } else {
        this.chart.data.datasets[i].data = this.data[i];
      }
    }
    let a = 0;
    if (this.autoMinMax) {
      const dat = this.chart.data.datasets.slice(0, this.data.length);
      xMin = Math.min.apply(null, dat.map((series)=>{
        return Math.min.apply(null, series.data.map(data=>data.x));
      }));
      xMax = Math.max.apply(null, dat.map((series)=>{
        return Math.max.apply(null, series.data.map(data=>data.x));
      }));
      yMin = Math.min.apply(null, dat.map((series)=>{
        return Math.min.apply(null, series.data.map(data=>data.y));
      }));
      yMax = Math.max.apply(null, dat.map((series)=>{
        const m =  Math.max.apply(null, series.data.map(data=>data.y));
        a++;
        return m;
      }));
      this.chart.options.scales.xAxes[0].ticks.min = xMin;
      this.chart.options.scales.xAxes[0].ticks.max = xMax;
      this.chart.options.scales.yAxes[0].ticks.min = yMin;
      this.chart.options.scales.yAxes[0].ticks.max = yMax;
    }
    if (this.hLines) {
      for (let i=0; i<this.hLines.length; i++) {
        const index = this.data.length + i;
        this.chart.data.datasets[index].data = [
          {x:this.chart.options.scales.xAxes[0].ticks.min, y:this.hLines[i]},
          {x:this.chart.options.scales.xAxes[0].ticks.max, y:this.hLines[i]}
        ];
      }
    }
    this.chart.update();
  }
}
module.exports = Graph;