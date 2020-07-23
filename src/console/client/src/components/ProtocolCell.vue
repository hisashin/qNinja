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
  methods: {
    run: function(id) {
      console.log("TheMain.runProtocol");
      appState.runProtocol(this.pid);
    },
    revealDetail: function() {
      console.log("ProtocolCell.revealDetail");
      appState.revealDetailProtocol(this.pid);
    },
    edit: function() {
      console.log("ProtocolCell.edit");
      appState.editProtocol(this.pid);
    },
    delete: function() {
      console.log("ProtocolCell.delete");
      appState.deleteProtocol(this.pid);
    },
    duplicate: function() {
      console.log("ProtocolCell.duplicate");
    }
  }
}
</script>