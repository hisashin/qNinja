<template>
  <div class="panel panel--dashboard">
    <div class="panel__menu">
    </div>
    <section class="section section--dashboard-protocols">
      <header class="section__header">
        <h2 class="section__title" >
          Recent Protocols
          <b-button @click="viewProtocolList" class="float-right" variant="outline-secondary" size="sm">
            More
          </b-button>
        </h2>
        <div class="section__header__menu"></div>
      </header>
      <ProtocolList :limit="2" ref="protocolList" :pagination="false" />
    </section>
    <section class="section section--dashboard-experiments">
      <header class="section__header">
        <h2 class="section__title list-header__title">
          Recent Experiments
          <b-button @click="viewExperimentList" class="float-right" variant="outline-secondary" size="sm">
            More
          </b-button>
        </h2>
        <div class="section__header__menu"></div>
      </header>
      <ExperimentList :limit="4" ref="experimentList" :pagination="false" />
    </section>
    <section class="debug">
      <b-button class="mr-1 btn-sm"
        @click.stop="optics">
        Optics
      </b-button>
      <b-button class="mr-1 btn-sm"
        @click.stop="plateControl">
        PlateControl
      </b-button>
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
    title () { return "Dashboard" },
    onAppear () {
      this.$refs.protocolList.load();
      this.$refs.experimentList.load();
    },
    optics () {
      appState.pushPanel(appState.PANELS.OPTICS_MONITOR);
    },
    plateControl () {
      appState.pushPanel(appState.PANELS.PLATE_CONTROL_MONITOR);
    }
  }
}
</script>