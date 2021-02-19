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

const WELLS_COUNT = 8;
const CHANNELS_COUNT = 2;
const TIME_RANGE_SEC = 240;
let graph = null;

export default {
  data() {
    return {
      baseline:[],
      measurements:[], // Real-time measurement
      wellsCount: WELLS_COUNT,
      channelsCount: CHANNELS_COUNT
    }
  },
  created: function () {
    this.channels = [];
  },
  mounted: function () {
    
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
    // Well iterator
    eachWell (func /* function(channel, well, dataIndex) */ ) {
      for (let c=0; c<this.channelsCount; c++) {
        for (let w=0; w<this.wellsCount; w++) {
          func(c, w, this._index(c, w));
        }
      }
    
    },
    setBaseline: function (data) {
      this.baseline = data;
      this.applyBaseline();
    },
    _index: function (channelIndex, wellIndex) {
      return channelIndex * this.wellsCount + wellIndex;
    },
    setHardwareConf: function(hardware) {
      console.log("setHardwareConf")
      console.log(hardware)
      this.wellsCount = hardware.wells.count;
      this.channelsCount = hardware.channels.count;
      let labels = [];
      this.graph = new Graph(this.$refs.canvas);
      this.eachWell((c, w, i)=>{
        labels[this._index(c, w)] = "W" + w + " / C" + c;
      });
      this.graph.setSeries(labels);
      this.graph.setConversionFunction(
        (obj) =>{return { "x":obj.c, "y":Math.log10(obj.v) }}
      );
      this.applyBaseline();
      this.graph.setMinMaxX(0, 50);
      this.graph.setMinMaxY(0, 5);
    },
    setData: function (data) {
      // Expects experiment.log.fluorescence.qpcr
      this.graph.clearData();
      
      data.forEach((measurement)=>{
        this.eachWell((c, w, i)=>{
          this.graph.addData(i, {t:measurement.t, v:measurement.v[c][w], c:measurement.repeat});
        });
      });
      this.graph.update();
    },
    add: function (data) {
      /*
      // Real-time monitor
      for (let i=0; i<TUBE_COUNT; i++) {
        this.graph.addData(i, {t:data.t, v:data.v[i], c:data.repeat});
        this.channels[i].fluorescence = data.v[i];
      }
      */
      this.eachWell((c, w, i)=>{
        this.graph.addData(i, {t:data.t, v:data.v[c][w], c:data.repeat});
      });
      this.graph.update();
    
    }
  }
}
</script>

<style>
</style>