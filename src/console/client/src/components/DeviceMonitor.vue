<template>
  <div class="device-monitor">
    <DeviceSummary v-show="selectedPanel!=panels.EXPERIMENT_MONITOR"/>
    <div v-show="selectedPanel==panels.DASHBOARD">
      <h2>Recent protocols</h2>
      <ProtocolList :limit="2" />
      <b-button @click="viewProtocolList">
        More
      </b-button>
      <h2>Recent experiments</h2>
      <LogList :limit="3" />
      <b-button @click="viewLogList">
        More
      </b-button>
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_LIST">
      <BackButton />
      <ProtocolList :limit="16" />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_DETAIL">
      <BackButton />
      <ProtocolDetail 
        :id="selectedProtocolId"
        :protocol="selectedProtocol"/>
    </div>
    <div v-show="selectedPanel==panels.LOG_LIST">
      <BackButton />
      <LogList :limit="16" />
    </div>
    <div v-show="selectedPanel==panels.LOG_DETAIL">
      <BackButton />
      <LogDetail />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_EDITOR">
      <BackButton />
      <ProtocolEditor />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_MONITOR">
      <BackButton />
      <ExperimentMonitor />
    </div>
  </div>
</template>
<script>
import ExperimentMonitor from './ExperimentMonitor.vue'
import DeviceSummary from './DeviceSummary.vue'
import ProtocolEditor from './ProtocolEditor.vue'
import ProtocolDetail from './ProtocolDetail.vue'
import ProtocolList from './ProtocolList.vue'
import LogList from './LogList.vue'
import LogDetail from './LogDetail.vue'
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";
import BackButton from './BackButton.vue';

const DEVICE_STATUS_IDLE = 1;
const DEVICE_STATUS_RUNNING = 2;
const DEVICE_STATUS_FINISHED = 3;

export default {
  name: 'DeviceMonitor',
  components: {
    ProtocolList,
    LogList,
    LogDetail,
    DeviceSummary,
    ExperimentMonitor,
    ProtocolEditor,
    ProtocolDetail,
    BackButton
  },
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE,
      panels:appState.PANELS,
      selectedPanel:appState.PANELS.DASHBOARD,
      selectedProtocolId:"",
      selectedProtocol:null
    }
  },
  created: function () {
    this.network = network;
    appState.reloadProtocols();
    appState.reloadLogs();
    appState.setPanelContainer(this);
    appState.addProtocolEventHandler(this);
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
        console.log(obj);
      }
    });
  },
  methods: {
    presentPanel(panel) {
      this.selectedPanel = panel;
    },
    viewProtocolList () {
      appState.pushPanel(this.panels.PROTOCOL_LIST);
    },
    viewLogList () {
      appState.pushPanel(this.panels.LOG_LIST);
    },
    onSelectProtocol (item) {
      this.selectedProtocol = item.protocol;
      this.selectedProtocolId = item.id;
      
    }
  }
}
</script>