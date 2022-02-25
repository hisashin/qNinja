<template>
  <div class="temperature-chart">
    <div>
      <canvas class="temperature-chart__graph"
        ref="canvas"
        width="800"
        height="400"
        style="width:800px,height:400px"
      />
    </div>
    <b-button class="mr-1 btn-sm"
      @click.stop="head()">
      &lt;&lt;
    </b-button>
    <b-button class="mr-1 btn-sm"
      @click.stop="pan(-1)">
      &lt;
    </b-button>
    <b-button class="mr-1 btn-sm"
      @click.stop="zoom(-1)">
      -
    </b-button>
    <b-button class="mr-1 btn-sm"
      @click.stop="zoom(1)">
      +
    </b-button>
    <b-button class="mr-1 btn-sm"
      @click.stop="pan(1)">
      &gt;
    </b-button>
    <b-button class="mr-1 btn-sm"
      @click.stop="tail()">
      &gt;&gt;
    </b-button>
  </div>
</template>

<script>
import Graph from "../../lib/Graph.js";
const TIME_RANGES = [10000, 1000, 500, 250, 120, 60];
let TIME_RANGE_SEC = TIME_RANGES[3];

export default {
  data() {
    return {
      channelPlate: null,
      channelLid: null,
      zoomLevel: 3,
      timeOffset:0
    }
  },
  created: function () {
    this.channelPlate = null;
    this.channelLid = null;
    this.zoomLevel = 3;
    this.minTime = 0;
    this.maxTime = 120;
    this.timeOffset = 0;
  },
  mounted: function () {
    this.minTime = 0;
    this.maxTime = 120;
    this.timeOffset = 0;
    const CONVERSION_FUNCTION = (obj)=>{return { "x":obj.t/1000.0, "y":obj.v } };
    let graph = new Graph(this.$refs.canvas);
    this.channelPlate = graph.addChannel({index:0, label:"Plate"}).addSubChannel({type:"line"});
    this.channelLid = graph.addChannel({index:1, label:"Lid"}).addSubChannel({type:"line"});
    this.channelPlate.conversionFunction = CONVERSION_FUNCTION;
    this.channelLid.conversionFunction = CONVERSION_FUNCTION;
    graph.setMinMaxY(20, 120);
    this.graph = graph;
  },
  methods: {
    clear () {
      console.log("TODO TemperatureChart.clear()");
    },
    add: function(timestamp, plate, lid) {
      this.channelPlate.addData({t:timestamp, v:plate});
      this.channelLid.addData({t:timestamp, v:lid});
      this.maxTime = Math.max(this.maxTime, timestamp/1000);
      this.updateGraphRange();
      this.graph.update();
    },
    updateGraphRange: function () {
      const min = Math.floor(Math.min(this.timeOffset, Math.max(0, this.maxTime - TIME_RANGE_SEC)));
      const chartTimeRange = {
        min: min,
        max: Math.ceil(min + TIME_RANGE_SEC + 10)
      };
      this.graph.setMinMaxX(chartTimeRange.min, chartTimeRange.max);

    },
    set: function (timeSeries, plateSeries, lidSeries) {
      console.log("TemperatureChart.set");
    this.minTime = 0;
    this.maxTime = 120;
    this.timeOffset = 0;
      this.graph.clearData();
      for (let i=0; i<timeSeries.length; i++) {
        const time = timeSeries[i];
        const plate = plateSeries[i];
        const lid = lidSeries[i];
        if (time == null || plate == null || lid == null) {
          continue;
        }
        this.channelPlate.addData({t:time, v:plate});
        this.channelLid.addData({t:time, v:lid});
        this.maxTime = Math.max(this.maxTime, time/1000);
      }
      this.updateGraphRange();
      this.graph.update();
    },
    zoom: function (step) {
      this.zoomLevel = Math.min(Math.max(0, this.zoomLevel + step), TIME_RANGES.length - 1);
      TIME_RANGE_SEC = TIME_RANGES[this.zoomLevel];
      this.updateGraphRange();
      this.graph.update();
    },
    pan: function (step) {
      this.timeOffset = Math.max(0, this.timeOffset + step * TIME_RANGE_SEC);
      this.updateGraphRange();
      this.graph.update();
      
    },
    head: function () {
      this.timeOffset = 0;
      this.updateGraphRange();
      this.graph.update();
    },
    tail: function () {
      this.timeOffset = this.maxTime;
      this.updateGraphRange();
      this.graph.update();
    }
  }
}
</script>