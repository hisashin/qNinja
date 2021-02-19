<template>
  <div class="panel">
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >
          Recent Protocols
          <b-button @click="viewProtocolList" class="float-right">
            More
          </b-button>
        </h2>
        <div class="section__header__menu"></div>
      </header>
      <ProtocolList :limit="2" ref="protocolList" :pagination="false" />
    </section>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title">
          Recent Experiments
          <b-button @click="viewExperimentList" class="float-right">
            More
          </b-button>
        </h2>
        <div class="section__header__menu"></div>
      </header>
      <ExperimentList :limit="4" ref="experimentList" :pagination="false" />
    </section>
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
      this.$refs.protocolList.load();
      this.$refs.experimentList.load();
    }
  }
}
</script>