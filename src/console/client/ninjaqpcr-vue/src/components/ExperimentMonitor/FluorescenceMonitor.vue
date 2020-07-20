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
    <ul>
      <li v-for="(channel, index) in channels"
        :key="index">
        {{ channel.label }} / {{ channel.exceeded }} / {{ channel.fluorescence }}
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

let startTime = new Date();
export default {
  data() {
    return {
      oneShot:false,
      continuous:false,
      baselineExists:false,
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
        amount: 0,
        exceeded: false
      };
      this.channels.push(obj);
    }
    device.addTransitionHandler({
      onStart: (obj)=>{
        startTime = new Date();
      }
    });
  },
  mounted: function () {
    device.addFluorescenceUpdateHandler(this);
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
    this.baseline = device.getBaseline();
    this.applyBaseline();
    graph.setMinMaxY(0, 1);
  },
  methods: {
    applyBaseline () {
      if (this.hasBaseline()) {
        graph.setHLines(this.baseline.thresholds);
      }
    },
    hasBaseline () {
      return this.baseline != null && this.baseline.thresholds != null;
    },
    onBaselineUpdate: function (data) {
      this.baseline = data;
      this.applyBaseline();
    },
    onFluorescenceUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      for (let i=0; i<TUBE_COUNT; i++) {
        graph.addData(i, {t:timestamp, v:data[i]});
        this.channels[i].fluorescence = data[i];
      }
      if (this.hasBaseline()) {
        for (let i=0; i<TUBE_COUNT; i++) {
          this.channels[i].exceeded = this.channels[i].exceeded || (data[i] > this.baseline.thresholds[i]);
        }
      }
      const minTime = Math.max(0, timestamp/1000-TIME_RANGE_SEC);
      graph.setMinMaxX(minTime, minTime + TIME_RANGE_SEC + 10);
      graph.update();
    },
    onFluorescenceEvent (data) {
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
  }
}
</script>

<style>
</style>