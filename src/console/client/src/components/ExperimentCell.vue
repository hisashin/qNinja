<template>
  <li class="list-card-cell list-card-cell--item" @click="revealDetail">
    <div class="experiment-cell-content">
      <div class="row">
        <div class="col-12"><strong>{{summary.name}}</strong></div>
        <div class="col-4">{{start}}</div>
        <div class="col-4">{{duration}}</div>
        <div class="col-4">{{summary.status}}</div>
      </div>
    </div>
  </li>
</template>
<script>
import appState from "../lib/AppState.js";
import Util from "../lib/Util.js";
export default {
  name: 'ExperimentCell',
  components: {
  },
  props: {
    summary: { type:Object }
  },
  computed: {
    start: function() {
      if (this.summary.start > 0) {
        const date = new Date(this.summary.start);
        return date.toLocaleString();
      }
      return "";
    },
    end: function() {
      if (this.summary.end > 0) {
        return new Date(this.summary.end).toDateString();
      }
      return "";
    },
    duration: function() {
      if (this.summary.start > 0 && this.summary.end > 0) {
        return Util.humanTime((this.summary.end-this.summary.start)/1000);
      }
      return "";
    }
  },
  methods: {
    revealDetail: function () {
      console.log(this.summary.id);
      appState.revealDetailExperiment(this.summary.id);
    }
  }
}
</script>