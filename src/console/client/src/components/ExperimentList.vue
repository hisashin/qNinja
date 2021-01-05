<template>
  <div class="card">
    <ul
      class="row experiment-list">
      <div v-if="error" class="col-12 error">
        <h2 class="error__title">Failed to load experiment list.</h2>
        <div class="error__retry">
          <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
        </div>
      </div>
      <template v-for="(summary, index) in summaries">
        <li 
          class="col-12 experiment-cell"
          :key="index" v-if="index < limit">
          <ExperimentCell
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
import ExperimentCell from './ExperimentCell.vue'
export default {
  name: 'ExperimentList',
  components: {
    ExperimentCell
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
      appState.fetchExperiments({}, 
      (data)=>{
        this.summaries = data;
      },
      ()=>{
        this.error = true;
      });
    },
    revealDetail: function (id) {
      console.log("ExperimentList.revealDetail %s", id);
      appState.revealDetailExperiment(id);
    }
  }
}
</script>