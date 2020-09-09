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
        <li class="radio_list__item"><input type="radio" name="baseline_alg" value="manual_cycles" />Manual cycles</li>
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
          <tr>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
          </tr>
          <tr>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
            <td>S</td>
          </tr>
        </table>
      </div>
      <div>
        <table class="tubes_conf">
          <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Quantity</th>
            <th>Label</th>
          </tr>
          <tr v-for="(item, index) in tubes" v-bind:key="index">
            <td>{{ item.id }}</td>
            <td>
              <select>
                <option>----</option>
                <option>Standard</option>
                <option>Negative control</option>
                <option>Unknown sample</option>
                <option>Empty</option>
              </select>
            </td>
            <td>
              <input type="text" disabled="true" />
            </td>
            <td>
              <input type="text" />
            </td>
          </tr>
        </table>
      </div>
    </section>
    <h2>(TODO) Protocol Detail</h2>
    <h2>(TODO) Temperature Chart</h2>
    <h2>(TODO) qPCR Fluorescence Chart</h2>
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
  /*
    ProtocolDetail,
    TemperatureMonitor,
    FluorescenceMonitor,
    */
    MeltCurveMonitor
  },
  data() {
    return {
      log:{},
      tubes: [
        {id:0},
        {id:1},
        {id:2},
        {id:3},
        {id:4},
        {id:5},
        {id:6},
        {id:7},
        {id:0},
        {id:1},
        {id:2},
        {id:3},
        {id:4},
        {id:5},
        {id:6},
        {id:7}
      ]
    }
  },
  created: function () {
  },
  methods: {
    setLog: function (log) {
      this.log = log;
      this.$refs.meltCurveMonitor.set(this.log.melt_curve);
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
