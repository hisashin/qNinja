<template>
  <li
    class="col-12"
    @click="revealDetail"
  >
    <!-- {{pid}} -->
    {{ protocol.name }}
    <ul
      v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex"
      class="col-8"
    >
      <span v-if="stage.type==1">Hold</span>
      <span v-if="stage.type==2">PCR</span>
      <span v-if="stage.type==3">Melt Curve</span>
        
      <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex">
        {{ step.temp }}℃
        {{ step.duration }}sec
        {{ step.data_collection }}
      </span>
      <span v-if="stage.type==2">x{{ stage.repeat }}</span>
    </ul>
    <div class="col-4">
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
    </ul>
  </li>
</template>
<script>
import appState from "../lib/AppState.js";
export default {
  name: 'ProtocolCard',
  props: {
    pid: { type:String },
    protocol: { type:Object },
  },
  data() {
    return {
    }
  },
  methods: {
    run: function(id) {
      console.log("DeviceMonitor.runProtocol");
      appState.runProtocol(this.pid);
    },
    revealDetail: function() {
      console.log("ProtocolCard.revealDetail");
      appState.revealDetailProtocol(this.pid);
    },
    edit: function() {
      console.log("ProtocolCard.edit");
      appState.editProtocol(this.pid);
    },
    delete: function() {
      console.log("ProtocolCard.delete");
      appState.deleteProtocol(this.pid);
    },
    duplicate: function() {
      console.log("ProtocolCard.duplicate");
    }
  }
}
</script>