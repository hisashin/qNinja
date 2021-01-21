<template>
  <main class="main">
    <!-- Device monitor -->
    <div class="device-monitor">
      <DeviceSummary v-show="selectedPanel!=panels.EXPERIMENT_MONITOR"/>
    </div>
    <nav class="panel-nav">
      <BackButton v-show="backEnabled" />
    </nav>
    <!-- Panels -->
    <TheDashboard ref="panelDashboard" v-show="selectedPanel==panels.DASHBOARD" />
    <TheProtocolList ref="panelProtocolList" v-show="selectedPanel==panels.PROTOCOL_LIST" />
    <TheProtocolDetail ref="panelProtocolDetail" v-show="selectedPanel==panels.PROTOCOL_DETAIL" />
    <TheExperimentList ref="panelExperimentList" v-show="selectedPanel==panels.EXPERIMENT_LIST" />
    <!--<TheExperimentDetail ref="panelExperimentDetail" v-show="selectedPanel==panels.EXPERIMENT_DETAIL" />-->
    <TheProtocolEditor ref="panelProtocolEditor" v-show="selectedPanel==panels.PROTOCOL_EDITOR" />
    <TheExperimentEditor ref="panelExperimentEditor" v-show="selectedPanel==panels.EXPERIMENT_EDITOR" />
    <TheExperimentMonitor ref="panelExperimentMonitor" v-show="selectedPanel==panels.EXPERIMENT_MONITOR" />
    <PanelTemplate ref="panelTemplate" v-show="selectedPanel==panels.TEMPLATE" />
    <div>
    (Dev)
      <b-button
        @click.stop="showTemplate">
        Panel Template
      </b-button>
    </div>
  </main>
</template>
<script>

import DeviceSummary from './DeviceSummary.vue'

import TheDashboard from './panels/TheDashboard.vue'
import TheExperimentEditor from './panels/TheExperimentEditor.vue'
import TheExperimentMonitor from './panels/TheExperimentMonitor.vue'
// import TheExperimentDetail from './panels/TheExperimentDetail.vue'
import TheExperimentList from './panels/TheExperimentList.vue'
import TheProtocolDetail from './panels/TheProtocolDetail.vue'
import TheProtocolEditor from './panels/TheProtocolEditor.vue'
import TheProtocolList from './panels/TheProtocolList.vue'
import PanelTemplate from './panels/PanelTemplate.vue'

import BackButton from './BackButton.vue';

import network from "../lib/Device.js";
import appState from "../lib/AppState.js";

const DEVICE_STATUS_IDLE = 1;
const DEVICE_STATUS_RUNNING = 2;
const DEVICE_STATUS_FINISHED = 3;

export default {
  name: 'TheMain',
  components: {
  TheDashboard,
    //TheExperimentDetail,
    TheExperimentList,
    TheProtocolDetail,
    TheProtocolList,
    TheExperimentMonitor,
    TheExperimentEditor,
    TheProtocolEditor,
    PanelTemplate,
    DeviceSummary,
    BackButton
  },
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE,
      panels:appState.PANELS,
      selectedPanel:appState.PANELS.DASHBOARD,
      backEnabled: false
    }
  },
  created: function () {
    this.network = network;
    appState.setPanelContainer(this);
    this.network.addTransitionHandler({
      onStart: (obj)=>{
        console.log("Experiment started.");
        this.status = DEVICE_STATUS_RUNNING;
      },
      onComplete: (obj)=>{
        console.log("Experiment is complete!");
        this.status = DEVICE_STATUS_FINISHED;
      },
      onTransition:(obj)=>{
      }
    });
    appState.setNavigationHandler((panelStack)=>{
      this.backEnabled = (panelStack.length > 1);
    
    });
  },
  mounted: function () {
    appState.setViews(this.$refs);
  
  },
  methods: {
    presentPanel(panel) {
      this.selectedPanel = panel;
    },
    showTemplate () {
      appState.pushPanel(appState.PANELS.TEMPLATE);
      
    }
  }
}
</script>