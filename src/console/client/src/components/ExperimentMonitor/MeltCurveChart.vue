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
    <button
      class="ml-1 btn btn-link"
      @click.stop="showRaw">
      F vs. T
    </button>
    <button
      class="ml-1 btn btn-link"
      @click.stop="showDerivative">
      -dF/dT vs. T
    </button>
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../../lib/Device.js";
import Graph from "../../lib/Graph.js";

const TUBE_COUNT = 8;
const TIME_RANGE_SEC = 240;
let graph = null;

const CONVERSION_FUNC_RAW = (v)=>{return {x:v.t, y: v.f};};
const CONVERSION_FUNC_DERIVATIVE = (v)=>{return {x:v.t, y: v.d};};

let startTime = new Date();
export default {
  data() {
    return {
      measurements:[], // Real-time measurement
      wellsCount: 0,
      channels:[],
      channelsCount: 0,
      seriesList:[],
      wellTable:[],
      yScale:"linear",
      analysis:{},
      graphChannels: [],
      subChannelsData: [],
      appearanceConf: []
    }
  },
  created: function () {
    this.seriesList = [];
  },
  mounted: function () {
  },
  methods: {
    clear () {
      console.log("TODO MeltCurveChart.clear()");
    },
    // Well iterator
    eachSeries (func /* function(channel, well, dataIndex) */ ) {
      for (let c=0; c<this.channelsCount; c++) {
        for (let w=0; w<this.wellsCount; w++) {
          func(c, w, this._index(c, w));
        }
      }
    },
    eachWell (func) {
      this.wellTable.forEach((row)=>{
        row.forEach((well)=>{
          func(well);
        });
      });
    },
    _index: function (channelIndex, wellIndex) {
      return channelIndex * this.wellsCount + wellIndex;
    },
    setAppearanceConf: function (appearanceConf) {
      this.appearanceConf = appearanceConf;
    },
    setHardwareConf: function(hardware) {
      this.wellsCount = hardware.wells.count;
      this.channelsCount = hardware.channels.count;
      let labels = [];
      this.graph = new Graph(this.$refs.canvas);
      this.eachSeries((c, w, i)=>{
        labels[this._index(c, w)] = "W" + w + " / C" + c;
      });
      this.graphChannels = [];
      this.subChannelsData = [];
      
      labels.forEach((label, i)=>{
        const channel = this.graph.addChannel({label:label, index:i});
        this.graphChannels.push(channel);
        const subCh = channel.addSubChannel({type:"line"});
        subCh.conversionFunction = CONVERSION_FUNC_RAW;
        this.subChannelsData.push(subCh);
      });
      this.graph.setMinMaxX(0, 50);
      this.graph.setMinMaxY(0, 20);
      this.graph.setAutoMinMax(true);
      this.debug = JSON.stringify(hardware)
      this.channels = [];
      for (let i=0; i<this.channelsCount; i++) {
        const obj = {
          index:i,
          label:(i+1),
          visible:true
        };
        this.channels.push(obj);
      }
      let wellTable = [];
      hardware.wells.layout.forEach((row)=>{
        let vRow = [];
        row.forEach((col)=>{
          const name = hardware.wells.names[col];
          const obj = {index:col, name:name, visible:true};
          vRow.push(obj);
        });
        wellTable.push(vRow);
      });
      this.wellTable = wellTable;
    },
    setData: function (data) {
      // Expects experiment.log.fluorescence.melt_curve
      console.log("MeltCurveChart.setData");
      this.graph.clearData();
      
      // TODO set -dF/dT server-side
      if (data.length > 0) {
        for (let mIndex=0; mIndex<data.length-1; mIndex++) {
          this.eachSeries((c, w, i)=>{
            const m = data[mIndex];
            const mNext = data[mIndex+1];
            const meltData = {
              f:m.v[c][w].v, 
              d: (-mNext.v[c][w]+m.v[c][w])/(mNext.temp-m.temp), 
              t:m.temp}
            this.subChannelsData[i].addData(meltData);
          });
        }
      }
      this.graph.update();
    },
    setAnalysis: function (analysis) {
      this.analysis = analysis;
    },
    add: function (data) {
      this.graph.update();
    },
    onFilterChange: function() {
      this.repaint();
    },
    repaint: function () {
      const seriesCount = this.channelsCount * this.wellsCount;
      this.eachWell((well)=>{
        // well.index
        this.channels.forEach((channel)=>{
          const index = this._index(channel.index, well.index);
          this.graphChannels[index].setVisibility(well.visible && channel.visible);
          const appearance = this.appearanceConf[channel.index][well.index];
          this.graphChannels[index].setColor(appearance.c);
        });
      });
      /*
      this.eachSeries((c, w, i)=>{
        let f = null;
        this.subChannelsData[i].conversionFunction = f;
      });
      this.graph.setScaleY((this.yScale == "log" ) ? Graph.Scale.Log : Graph.Scale.Linear);
      */
      this.graph.update();
    },
    // Switch Y axis
    showRaw: function () {
      this.subChannelsData.forEach((ch)=>{
        ch.conversionFunction = CONVERSION_FUNC_RAW;
      });
      this.graph.update();
    },
    showDerivative: function () {
      this.subChannelsData.forEach((ch)=>{
        ch.conversionFunction = CONVERSION_FUNC_DERIVATIVE;
      });
      this.graph.update();
    }
  }
}
</script>

<style>
</style>