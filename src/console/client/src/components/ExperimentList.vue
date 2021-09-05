<template>
  <div><!-- Container -->
    <div class="section__body">
      <!-- List card -->
      <ul class="item item--list-card">
        <template v-for="(summary, index) in summaries">
          <ExperimentCell :key="index"
            v-if="index < limit"
            :summary="summary"/>
        </template>
        <li v-if="error" class="list-card-cell list-card-cell--error">
          <div class="error">
            <h2 class="error__title">Failed to load experiment list.</h2>
            <div class="error__retry">
              <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <nav v-if="pagination && !error" class="section__nav section__nav--bottom">
      <ul class="paging__pages">
        <li class="paging__pages__page" v-for="index in paging.pages" v-bind:key="index">
          <a class="paging__pages__page__label paging__pages__page__label--linked" v-if="index-1!=paging.page" href="javascript:void(0)" @click="reload(index-1)">{{ index }}</a>
          <span class="paging__pages__page__label paging__pages__page__label--current" v-if="index-1==paging.page">{{ index }}</span>
        </li>
      </ul>
      (Total experiments: {{ paging.total }})
    </nav>
  </div>
</template>
<script>
import appState from "../lib/AppState.js";
import client from "../lib/RestClient.js";
import ExperimentCell from './ExperimentCell.vue'
export default {
  name: 'ExperimentList',
  components: {
    ExperimentCell
  },
  props: {
    limit: { type:Number },
    pagination: { type:Boolean }
  },
  data() {
    return {
      summaries:[],
      paging:{},
      params:{},
      error: false
    }
  },
  created: function () {
  },
  methods: {
    load: function () {
      this.error = false;
      if (this.limit) {
        this.params.limit = this.limit;
      }
      let params = this.$data.params;
      client.fetchExperiments(params, 
      (res)=>{
        this.summaries = res.data;
        this.paging = res.paging;
      },
      ()=>{
        // Error
        this.error = true;
        this.summaries = [];
      });
    },
    revealDetail: function (id) {
      console.log("ExperimentList.revealDetail %s", id);
      appState.revealDetailExperiment(id);
    },
    reload: function(index) {
      this.params.page = index;
      this.load();
    },
    setOrder: function(order) {
      this.params.order = order;
      this.params.page = 0;
      this.load();
    },
    setSort: function(sort) {
      this.params.sort = sort;
      this.params.page = 0;
      this.load();
    },
    setKeyword: function(keyword) {
      this.params.keyword = keyword;
      this.params.page = 0;
      this.load();
    },
    setStatus: function (status) {
      this.params.status = status;
      this.params.page = 0;
      this.load();
    }
  }
}
</script>