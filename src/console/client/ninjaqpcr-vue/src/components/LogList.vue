<template>
  <div class="card">
    <ul
      class="row log-list">
      <template v-for="(summary, index) in summaries">
        <li 
          class="col-12 log-cell"
          :key="index" v-if="index < limit">
          <div class="log-cell-content">
            {{summary.protocol_name}}
            {{summary.id}}
          </div>
        </li>
      </template>
    </ul>
  </div>
</template>
<script>
import appState from "../lib/AppState.js";
export default {
  name: 'LogList',
  components: {
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      summaries:[]
    }
  },
  created: function () {
    this.summaries = appState.getLogSummaries();
    console.log("LogList.created. Adding handler...");
    appState.addLogEventHandler({
      onLogSummariesUpdate:(summaries)=>{
        console.log("LogList.onLogSummariesUpdate %d", summaries.length);
        this.summaries = summaries;
      }
    });
  },
  methods: {
    revealDetail: function(id) {
      console.log("LogList.revealDetail %s", id);
      appState.revealDetailLog(id);
    }
  }
}
</script>