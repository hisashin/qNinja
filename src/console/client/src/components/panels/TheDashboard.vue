<template>
  <div class="panel">
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Recent Protocols</h2>
        <div class="section__header__menu"></div>
      </header>
      <ProtocolList :limit="2" ref="protocolList" :pagination="false" />
      <nav class="section__nav section__nav--bottom">
        <b-button @click="viewProtocolList">
          More
        </b-button>
      </nav>
    </section>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Recent Experiments</h2>
        <div class="section__header__menu"></div>
      </header>
      <ExperimentList :limit="3" ref="experimentList" :pagination="false" />
      <nav class="section__nav section__nav--bottom">
        <b-button @click="viewExperimentList">
          More
        </b-button>
      </nav>
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
      console.log("TheDashboard.onAppear()");
      this.$refs.protocolList.load();
      this.$refs.experimentList.load();
    }
  }
}
</script>