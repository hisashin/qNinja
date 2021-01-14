<template>
  <div class="">
    <div class="card p-3">
      <p>Device: {{ connectionStatus }}</p>
      <div>
        <template v-if="deviceState!=null">
          DeviceState={{ deviceState.label }}
        </template>
        <!-- Network -->
        <b-button
          v-show="!connected"
          pill
          variant="primary"
          @click="reConnect"
        >
          Connect
        </b-button>
      </div>
    </div>
    <template v-if="deviceState!=null && deviceState.hasExperiment">
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
      connectionStatus: "Disconnected",
      deviceState: null
    }
  },
  created: function () {
    this.device = device;
    this.device.addConnectionEventHandler(this);
    this.deviceState = this.device.getDeviceState();
    this.device.addDeviceStateHandler(this);
  },
  methods: {
    reConnect: function () {
      console.log("reConnect");
      this.device.connect();
      
    },
    start: function () {
    },
    openExperimentMonitor () {
    appState.pushPanel(appState.PANELS.EXPERIMENT_MONITOR);
    },
    onOpen: function () {
      console.log("DeviceSummary.onOpen");
      this.connected = true;
      this.connectionStatus = "Connected";
    },
    onDeviceStateChange: function (deviceState){
      this.deviceState = deviceState;
    }
  }
}
</script>