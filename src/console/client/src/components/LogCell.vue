<template>
  <div class="log-cell-content">
    <div class="p-1">
      <div class="row">
        <div class="col-12"><strong>{{summary.protocol_name}}</strong></div>
        <div class="col-6">{{start}}</div>
        <div class="col-6">{{duration}}</div>
      </div>
    </div>
  </div>
</template>
<script>
import appState from "../lib/AppState.js";
import Util from "../lib/Util.js";
export default {
  name: 'LogCell',
  components: {
  },
  props: {
    summary: { type:Object }
  },
  computed: {
    start: function() {
      return new Date(this.summary.start).toDateString();
    },
    end: function() {
      return new Date(this.summary.end).toDateString();
    },
    duration: function() {
      return Util.humanTime((this.summary.end-this.summary.start)/1000);
    }
  }
}
</script>