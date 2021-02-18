<template>
  <li
    class="item--list-card__cell item--list-card__cell--item"
    @click="revealDetail">
    <div class="protocol-cell-content">
      <div class="row">
        <div class="col-8 protocol-summary">
          <h3 class="protocol-summary__title">{{ protocol.name }}</h3>
          <ul class="protocol-summary__stages">
            <li class="protocol-summary__stages__stage"
              v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
              <span v-if="stage.type==1" class="protocol-summary__stages__stage__label">Hold</span>
              <span v-if="stage.type==2" class="protocol-summary__stages__stage__label">PCR</span>
              <span v-if="stage.type==3" class="protocol-summary__stages__stage__label">Melt Curve</span>
              <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex" class="protocol-summary__stages__stage__step">
                <span class="protocol-summary__stages__stage__step__temp">{{ step.temp }}℃</span>
                <span class="protocol-summary__stages__stage__step__duration">{{ step.duration }}sec</span>
              </span>
              <span v-if="stage.type==2" class="protocol-summary__stages__stage__cycle">x{{ stage.repeat }}</span>
            </li>
          </ul>
        </div>
        <div class="col-4 text-right">
          <b-button @click.stop="deleteIt">
            Delete
          </b-button>
          <b-button
            class="ml-1" @click.stop="edit">
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
import client from "../lib/RestClient.js";
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
      appState.draftExperimentWithProtocol(this.pid);
    },
    revealDetail: function() {
      console.log("revealDetail %s",this.pid)
      appState.revealDetailProtocol(this.pid);
    },
    edit: function() {
      console.log("ProtocolCell.edit");
      appState.startEditProtocol(this.pid);
    },
    deleteIt: function() {
      console.log("ProtocolCell.delete");
      client.submitDeleteProtocol(this.pid, ()=>{
        console.log("Deleted.");
      });
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