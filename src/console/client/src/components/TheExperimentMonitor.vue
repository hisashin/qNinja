<template>
  <div class="">
    <ProgressMonitor />
    <div class="card p-3">
      <b-tabs content-class="mt-3">
        <b-tab title="Fluorescence">
          <p><FluorescenceMonitor /></p>
        </b-tab>
        <b-tab
          title="Temperature"
          active>
          <p><TemperatureMonitor /></p>
        </b-tab>
        <b-tab
          title="Protocol">
          <p><ProtocolDetail
            :id="id"
            :protocol="protocol" /></p>
        </b-tab>
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
  name: 'TheExperimentMonitor',
  components: {
    ProgressMonitor,
    FluorescenceMonitor,
    ProtocolDetail,
    TemperatureMonitor
  },
  props: {
  },
  data() {
    return {
      protocol:null,
      id:null
    };
  },
  created: function () {
    console.log("TheExperimentMonitor.created");
    appState.addProtocolEventHandler(this);
  },
  methods: {
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    }
  }
}
</script>