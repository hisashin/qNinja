<template>
  <div class="device-summary">
    <template v-if="connected && deviceState!=null && deviceState.hasExperiment">
      <!-- Progress summary -->
      <ProgressMonitor />
      <b-button pill variant="primary" @click="openExperimentMonitor">Open Experiment Monitor</b-button>
    </template>
    <template v-else>
      <div class="hidden-app progress-monitor">
        {{ connectionStatus }}
        Well {{ wellTemp }}℃
        Lid {{ lidTemp }}℃
      </div>
    </template>
  </div>
</template>

<script>
import device from "../lib/Device.js";
import appState from "../lib/AppState.js";
import ProgressMonitor from './ExperimentMonitor/ProgressMonitor.vue';
export default {
  components: {
    ProgressMonitor
  },
  data() {
    return {
      connected: false,
      deviceState: null,
      wellTemp: "-",
      lidTemp: "-"
    }
  },
  created: function () {
    this.device = device;
    this.device.addConnectionEventHandler(this);
    this.deviceState = this.device.getDeviceState();
    this.connected = this.device.connected;
    this.device.addDeviceStateHandler(this);
    device.subscribe("device.update.temperature", (topic, data)=>{
      this.wellTemp = data.plate.main.toFixed(1);
      this.lidTemp = data.lid.main.toFixed(1);
    });
  },
  methods: {
    start: function () {
    },
    openExperimentMonitor () {
    appState.pushPanel(appState.PANELS.EXPERIMENT_MONITOR);
    },
    onConnectionOpen: function () {
      this.connected = true;
      this.connectionStatus = "Connected";
    },
    onConnectionClose: function () {
      this.connected = false;
      this.connectionStatus = "Disconnected";
    
    },
    onDeviceStateChange: function (deviceState){
      this.deviceState = deviceState;
    }
  }
}
</script>