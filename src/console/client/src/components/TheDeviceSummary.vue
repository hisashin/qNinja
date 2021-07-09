<template>
  <div class="device-summary">
    <template v-if="connected && deviceState!=null && deviceState.hasExperiment">
      <!-- Progress summary -->
      <ProgressMonitor />
      <b-button pill variant="primary" @click="openExperimentMonitor">Open Experiment Monitor</b-button>
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
      deviceState: null
    }
  },
  created: function () {
    this.device = device;
    this.device.addConnectionEventHandler(this);
    this.deviceState = this.device.getDeviceState();
    this.connected = this.device.connected;
    this.device.addDeviceStateHandler(this);
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