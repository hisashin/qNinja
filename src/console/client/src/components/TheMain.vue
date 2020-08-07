<template>
  <div class="device-monitor">
    <b-button @click="popToast">
      Toast Test
    </b-button>
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
        ref="protocolDetail" />
    </div>
    <div v-show="selectedPanel==panels.LOG_LIST">
      <BackButton />
      <LogList :limit="16" />
    </div>
    <div v-show="selectedPanel==panels.LOG_DETAIL">
      <BackButton />
      <LogDetail ref="logDetail" />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_EDITOR">
      <BackButton />
      <TheProtocolEditor ref="protocolEditor" />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_EDITOR">
      <BackButton />
      <TheExperimentEditor ref="experimentEditor" />
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_MONITOR">
      <BackButton />
      <TheExperimentMonitor ref="experimentMonitor" />
    </div>
  </div>
</template>
<script>
import TheExperimentMonitor from './TheExperimentMonitor.vue'
import DeviceSummary from './DeviceSummary.vue'
import TheProtocolEditor from './TheProtocolEditor.vue'
import TheExperimentEditor from './TheExperimentEditor.vue'
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
  name: 'TheMain',
  components: {
    ProtocolList,
    LogList,
    LogDetail,
    DeviceSummary,
    TheExperimentMonitor,
    TheExperimentEditor,
    TheProtocolEditor,
    ProtocolDetail,
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
      }
    });
    appState.views = this.$refs;
    
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
    popToast () {
      this.$bvToast.toast('This is a toast.', {
        title: 'Example',
        toaster: 'b-toaster-bottom-full'
      })
    
    }
  }
}
</script>