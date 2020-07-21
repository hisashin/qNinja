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
import Graph from "../../lib/Graph.js";
let startTime = new Date();

const TIME_RANGE_SEC = 240;
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
        graph.addData(0, {t:timestamp, v:obj.well});
        graph.addData(1, {t:timestamp, v:obj.lid});
        const minTime = Math.max(0, timestamp/1000-TIME_RANGE_SEC);
        graph.setMinMaxX(minTime, minTime + TIME_RANGE_SEC + 10);
        graph.update();
      }
    });
    
    let graph = new Graph('chartTemperature');
    graph.addSeries(["Well", "Lid"]);
    graph.setConversionFunction(
      (obj)=>{return { "x":obj.t/1000.0, "y":obj.v } }
    );
    graph.setMinMaxY(20, 120);
  },
  methods: {
  }
}
</script>