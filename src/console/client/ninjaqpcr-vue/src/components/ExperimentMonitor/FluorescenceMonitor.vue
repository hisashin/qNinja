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
import Graph from "../../lib/Graph.js";

const TUBE_COUNT = 8;
const TIME_RANGE_SEC = 240;
let graph = null;

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
          graph.addData(i, {t:timestamp, v:data[i]});
        }
        const minTime = Math.max(0, timestamp/1000-TIME_RANGE_SEC);
        graph.setMinMaxX(minTime, minTime + TIME_RANGE_SEC + 10);
        graph.update();
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
    
    graph = new Graph('chartFluorescence');
    let labels = [];
    for (let i=0; i<TUBE_COUNT; i++) {
      labels.push("Well " + (i+1));
    }
    graph.addSeries(labels);
    graph.setConversionFunction(
      (obj) =>{return { "x":obj.t/1000.0, "y":obj.v }}
    );
    graph.setMinMaxY(0, 1);
  },
  methods: {
    onBaselineUpdate: function (data) {
      console.log("FluorescenceMonitor.onBaselineUpdate");
      this.baseline = data.baselines;
      graph.setHLines(data.thresholds);
    }
  }
}
</script>

<style>
</style>