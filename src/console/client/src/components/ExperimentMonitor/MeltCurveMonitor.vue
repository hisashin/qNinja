<template>
  <div>
    <b-button
      class="ml-1"
      @click.stop="showRaw">
      F vs. T
    </b-button>
    <b-button
      class="ml-1"
      @click.stop="showDerivative">
      -dF/dT vs. T
    </b-button>
    <div style="width:400px,height:200px">
      <canvas
        ref="canvas"
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
    }
  },
  created: function () {
  },
  mounted: function () {
    this.graph = new Graph(this.$refs.canvas);
    this.maxD = 1.0;
    let labels = [];
    for (let i=0; i<TUBE_COUNT; i++) {
      labels.push("Well " + (i+1));
    }
    this.graph.addSeries(labels);
    this.graph.setConversionFunction(
      (obj) =>{return { "x":Math.log10(obj.t), "y":obj.v }}
    );
    this.graph.setMinMaxX(40, 100);
    this.graph.setMinMaxY(0, 1);
  },
  methods: {
    set: function (data) {
      this.graph.clearData();
      let maxD = 0;
      data.forEach ((item)=>{
        for (let i=0; i<TUBE_COUNT; i++) {
          if (item.d.length == TUBE_COUNT) {
            this.graph.addData(i, {t:item.temp, v:item.v[i], d:item.d[i]});
            maxD = Math.max(maxD , item.d[i]);
          }
        }
      });
      this.maxD  = maxD;
      this.graph.update();
    },
    add: function (timestamp, data) {
      // TODO real-time melt curve
    },
    showRaw: function () {
      this.graph.setConversionFunction(
        (obj) =>{return { "x":Math.log10(obj.t), "y":obj.v }}
      );
      this.graph.setMinMaxY(0, 5);
      this.graph.update();
    },
    showDerivative: function () {
      this.graph.setConversionFunction(
        (obj) =>{return { "x":obj.t, "y":obj.d }}
      );
      console.log("this.maxD = %f", this.maxD);
      this.graph.setMinMaxY(0, this.maxD * 1.2);
      this.graph.update();
    }
  }
}
</script>

<style>
</style>