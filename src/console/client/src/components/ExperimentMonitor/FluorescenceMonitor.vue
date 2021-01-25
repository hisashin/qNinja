<template>
  <div>
    <div style="width:400px,height:200px">
      <canvas
        ref="canvas"
        width="400"
        height="200"
        style="width:400px,height:200px"
      />
    </div>
    <ul>
      <li v-for="(channel, index) in channels"
        :key="index">
        {{ channel.label }} / {{ channel.fluorescence }}
      </li>
    </ul>
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../../lib/Device.js";
import Graph from "../../lib/Graph.js";

const TUBE_COUNT = 8;
const TIME_RANGE_SEC = 240;
let graph = null;

export default {
  data() {
    return {
      baseline:[],
      channels:[]
    }
  },
  created: function () {
    this.channels = [];
    for (let i=0; i<TUBE_COUNT; i++) {
      const obj = {
        label: "Well " + (i+1),
        fluorescence: 0,
        threshold: 0,
        amount: 0
      };
      this.channels.push(obj);
    }
  },
  mounted: function () {
    
    this.graph = new Graph(this.$refs.canvas);
    let labels = [];
    for (let i=0; i<TUBE_COUNT; i++) {
      labels.push("Well " + (i+1));
    }
    this.graph.addSeries(labels);
    this.graph.setConversionFunction(
      (obj) =>{return { "x":obj.c, "y":Math.log10(obj.v) }}
    );
    this.baseline = device.getBaseline();
    this.applyBaseline();
    this.graph.setMinMaxX(0, 50);
    this.graph.setMinMaxY(0, 5);
  },
  methods: {
    applyBaseline: function () {
      if (this.hasBaseline()) {
        this.graph.setHLines(this.baseline.thresholds);
      }
    },
    hasBaseline: function () {
      return this.baseline != null && this.baseline.thresholds != null;
    },
    setBaseline: function (data) {
      this.baseline = data;
      this.applyBaseline();
    },
    set: function (data) {
      this.graph.clearData();
      let lastRepeat = 0;
      data.forEach((measurement)=>{
        const repeat = measurement.repeat;
        if (repeat == lastRepeat) return;
        lastRepeat = repeat;
        for (let channel = 0; channel < measurement.v.length; channel++) {
          this.graph.addData(channel, {t:measurement.t, v:measurement.v[channel], c:measurement.repeat});
        
        }
      });
      this.graph.update();
    },
    add: function (data) {
      console.log(data);
      for (let i=0; i<TUBE_COUNT; i++) {
        this.graph.addData(i, {t:data.t, v:data.v[i], c:data.repeat});
        this.channels[i].fluorescence = data.v[i];
      }
      this.graph.update();
    
    }
  }
}
</script>

<style>
</style>