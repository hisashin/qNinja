<template>
  <div class="card">
    <ul
      class="row log-list">
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
      summaries:[]
    }
  },
  created: function () {
  },
  methods: {
    load: function () {
      appState.fetchLogs({}, (data)=>{
        this.summaries = data;
      });
    },
    revealDetail: function (id) {
      console.log("LogList.revealDetail %s", id);
      appState.revealDetailLog(id);
    }
  }
}
</script>