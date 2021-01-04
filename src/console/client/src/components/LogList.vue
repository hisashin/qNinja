<template>
  <div class="card">
    <ul
      class="row log-list">
      <div v-if="error" class="col-12 error">
        <h2 class="error__title">Failed to load experiment logs.</h2>
        <div class="error__retry">
          <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
        </div>
      </div>
      <template v-for="(summary, index) in summaries">
        <li 
          class="col-12 log-cell"
          :key="index" v-if="index < limit">
          <LogCell
          :summary="summary"/>
        </li>
      </template>
    </ul>
    <div v-if="pagination" class="row pagination">
      TODO pagination
    </div>
  </div>
</template>
<script>
import appState from "../lib/AppState.js";
import LogCell from './LogCell.vue'
export default {
  name: 'LogList',
  components: {
    LogCell
  },
  props: {
    limit: { type:Number },
    pagination: { type:Boolean },
    params:{}
  },
  data() {
    return {
      summaries:[],
      error: false
    }
  },
  created: function () {
  },
  methods: {
    load: function () {
      this.error = false;
      appState.fetchLogs({}, 
      (data)=>{
        this.summaries = data;
      },
      ()=>{
        this.error = true;
      });
    },
    revealDetail: function (id) {
      console.log("LogList.revealDetail %s", id);
      appState.revealDetailLog(id);
    }
  }
}
</script>