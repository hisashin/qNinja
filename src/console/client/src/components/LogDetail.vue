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
    <h2>(TODO) Experiment Summary</h2>
    <h2>(TODO) Protocol Detail</h2>
    <h2>(TODO) Tube Config</h2>
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
      log:{}
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
</style>
