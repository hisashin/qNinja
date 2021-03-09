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
      channelsCount:0,
      graphChannels: [],
      graphSubChannelsStandardCurve: [],
      graphSubChannelsStandardDots: [],
      graphSubChannelsStandardPlot: [],
      graphSubChannelsWells: []
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
      this.experiment = experiment;
      if (!experiment.analysis || !experiment.analysis.is_valid) {
        return;
      }
      this.channelsCount = experiment.hardware.channels.count;
      this.seriesCount = experiment.config.series_list.length;
      this.graph = new Graph(this.$refs.canvas);
      this.graph.setMinMaxX(0, 10);
      this.graph.setMinMaxY(0, 50);
      this.graphChannels = [];
      this.each ((channelIndex, seriesIndex, i)=>{
        const label = "Ch " + channelIndex + ", Series " + seriesIndex;
        const graphChannel = this.graph.addChannel({index:i, label: label});
        this.graphChannels.push(graphChannel);
        this.graphSubChannelsStandardCurve.push(graphChannel.addSubChannel({type:"line"}));
        this.graphSubChannelsStandardDots.push(graphChannel.addSubChannel({type:"dots"}));
        this.graphSubChannelsStandardPlot.push(graphChannel.addSubChannel({type:"dots"}));
      });
      this.each ((channelIndex, seriesIndex, i)=>{
        const curve = this.experiment.analysis.standard_curve[channelIndex][seriesIndex];
        const subChannel = this.graphSubChannelsStandardCurve[i];
        console.log(this.graphSubChannelsStandardCurve)
        subChannel.addData({ x:0, y:curve.yIntercept });
        subChannel.addData({ x:curve.xIntercept, y:0 });
        let dotsChannel = this.graphSubChannelsStandardPlot[i];
        for (let well = 0; well < curve.quantities.length; well++) {
          dotsChannel.addData({x:Math.log10(curve.quantities[well]), y:curve.cts[well]});
        }
        
      });
      this.experiment.config.wells.filter(well=>!well.is_in_series).forEach((well)=>{
        // Quantity
        // Ct
        for (let channel=0; channel<this.channelsCount; channel++) {
          const quantity = this.experiment.analysis.quantity[channel][well.id];
          const ct = this.experiment.analysis.ct[channel][well.id];
          // this.graph.addDot(0, Math.log10(quantity), ct);
          const subChannel = this.graph.addChannel({index:well.id}).addSubChannel({type:"dots"});
          subChannel.addData({x:Math.log10(quantity), y:ct});
          subChannel.data.pointRadius = 10;
          this.graphSubChannelsStandardCurve.push(subChannel);
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