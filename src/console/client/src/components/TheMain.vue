<template>
  <div class="device-monitor">
    <DeviceSummary v-show="selectedPanel!=panels.EXPERIMENT_MONITOR"/>
    <div v-show="selectedPanel==panels.DASHBOARD">
      <TheDashboard ref="panelDashboard" />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_LIST">
      <BackButton />
      <TheProtocolList ref="panelProtocolList" />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_DETAIL">
      <BackButton />
      <TheProtocolDetail ref="panelProtocolDetail" />
    </div>
    <div v-show="selectedPanel==panels.LOG_LIST">
      <BackButton />
      <TheLogList ref="panelLogList" />
    </div>
    <div v-show="selectedPanel==panels.LOG_DETAIL">
      <BackButton />
      <TheLogDetail ref="panelLogDetail" />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_EDITOR">
      <BackButton />
      <TheProtocolEditor ref="panelProtocolEditor" />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_EDITOR">
      <BackButton />
      <TheExperimentEditor ref="panelExperimentEditor" />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_MONITOR">
      <BackButton />
      <TheExperimentMonitor ref="panelExperimentMonitor" />
    </div>
  </div>
</template>
<script>

import DeviceSummary from './DeviceSummary.vue'

import TheDashboard from './panels/TheDashboard.vue'
import TheExperimentEditor from './panels/TheExperimentEditor.vue'
import TheExperimentMonitor from './panels/TheExperimentMonitor.vue'
import TheLogDetail from './panels/TheLogDetail.vue'
import TheLogList from './panels/TheLogList.vue'
import TheProtocolDetail from './panels/TheProtocolDetail.vue'
import TheProtocolEditor from './panels/TheProtocolEditor.vue'
import TheProtocolList from './panels/TheProtocolList.vue'

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
    TheLogDetail,
    TheLogList,
    TheProtocolDetail,
    TheProtocolList,
    TheExperimentMonitor,
    TheExperimentEditor,
    TheProtocolEditor,
    DeviceSummary,
    BackButton
  },
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE,
      panels:appState.PANELS,
      selectedPanel:appState.PANELS.DASHBOARD
    }
  },
  created: function () {
    this.network = network;
    // appState.reloadProtocols();
    appState.reloadLogs();
    appState.setPanelContainer(this);
    // appState.addProtocolEventHandler(this);
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
    
  },
  mounted: function () {
    appState.setViews(this.$refs);
  
  },
  methods: {
    presentPanel(panel) {
      this.selectedPanel = panel;
    }
  }
}
</script>