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
  },
  mounted: function () {
    let graph = new Graph(this.$refs.canvas);
    graph.setSeries(["Plate", "Lid"]);
    graph.setConversionFunction(
      (obj)=>{return { "x":obj.t/1000.0, "y":obj.v } }
    );
    graph.setMinMaxY(20, 120);
    this.graph = graph;
  },
  methods: {
    add: function(timestamp, well, lid) {
      this.graph.addData(0, {t:timestamp, v:well});
      this.graph.addData(1, {t:timestamp, v:lid});
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
        this.graph.addData(0, {t:time, v:well});
        this.graph.addData(1, {t:time, v:lid});
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