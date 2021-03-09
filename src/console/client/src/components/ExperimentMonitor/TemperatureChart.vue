<template>
  <div style="width:400px,height:200px">
    <canvas
      ref="canvas"
      width="400"
      height="200"
      style="width:400px,height:200px"
    />
  </div>
</template>

<script>
import Graph from "../../lib/Graph.js";

const TIME_RANGE_SEC = 240;
export default {
  data() {
    return {
    }
  },
  created: function () {
    this.channelPlate = null;
    this.channelLid = null;
  },
  mounted: function () {
    const CONVERSION_FUNCTION = (obj)=>{return { "x":obj.t/1000.0, "y":obj.v } };
    let graph = new Graph(this.$refs.canvas);
    this.channelPlate = graph.addChannel({index:0, label:"Plate"}).addSubChannel({type:"line"});
    this.channelLid = graph.addChannel({index:1, label:"Lid"}).addSubChannel({type:"line"});
    this.channelPlate.conversionFunction = CONVERSION_FUNCTION;
    this.channelLid.conversionFunction = CONVERSION_FUNCTION;
    graph.setMinMaxY(20, 120);
    this.graph = graph;
  },
  methods: {
    add: function(timestamp, well, lid) {
      this.channelPlate.addData({t:timestamp, v:well});
      this.channelLid.addData({t:timestamp, v:lid});
      const minTime = Math.max(0, timestamp/1000-TIME_RANGE_SEC);
      this.graph.setMinMaxX(minTime, minTime + TIME_RANGE_SEC + 10);
      this.graph.update();
    },
    set: function (timeSeries, wellSeries, lidSeries) {
      this.graph.clearData();
      let maxTime = 0;
      for (let i=0; i<timeSeries.length; i++) {
        const time = timeSeries[i];
        const well = wellSeries[i];
        const lid = lidSeries[i];
        if (time == null || well == null || lid == null) {
          continue;
        }
        this.channelPlate.addData({t:time, v:well});
        this.channelLid.addData({t:time, v:lid});
        maxTime = Math.max(maxTime, time);
      }
      
      const minTime = 0;
      maxTime /= 1000;
      this.graph.setMinMaxX(minTime, /*minTime + TIME_RANGE_SEC*/ maxTime + 10);
      console.log("Update graph.");
      this.graph.update();
    }
  }
}
</script>