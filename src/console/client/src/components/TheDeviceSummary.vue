<template>
  <div class="device-summary">
    <template v-if="connectionStatus.connected && deviceState!=null && deviceState.hasExperiment">
      <!-- Progress summary -->
      <ProgressMonitor />
      <b-button pill variant="primary" @click="openExperimentMonitor">Open Experiment Monitor</b-button>
    </template>
    <template v-else>
      <div class="hidden-app progress-monitor">
        {{ connectionStatus.message }}
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
      connectionStatus: device.Connection.DISCONNECTED,
      deviceState: null,
      wellTemp: "-",
      lidTemp: "-"
    }
  },
  created: function () {
    device.connectionStatus.observe((status)=>{
      this.connectionStatus = status;
    });
    device.deviceState.observe((state)=>{
      this.deviceState = state;
    });
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
    }
  }
}
</script>