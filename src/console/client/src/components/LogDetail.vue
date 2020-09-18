<template>
  <div v-if="log!=null">
    <div class="card">
      <div class="card-header">
        Log Detail
      </div>
      <div class="p-3">
        {{log.id}}
      </div>
    </div>
    <h2>Analysis config</h2>
    <!-- mockup -->
    <section>
      <h3>Baseline</h3>
      <ul class="radio_list">
        <li class="radio_list__item"><input type="radio" name="baseline_alg" value="auto"/>Automatic</li>
        <li class="radio_list__item"><input type="radio" name="baseline_alg" value="manual_cycles" />
          Manual cycles
          <div>From <input type="number" step="1"/> - To <input type="number" step="1"/></div>
        </li>
        <li class="radio_list__item"><input type="radio" name="baseline_alg" value="manual_baseline" />Manual baseline</li>
      </ul>
    </section>
    <section>
      <h3>Threshold</h3>
      <ul class="radio_list">
        <li class="radio_list__item"><input type="radio" name="threshold_alg" value="auto"/>Automatic (By sigmoid fitting)</li>
        <li class="radio_list__item"><input type="radio" name="threshold_alg" value="amp"/>Amplification-based</li>
        <li class="radio_list__item"><input type="radio" name="threshold_alg" value="baseline"/>Baseline-based</li>
        <li class="radio_list__item"><input type="radio" name="threshold_alg" value="manual"/>Manual</li>
      </ul>
    </section>
    <section>
      <h3>Tubes</h3>
      <div>
        <table class="tubes_layout">
          <tr v-for="(row, row_index) in tubes_layout" v-bind:key="row_index">
            <td v-for="(tube, tube_index) in row" v-bind:key="tube_index">
              {{ tube.name }}
            </td>
          </tr>
        </table>
      </div>
      <div>
        {{ device_conf_raw }}
        <table class="tubes_conf">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Quantity</th>
            <th>Label</th>
          </tr>
          <tr v-for="(item, index) in log.analysis_config.tubes" v-bind:key="index">
            <td>{{ item.id }}</td>
            <td>{{ item.name }}</td>
            <td>{{ item.type }}</td>
            <td>{{ item.quantity }}</td>
            <td>{{ item.label }}</td>
          </tr>
        </table>
      </div>
    </section>
    <h2>(TODO) Protocol Detail</h2>
    <div>
      <ProtocolDetail ref="protocolDetail" />
    </div>
    <h2>qPCR Fluorescence Chart</h2>
    <div>
      <FluorescenceMonitor ref="fluorescenceMonitor" />
    </div>
    <h2>Temperature Chart</h2>
    <div>
      <TemperatureMonitor ref="temperatureMonitor" />
    </div>
    <h2>(TODO) Melt Curve Chart</h2>
    <div>
      <MeltCurveMonitor ref="meltCurveMonitor" />
    </div>
    <h2>(TODO) Standard Curve</h2>
    <h2> Ct</h2>
    <div>
    {{ log.ct }}
    </div>
  </div>
</template>

<script>
import device from "../lib/Device.js";
import appState from "../lib/AppState.js";

import ProtocolDetail from './ProtocolDetail.vue';
import TemperatureMonitor from './ExperimentMonitor/TemperatureMonitor.vue';
import FluorescenceMonitor from './ExperimentMonitor/FluorescenceMonitor.vue';
import MeltCurveMonitor from './ExperimentMonitor/MeltCurveMonitor.vue';

export default {
  name: 'LogDetail',
  components:{
    ProtocolDetail,
    FluorescenceMonitor,
    TemperatureMonitor,
    MeltCurveMonitor
  },
  data() {
    return {
      log:null,
      device_conf:device.config,
      device_conf_raw:JSON.stringify(device.config),
      tubes_layout:[[]]
    }
  },
  computed: {
  },
  created: function () {
  },
  methods: {
    updateTubesLayout: function () {
      const layout = device.config.tubes.layout;
      this.tubes_layout = layout.map((row)=>{
        return row.map((tubeId)=>{
          let tube = this.log.analysis_config.tubes[tubeId];
          tube.name = device.config.tubes.names[tubeId];
          return tube;
        });
      });
    },
    setLog: function (log) {
      console.log("setLog");
      console.log(this.$refs);
      setTimeout(()=>{
        this.$refs.temperatureMonitor.set(log.temp.time, log.temp.well, log.temp.lid);
        this.$refs.fluorescenceMonitor.set(log.fluorescence.qpcr);
        this.$refs.protocolDetail.setProtocol(log.protocol);
        }, 1000);
      this.log = log;
      // this.$refs.temperatureMonitor.set(log.temp.time, log.temp.well, log.temp.lid);
      this.updateTubesLayout();
      // this.$refs.meltCurveMonitor.set(this.log.melt_curve);
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
}
a {
  color: #42b983;
}
.radio_list {
  
}
.radio_list__item {
  display: block;
}
.tubes_layout, .tubes_conf {
  border-collapse: collapse;
}
.tubes_layout td, .tubes_conf td {
  border:1px solid #888;
  width:1.74em;
  height:1.74em;
  line-height:1.74em;
  text-align:center;
}
 {

}
</style>
