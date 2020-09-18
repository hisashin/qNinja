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
    graph.addSeries(["Well", "Lid"]);
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
      for (let i=0; i<timeSeries.length; i++) {
        this.graph.addData(0, {t:timeSeries[i], v:wellSeries[i]});
        this.graph.addData(1, {t:timeSeries[i], v:lidSeries[i]});
      }
      let minTime = timeSeries[0];
      this.graph.setMinMaxX(minTime, minTime + TIME_RANGE_SEC + 10);
      this.graph.update();
    }
  }
}
</script>