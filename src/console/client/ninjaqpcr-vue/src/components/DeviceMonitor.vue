<template>
  <div>
    <div v-show="selectedPanel==panels.DASHBOARD">
      <h1>Dashboard</h1>
      <ProtocolList />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_LIST">
      <div v-show="status==1" class="row">
        <ProtocolList />
      </div>
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_DETAIL">
      <ProtocolDetail />
    </div>
    <div v-show="selectedPanel==panels.PROTOCOL_EDITOR">
      <div v-show="status==1" class="row">
        <ProtocolEditor />
      </div>
    </div>
    <div v-show="selectedPanel==panels.EXPERIMENT_MONITOR">
      <div v-show="status==2" class="row">
        <DeviceStatus />
        <div class="col-12 mt-1">
          <div class="card p-3">
            <b-tabs content-class="mt-3">
              <b-tab title="Fluorescence"><p><FluorescenceMonitor /></p></b-tab>
              <b-tab title="Temperature" active><p><TemperatureMonitor /></p></b-tab>
            </b-tabs>
          </div>
        </div>
      </div>
      <div v-show="status==3" class="row">
        <div class="col-12 mt-3">
          <div class="card p-3">
            Complete!
          </div>
        </div>
      </div>
    </div>
    
    
  </div>
</template>
<script>
import ProtocolEditor from './ProtocolEditor.vue'
import ProtocolDetail from './ProtocolDetail.vue'
import DeviceStatus from './DeviceStatus.vue'
import TemperatureMonitor from './TemperatureMonitor.vue'
import FluorescenceMonitor from './FluorescenceMonitor.vue'
import ProtocolList from './ProtocolList.vue'
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";

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
    ProtocolEditor,
    ProtocolDetail,
    DeviceStatus,
    FluorescenceMonitor,
    TemperatureMonitor
  },
  methods: {
    presentPanel(panel) {
      this.selectedPanel = panel;
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