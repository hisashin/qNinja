<template>
  <div class="card">
    <ul
      v-for="(summary, index) in summaries"
      :key="index"
      class="row">
      <li class="col-12" v-if="limit==null || index<limit" @click="revealDetail(summary.id)">
        {{summary.protocol_name}}
        {{summary.id}}
      </li>
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