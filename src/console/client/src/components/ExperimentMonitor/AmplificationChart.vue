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
      Y-Axis
      <label>
        <input type="radio" v-model="yScale" value="linear" @change="onFilterChange()"/> Linear
      </label>
      <label>
        <input type="radio" v-model="yScale" value="log" @change="onFilterChange()"/> Log
      </label>
      <label>
        <input type="checkbox" v-model="baselineSubtraction" @change="onFilterChange()"/> Baseline subtraction
      </label>
    </div>
    <div class="chart-widget">
      <h3 class="chart-widget__title">Channels</h3>
      <span v-for="(channel, channelIndex) in channels" v-bind:key="channelIndex">
        <label><input type="checkbox" v-model="channel.visible" v-on:change="onFilterChange()" />
          Ch {{ channel.label }}
        </label>
      </span>
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
  </div>
</template>

<script>
const Chart = require('chart.js');
import device from "../../lib/Device.js";
import Graph from "../../lib/Graph.js";

const TIME_RANGE_SEC = 240;
let graph = null;

export default {
  data() {
    return {
      baseline:[],
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
      subChannelsPoints: [],
      subChannelsBaselines: [],
      subChannelsThresholds: [],
      baselineSubtraction: false,
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
      console.log("TODO AmplificationChart.clear()");
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
    setBaseline: function (data) {
      this.baseline = data;
      this.applyBaseline();
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
      this.subChannelsPoints = [];
      this.subChannelsBaselines = [];
      this.subChannelsThresholds = [];
      
      labels.forEach((label, i)=>{
        const channel = this.graph.addChannel({label:label, index:i});
        this.graphChannels.push(channel);
        this.subChannelsData.push(channel.addSubChannel({type:"line"}));
        this.subChannelsPoints.push(channel.addSubChannel({type:"dots"}));
        this.subChannelsBaselines.push(channel.addSubChannel({type:"hline"}));
        this.subChannelsThresholds.push(channel.addSubChannel({type:"hline"}));
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
      // Expects experiment.log.fluorescence.qpcr
      console.log("AmplificationChart.setData");
      this.graph.clearData();
      data.forEach((measurement)=>{
        this.eachSeries((c, w, i)=>{
          // GraphSubChannelXY.addData
          this.subChannelsData[i].addData({y:measurement.v[c][w].v, x:measurement.cycle});
        });
      });
      this.graph.update();
    },
    setAnalysis: function (analysis) {
      console.log("AplificationChart.setAnalysis");
      this.analysis = analysis;
      if (this.analysis.baseline && this.analysis.baseline.length > 0) {
        this._updateBaseline();
        this.graph.update();
      }
    },
    _updateBaseline: function () {
      if (this.analysis.baseline && this.analysis.baseline.length > 0) {
        this.eachSeries((c, w, i)=>{
          this.subChannelsBaselines[i].setValue(this.analysis.baseline[c][w]);
          this.subChannelsThresholds[i].setValue(this.analysis.threshold[c][w]);
        });
        this.eachSeries((c, w, i)=>{
          const y = this.analysis.threshold[c][w];
          const x = this.analysis.ct[c][w];
          this.subChannelsPoints[i].addData({y:y, x:x});
        });
      }
    },
    add: function (data) {
      this.eachSeries((c, w, i)=>{
        this.subChannelsPoints[i].addData({y:data.v[c][w], x:data.cycle});
      });
      this.graph.update();
    },
    onFilterChange: function() {
      this.repaint();
    },
    repaint: function () {
      // Apply appearance conf, filter and data updates
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
      this.eachSeries((c, w, i)=>{
        let f = null;
        if(this.baselineSubtraction) {
          const baseline = this.analysis.baseline[c][w];
          f = (v)=>{return {x:v.x, y: Math.max(1, v.y-baseline)}};
        }
        this.subChannelsData[i].conversionFunction = f;
        this.subChannelsPoints[i].conversionFunction = f;
        this.subChannelsBaselines[i].conversionFunction = f;
        this.subChannelsThresholds[i].conversionFunction = f;
      });
      this.graph.setScaleY((this.yScale == "log" ) ? Graph.Scale.Log : Graph.Scale.Linear);
      this._updateBaseline();
      this.graph.update();
    }
  }
}
</script>

<style>
</style>