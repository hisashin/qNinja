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
    data: [
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
    let options = {
    };
    this.chart = new Chart(ctx, {
      type: 'scatter',
      data: emptyData,
      options: {
        elements: {
            point:{ radius: 0 }
        },
        animation: false,
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
                    max: 115.0 //TODO
                }
            }]
        }
      }
    });
    this.data = [];
  }
  setConversionFunction (f) {
    this.conversionFunction = f;
  }
  addSeries (series) {
    for (let i=0; i<series.length; i++) {
      this.chart.data.datasets[i] = createDataset(i, series[i], true);
      this.data.push([]);
    }
  }
  addData (index, data) {
    this.data[index].push(data);
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
      if (this.chart.data.datasets.length < this.data.length + i+1) {
        this.chart.data.datasets[this.data.length + i] = createDataset(i, i, true);
      }
    }
  }
  clearData () {
    for (let i=0; i<this.data.length; i++) {
        this.data[i] = [];
    }
  }
  update () {
    for (let i=0; i<this.data.length; i++) {
      if (this.conversionFunction != null) {
        this.chart.data.datasets[i].data = this.data[i].map(this.conversionFunction);
      } else {
        this.chart.data.datasets[i].data = this.data[i];
      }
    }
    const xMin = this.chart.options.scales.xAxes[0].ticks.min;
    const xMax = this.chart.options.scales.xAxes[0].ticks.max;
    if (this.hLines) {
      for (let i=0; i<this.hLines.length; i++) {
        const index = this.data.length + i;
        this.chart.data.datasets[index].data = [
          {x:xMin, y:this.hLines[i]},
          {x:xMax, y:this.hLines[i]}
        ];
      }
    }
    console.log(this.chart.data)
    this.chart.update();
  }
}
module.exports = Graph;