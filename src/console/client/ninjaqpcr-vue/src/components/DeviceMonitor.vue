<template>
  <div class="device-monitor">
    <div v-show="selectedPanel==panels.DASHBOARD">
      <h2>Recent protocols</h2>
      <ProtocolList :limit="2"/>
      <b-button v-on:click="viewProtocolList">More</b-button>
      <h2>Recent experiments</h2>
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_LIST">
      <BackButton />
      <ProtocolList :limit="16"/>
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_DETAIL">
      <BackButton />
      <ProtocolDetail />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_EDITOR">
      <BackButton />
      <ProtocolEditor />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_MONITOR">
      <ExperimentMonitor />
    </div>
  </div>
</template>
<script>
import ExperimentMonitor from './ExperimentMonitor.vue'
import ProtocolEditor from './ProtocolEditor.vue'
import ProtocolDetail from './ProtocolDetail.vue'
import ProtocolList from './ProtocolList.vue'
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";
import BackButton from './BackButton.vue';

const DEVICE_STATUS_IDLE = 1;
const DEVICE_STATUS_RUNNING = 2;
const DEVICE_STATUS_FINISHED = 3;

export default {
  name: 'DeviceMonitor',
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE,
      panels:appState.PANELS,
      selectedPanel:appState.PANELS.DASHBOARD
    }
  },
  components: {
    ProtocolList,
    ExperimentMonitor,
    ProtocolEditor,
    ProtocolDetail,
    BackButton
  },
  methods: {
    presentPanel(panel) {
      this.selectedPanel = panel;
    },
    viewProtocolList () {
      console.log("viewProtocolList");
      appState.pushPanel(this.panels.PROTOCOL_LIST);
    }
  },
  created: function () {
    this.network = network;
    appState.reloadProtocols();
    appState.setPanelContainer(this);
    this.network.addTransitionHandler({
      onStart: (obj)=>{
        console.log("Experiment started.");
        this.status = DEVICE_STATUS_RUNNING;
      },
      onFinish: (obj)=>{
        console.log("Experiment finished.");
        this.status = DEVICE_STATUS_FINISHED;
      },
      onTransition:(obj)=>{
        console.log(obj);
      }
    });
  }
}
</script>