<template>
  <div style="width:400px,height:200px">
    <canvas
      id="chartTemperature"
      width="400"
      height="200"
      style="width:400px,height:200px"
    />
  </div>
</template>
<script>

const Chart = require('chart.js');
import network from "../../lib/Device.js";
let tempWell = [];
let tempLid = [];
let startTime = new Date();

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

export default {
  data() {
    return {
    }
  },
  created: function () {
    this.network = network;
    this.network.addTransitionHandler({
      onStart: (obj)=>{
        startTime = new Date();
      }
    });
  },
  mounted: function () {
    this.network = network;
    this.network.addProgressHandler({
      onProgress:(obj)=>{
        let timestamp = new Date().getTime() - startTime.getTime();
        tempWell.push({t:timestamp, v:obj.well});
        tempLid.push({t:timestamp, v:obj.lid});
        temperatureChart.data.datasets[0].data = tempWell.map(
          obj =>( { "x":obj.t/1000.0, "y":obj.v })
        );
        temperatureChart.data.datasets[1].data = tempLid.map(
          obj =>( { "x":obj.t/1000.0, "y":obj.v })
        );
        temperatureChart.update();
      }
    });
    

    var temperatureChart = null;
    const createTemperatureChart = () => {
      const ctx = document.getElementById('chartTemperature').getContext('2d');
      var data = {
        datasets: [
        ]
      };
      let options = {
      };
      temperatureChart = new Chart(ctx, {
        type: 'scatter',
        data: data,
        options: {
          elements: {
              point:{ radius: 0 }
          },
          animation: false,
          scales: {
              xAxes: [{
                  ticks: {
                      min: 0,
                      max:200
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
      temperatureChart.data.datasets[0] = createDataset(0, "Well", true);
      temperatureChart.data.datasets[1] = createDataset(1, "Lid", true);
    };
    createTemperatureChart();
  },
  methods: {
  }
}
</script>