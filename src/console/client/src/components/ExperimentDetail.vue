<template>
  <div v-if="experiment!=null">
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Experiment Detail</h2>
      </header>
      <div class="section__body">
        <p class="item item--paragraph">
          ID={{experiment.id}}
        </p>
      </div>
    </section>
    <!-- Info section -->
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Summary</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <div>
              Name: <input
                v-model.number="experiment.info.name" type="text"
              >
            </div>
            <div>
              Comment: <input
                v-model.number="experiment.info.comment" type="text"
              >
            </div>
            <b-button
              pill
              @click="updateInfo"
            >
              Update
            </b-button>
            
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Protocol</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <ProtocolDetail ref="protocolDetail" />
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Plate layout</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <table class="tubes_layout">
              <tr v-for="(row, row_index) in tubes_layout" v-bind:key="row_index">
                <td v-for="(tube, tube_index) in row" v-bind:key="tube_index">
                  {{ tube.name }}
                </td>
              </tr>
            </table>
            
            <table class="tubes_conf">
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Quantity</th>
                <th>Label</th>
              </tr>
              <tr v-for="(item, index) in experiment.config.tubes" v-bind:key="index">
                <td>{{ item.id }}</td>
                <td>{{ item.name }}</td>
                <td>{{ item.type }}</td>
                <td>{{ item.quantity }}</td>
                <td>{{ item.label }}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </section>
    
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Log</h2>
      </header>
      <div class="section__body">
        <FluorescenceMonitor ref="fluorescenceMonitor" />
        <TemperatureMonitor ref="temperatureMonitor" />
        <MeltCurveMonitor ref="meltCurveMonitor" />
      </div>
    </section>
    
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
  name: 'ExperimentDetail',
  components:{
    ProtocolDetail,
    FluorescenceMonitor,
    TemperatureMonitor,
    MeltCurveMonitor
  },
  data() {
    return {
      experiment:{
        protocol:{}
      },
      device_conf:device.config,
      device_conf_raw:JSON.stringify(device.conf),
      tubes_layout:[[]]
    }
  },
  computed: {
  },
  created: function () {
  },
  methods: {
    updateTubesLayout: function () {
      const layout = device.conf.tubes.layout;
      this.tubes_layout = layout.map((row)=>{
        return row.map((tubeId)=>{
          let tube = this.experiment.analysis_config.tubes[tubeId];
          tube.name = device.conf.tubes.names[tubeId];
          return tube;
        });
      });
    },
    setExperiment: function (experiment) {
      console.log("ExperimentDetail.setExperiment");
      setTimeout(()=>{
        console.log("timeout.")
        this.$refs.protocolDetail.setProtocol(experiment.protocol);
        this.$refs.temperatureMonitor.set(experiment.log.temp.time, experiment.temp.well, experiment.log.temp.lid);
        this.$refs.fluorescenceMonitor.set(experiment.log.fluorescence.qpcr);
        }, 1000);
      this.experiment = experiment;
      this.updateTubesLayout();
    },
    updateInfo: function () {
      console.log(this.$data.experiment.id)
      console.log(this.$data.experiment.info)
      appState.submitUpdateExperimentProperty (this.$data.experiment.id, "info",
       this.$data.experiment.info, (resObj)=>{
        console.log(resObj)
       }, ()=>{});
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
