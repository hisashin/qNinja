<template>
  <div><!-- Container -->
    <div class="section__body">
      <!-- List card -->
      <ul class="item item--list-card">
        <template v-for="(summary, index) in summaries">
          <li class="item--list-card__cell item--list-card__cell--item"
            :key="index">
            <ExperimentCell
              v-if="index < limit"
              :summary="summary"/>
          </li>
        </template>
        <li v-if="error" class="item--list-card__cell item--list-card__cell--error">
          <h2 class="error__title">Failed to load experiment list.</h2>
          <div class="error__retry">
            <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
          </div>
        </li>
      </ul>
    </div>
    <nav v-if="pagination && !error" class="section__nav section__nav--bottom">
      TODO pagination
    </nav>
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