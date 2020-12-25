<template>
  <li
    class="col-12 protocol-cell"
    @click="revealDetail">
    <div class="protocol-cell-content">
      <div class="row">
        <div class="col-12">
          <strong>{{ protocol.name }}</strong>
        </div>
        <ul class="col-9">
          <li
            v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
            <span v-if="stage.type==1">Hold</span>
            <span v-if="stage.type==2">PCR</span>
            <span v-if="stage.type==3">Melt Curve</span>
              
            <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex">
              {{ step.temp }}℃
              {{ step.duration }}sec
            </span>
            <span v-if="stage.type==2">x{{ stage.repeat }}</span>
          </li>
        </ul>
        <div class="col-3">
          <b-button @click.stop="edit">
            Edit
          </b-button>
          <b-button
            class="ml-1"
            v-bind:disabled="deviceState==null || !deviceState.startAvailable"
            @click.stop="run"
          >
            Run
          </b-button>
        </div>
      </div>
    </div>
  </li>
</template>
<script>
import appState from "../lib/AppState.js";
import device from "../lib/Device.js";
export default {
  name: 'ProtocolCell',
  props: {
    pid: { type:String },
    protocol: { type:Object }
  },
  data() {
    return {
    }
  },
  created: function () {
    this.deviceState = device.getDeviceState();
    device.addDeviceStateHandler(this);
  },
  methods: {
    run: function(id) {
      appState.prepareExperiment(this.pid);
    },
    revealDetail: function() {
      appState.revealDetailProtocol(this.pid);
    },
    edit: function() {
      console.log("ProtocolCell.edit");
      appState.startEditProtocol(this.pid);
    },
    delete: function() {
      console.log("ProtocolCell.delete");
      appState.deleteProtocol(this.pid);
    },
    duplicate: function() {
      console.log("ProtocolCell.duplicate");
    },
    onDeviceStateChange: function (deviceState) {
      this.deviceState = deviceState;
      console.log("DeviceState=" + JSON.stringify(this.deviceState));
    }
  }
}
</script>