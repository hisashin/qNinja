<template>
  <div class="">
    <div>
      <span>
        Device: {{ connectionStatus }}
      </span>
      <span>
        <template v-if="deviceState!=null">
          State={{ deviceState.label }}
        </template>
        <!-- Network -->
        <button
          v-show="!connected"
          
          class="btn btn-link"
          @click="reConnect"
        >
          Connect
        </button>
      </span>
    </div>
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
    onConnectionOpen: function () {
      console.log("TheDeviceSummary.onConnectionOpen");
      this.connected = true;
      this.connectionStatus = "Connected";
    },
    onConnectionClose: function () {
      console.log("TheDeviceSummary.onConnectionOpen");
      this.connected = false;
      this.connectionStatus = "Disconnected";
    
    },
    onDeviceStateChange: function (deviceState){
      this.deviceState = deviceState;
    }
  }
}
</script>