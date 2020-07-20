<template>
  <div>
    <div>one-shot={{ oneShot }}</div>
    <div>continuous={{ continuous }}</div>
    <div>baseline={{ baselineExists }}</div>
    <div style="width:400px,height:200px">
      <canvas
        id="chartFluorescence"
        width="400"
        height="200"
        style="width:400px,height:200px"
      />
    </div>
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../../lib/Device.js";

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
const TUBE_COUNT = 8;
let fluorescence = [];
for (let i=0; i<TUBE_COUNT; i++) {
  fluorescence.push([]);
}

let startTime = new Date();
export default {
  data() {
    return {
      oneShot:false,
      continuous:false,
      baselineExists:false,
      baseline:[]
    }
  },
  created: function () {
    device.addTransitionHandler({
      onStart: (obj)=>{
        startTime = new Date();
      }
    });
  },
  mounted: function () {
    const handler = {
      onFluorescenceUpdate: (data)=>{
        let timestamp = new Date().getTime() - startTime.getTime();
        for (let i=0; i<TUBE_COUNT; i++) {
          fluorescence[i].push({t:timestamp, v:data[i]});
          fluorescenceChart.data.datasets[i].data = fluorescence[i].map(
            obj =>( { "x":obj.t/1000.0, "y":obj.v })
          );
        }
        fluorescenceChart.update();
      },
      onFluorescenceEvent: (data)=>{
        console.log("onFluorescenceEvent " + JSON.stringify(data));
        switch (data.type) {
          case "start":
          this.continuous = true;
          break;
          case "stop": 
          this.continuous = false;
          break;
          case "measure": 
          this.oneShot = true;
          setTimeout(()=>{this.oneShot = false}, 1000);
          break;
          case "baseline": 
          this.baselineExists = true;
          break;
          default:
          break;
        }
      }
    };
    device.addFluorescenceUpdateHandler(handler);
    device.addBaselineHandler(this);
    
    var fluorescenceChart = null;
    const createFluorescenceChart = () => {
      if (!document.getElementById('chartFluorescence')) {
        console.log("Canvas not found. return.");
        return;
      }
      const ctx = document.getElementById('chartFluorescence').getContext('2d');
      const data = {
        datasets: [
          /* createDataset() */
        ]
      };
      const options = {
      };
      fluorescenceChart = new Chart(ctx, {
        type: 'scatter',
        data: data,
        options: {
          animation: false,
          elements: {
              point:{ radius: 0 }
          },
          scales: {
              xAxes: [{
                  ticks: {
                      min: 0,
                      max:200
                  }
              }],
              yAxes: [{
                  ticks: {
                      min: 0,
                      max: 1.0
                  }
              }]
          }
        }
      });
      for (let i=0; i<8; i++) {
        fluorescenceChart.data.datasets[i] = createDataset(i, "Well " + i, true);
      }
    };
    createFluorescenceChart();
  },
  methods: {
    onBaselineUpdate: function (baseline) {
      console.log("FluorescenceMonitor.onBaselineUpdate");
      console.log(baseline);
      this.baseline = baseline;
      // TODO auto baseline fetch (on start)
    }
  }
}
</script>

<style>
</style>