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

const TIME_RANGE_SEC = 240;
class Graph {
  constructor (container) {
    const ctx = document.getElementById(container).getContext('2d');
    this.conversionFunction = null;
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
  update () {
    for (let i=0; i<this.data.length; i++) {
      if (this.conversionFunction != null) {
        this.chart.data.datasets[i].data = this.data[i].map(this.conversionFunction);
      } else {
        this.chart.data.datasets[i].data = this.data[i];
      }
    }
    this.chart.update();
  }
}
module.exports = Graph;