<template>
  <li class="row" v-on:click="revealDetail">
    <!-- {{pid}} -->
    {{protocol.name}}
      <ul v-for="stage in protocol.stages" class="col-8">
        <span v-if="stage.type==1">Hold</span>
        <span v-if="stage.type==2">PCR</span>
        <span v-if="stage.type==3">Melt Curve</span>
        
        <span v-for="step in stage.steps">
          {{step.temp}}℃
          {{step.duration}}sec
          {{step.data_collection}}
        </span>
        <span v-if="stage.type==2">x{{stage.repeat}}</span>
      </ul>
      <div class="col-4">
        <b-button v-on:click.stop="edit">Edit</b-button>
        <b-button v-on:click.stop="run" class="ml-1">Run</b-button>
      </div>
    </ul>
    
  </li>
</template>
<script>
import appState from "../lib/AppState.js";
export default {
  name: 'ProtocolCard',
  data() {
    return {
    }
  },
  props: {
    pid: { type:String },
    protocol: { type:Object },
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