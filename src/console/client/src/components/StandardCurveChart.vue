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
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../lib/Device.js";
import Graph from "../lib/Graph.js";

let graph = null;

let startTime = new Date();
export default {
  data() {
    return {
      experiment:{},
      seriesCount:0,
      channelsCount:0
    }
  },
  created: function () {
  },
  mounted: function () {
    this.graph = new Graph(this.$refs.canvas);
    this.graph.setMinMaxX(0, 10);
    this.graph.setMinMaxY(0, 50);
  },
  methods: {
    setExperiment: function (experiment) {
      console.log("setExperiment");
      this.experiment = experiment;
      this.channelsCount = experiment.hardware.channels.count;
      this.seriesCount = experiment.config.series_list.length;
      this.graph.clearData();
      let labels = [];
      this.each ((channelIndex, seriesIndex, i)=>{
        labels.push("%d %d", seriesIndex, channelIndex);
      });
      console.log("Label", labels);
      
      this.graph.setSeries(labels);
      this.each ((channelIndex, seriesIndex, i)=>{
        const curve = this.experiment.analysis.standard_curve[channelIndex][seriesIndex];
        this.graph.addData(i, { x:0, y:curve.yIntercept });
        this.graph.addData(i, { x:curve.xIntercept, y:0 });
        for (let well = 0; well < curve.quantities.length; well++) {
          this.graph.addDot(i, Math.log10(curve.quantities[well]), curve.cts[well])
          console.log({x: Math.log10(curve.quantities[well]), y:curve.cts[well]});
        }
      });
      this.experiment.config.wells.filter(well=>!well.is_in_series).forEach((well)=>{
        console.log("WellIndex %d", well.id);
        // Quantity
        // Ct
        for (let channel=0; channel<this.channelsCount; channel++) {
          const quantity = this.experiment.analysis.quantity[channel][well.id];
          const ct = this.experiment.analysis.ct[channel][well.id];
          this.graph.addDot(0, Math.log10(quantity), ct);
        }
      });
      this.graph.update();
    },
    
    _index: function (channelIndex, seriesIndex) {
      return channelIndex * this.seriesCount + seriesIndex;
    },
    
    each (func) {
      if (!this.experiment.analysis.standard_curve) {
        return;
      }
      this.experiment.analysis.standard_curve.forEach((channel, channelIndex)=>{
        channel.forEach((series, seriesIndex)=>{
          func(channelIndex, seriesIndex, this._index(channelIndex, seriesIndex));
        })
      });
    }
  }
}
</script>

<style>
</style>