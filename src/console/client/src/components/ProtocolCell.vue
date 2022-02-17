<template>
  <li @click="revealDetail"
    class="list-card-cell list-card-cell--item"
    >
    <div class="protocol-summary">
      <div class="protocol-summary__view">
        <h3 class="protocol-summary__title">{{ protocol.name }}</h3>
        <ul class="protocol-summary__stages">
          <li class="protocol-summary__stage"
            v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
            <span v-if="stage.type==1" class="protocol-summary__stage-label">Hold</span>
            <span v-if="stage.type==2" class="protocol-summary__stage-label">PCR</span>
            <span v-if="stage.type==3" class="protocol-summary__stage-label">Melt Curve</span>
            <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex" class="protocol-summary__step">
              <span class="protocol-summary__step-temp">{{ step.temp }}℃</span>
              <span class="protocol-summary__step-duration">{{ step.duration }}s</span>
            </span>
            <span v-if="stage.type==2" class="protocol-summary__cycles">x{{ stage.cycles }}</span>
          </li>
        </ul>
      </div>
      <div class="protocol-summary__menu">
        <button @click.stop="deleteIt" class="btn btn-outline-danger btn-sm">
          Delete
        </button>
        <button
          @click.stop="edit" class="ml-1 btn btn-outline-secondary btn-sm">
          Edit
        </button>
        <button
          class="ml-1 btn btn-outline-primary btn-sm"
          v-bind:disabled="deviceState==null || !deviceState.startAvailable"
          @click.stop="run"
        >
          Run
        </button>
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
    device.deviceState.observe((state)=>{
      this.deviceState = state;
    });
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
      if (!window.confirm("Are you sure you want to delete this experiment log?")) {
        return;
      }
      client.submitDeleteProtocol(this.pid, ()=>{
        console.log("Deleted.");
      });
    },
    duplicate: function() {
      console.log("ProtocolCell.duplicate");
    }
  }
}
</script>