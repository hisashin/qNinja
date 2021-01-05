<template>
  <div>
    <h2>Recent protocols</h2>
    <ProtocolList :limit="2" ref="protocolList" :pagination="false" />
    <b-button @click="viewProtocolList">
      More
    </b-button>
    <h2>Recent experiments</h2>
    <ExperimentList :limit="3" ref="experimentList" :pagination="false" />
    <b-button @click="viewExperimentList">
      More
    </b-button>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import ProtocolList from '../ProtocolList.vue'
import ExperimentList from '../ExperimentList.vue'

export default {
  name: 'TheDashboard',
  components: {
    ProtocolList,
    ExperimentList
  },
  props: {
  },
  data() {
    return {
    }
  },
  created: function () {
  },
  methods: {
    viewProtocolList () {
      appState.pushPanel(appState.PANELS.PROTOCOL_LIST);
    },
    viewExperimentList () {
      appState.pushPanel(appState.PANELS.EXPERIMENT_LIST);
    },
    onAppear () {
      console.log("TheDashboard.onAppear()");
      this.$refs.protocolList.load();
      this.$refs.experimentList.load();
    }
  }
}
</script>