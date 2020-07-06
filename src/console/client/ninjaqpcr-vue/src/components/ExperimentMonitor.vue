<template>
  <div class="">
    <ProgressMonitor />
    <div class="card p-3">
      <b-tabs content-class="mt-3">
        <b-tab title="Fluorescence"><p><FluorescenceMonitor /></p></b-tab>
        <b-tab title="Temperature" active><p><TemperatureMonitor /></p></b-tab>
        <b-tab title="Protocol" active><p><ProtocolDetail /></p></b-tab>
      </b-tabs>
    </div> 
  </div>
</template>
<script>
import device from "../lib/Device.js";
import appState from "../lib/AppState.js";
import ProtocolDetail from './ProtocolDetail.vue';
import ProgressMonitor from './ExperimentMonitor/ProgressMonitor.vue';
import TemperatureMonitor from './ExperimentMonitor/TemperatureMonitor.vue';
import FluorescenceMonitor from './ExperimentMonitor/FluorescenceMonitor.vue';
export default {
  name: 'ExperimentMonitor',
  data() {
    return {
      protocol:null,
      id:null
    }
  },
  props: {
  },
  methods: {
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    }
  },
  components: {
    ProgressMonitor,
    FluorescenceMonitor,
    ProtocolDetail,
    TemperatureMonitor
  },
  created: function () {
    console.log("ExperimentMonitor.created");
    appState.addProtocolEventHandler(this);
  }
}
</script>