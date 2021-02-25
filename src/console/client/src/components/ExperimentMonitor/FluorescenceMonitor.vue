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
    <div class="chart-widget">
      <h3 class="chart-widget__title">Channels</h3>
      <div v-for="(channel, channelIndex) in channels" v-bind:key="channelIndex">
        <label><input type="checkbox" v-model="channel.visible" v-on:change="onFilterChange()" />
          Ch {{ channel.label }}
        </label>
      </div>
    </div>
    <div class="chart-widget">
      <h3 class="chart-widget__title">Wells</h3>
      <table>
        <tr v-for="(wellRow, rowIndex) in wellTable" v-bind:key="rowIndex">
          <td v-for="(well, wellIndex) in wellRow" v-bind:key="wellIndex">
            <label><input type="checkbox" v-model="well.visible" v-on:change="onFilterChange()" />
              {{ well.name }}
            </label>
          </td>
        </tr>
      </table>
    </div>
    Y-Axis
    <label>
      <input type="radio" v-model="yScale" value="linear" @change="onFilterChange()"/> Linear
    </label>
    <label>
      <input type="radio" v-model="yScale" value="log" @change="onFilterChange()"/> Log
    </label>
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../../lib/Device.js";
import Graph from "../../lib/Graph.js";

const WELLS_COUNT = 8;
const CHANNELS_COUNT = 2;
const TIME_RANGE_SEC = 240;
const CONVERSION_FUNC_LINEAR = (obj) =>{return { "x":obj.c, "y":obj.v }};
const CONVERSION_FUNC_LOG = (obj) =>{return { "x":obj.c, "y": Math.log10(obj.v) }};
let graph = null;

export default {
  data() {
    return {
      baseline:[],
      measurements:[], // Real-time measurement
      wellsCount: WELLS_COUNT,
      channels:[],
      channelsCount: CHANNELS_COUNT,
      debug: "DEBUGDEBUG",
      seriesList:[],
      wellTable:[],
      yScale:"linear",
      analysis:{}
    }
  },
  created: function () {
    this.seriesList = [];
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
      const f = this.yScale == "log" ? CONVERSION_FUNC_LOG : CONVERSION_FUNC_LINEAR;
      this.graph.setConversionFunction(f);
      this.eachSeries((c, w, i)=>{
        labels[this._index(c, w)] = "W" + w + " / C" + c;
      });
      this.graph.setSeries(labels);
      this.applyBaseline();
      this.graph.setMinMaxX(0, 50);
      this.graph.setMinMaxY(0, 20);
      this.graph.setAutoMinMax(true);
      this.debug = JSON.stringify(hardware)
      // Wells table
      // Channel list
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
      // Expects experiment.log.fluorescence.qpcr
      this.graph.clearData();
      data.forEach((measurement)=>{
        this.eachSeries((c, w, i)=>{
          this.graph.addData(i, {t:measurement.t, v:measurement.v[c][w], c:measurement.repeat});
        });
      });
      this.graph.update();
    },
    setAnalysis: function (analysis) {
      this.analysis = analysis;
      if (this.analysis.baseline && this.analysis.baseline.length > 0) {
        this.updateBaseline();
        this.graph.update();
      }
    },
    updateBaseline: function () {
      this.graph.clearHLines();
      if (this.analysis.baseline && this.analysis.baseline.length > 0) {
        let baselines = [];
        this.eachSeries((c, w, i)=>{
          baselines.push(this.analysis.baseline[c][w]);
          baselines.push(this.analysis.threshold[c][w]);
        });
        if (this.yScale == "log") {
          baselines = baselines.map(v=>Math.log10(v));
        }
        console.log("BaselineCount=%d", baselines.length);
        this.graph.setHLines(baselines);
        this.eachSeries((c, w, i)=>{
          const y = this.analysis.threshold[c][w];
          const x = this.analysis.ct[c][w];
          if (this.yScale == "log") {
            this.graph.addDot(i, x, Math.log10(y));
          } else {
            this.graph.addDot(i, x, y);
          }
        });
      }
    },
    add: function (data) {
      this.eachSeries((c, w, i)=>{
        this.graph.addData(i, {t:data.t, v:data.v[c][w], c:data.repeat});
      });
      this.graph.update();
    },
    onFilterChange: function() {
      const seriesCount = this.channelsCount * this.wellsCount;
      this.eachWell((well)=>{
        // well.index
        this.channels.forEach((channel)=>{
          const index = this._index(channel.index, well.index);
          this.graph.setVisibility(index, well.visible && channel.visible);
          if (this.analysis.baseline && this.analysis.baseline.length > 0) {
            this.graph.setVisibility(seriesCount + index, well.visible && channel.visible);
            this.graph.setVisibility(seriesCount*2 + index, well.visible && channel.visible);
          }
        });
      });
      const f = this.yScale == "log" ? CONVERSION_FUNC_LOG : CONVERSION_FUNC_LINEAR;
      this.graph.setConversionFunction(f);
      this.updateBaseline();
      this.graph.update();
    }
  }
}
</script>

<style>
</style>