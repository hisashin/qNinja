<template>
  <div class="panel panel--experiment-list">
    <div class="panel__menu">
    </div>
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button @click="startCreateExperiment">
            New Experiment
          </b-button>
        </div>
      </header>
      <!-- Search & sort -->
      <nav class="section__nav section__nav--top">
        <select v-model="sort" @change="onSortChanged">
          <option value="modified">Last edited</option>
          <option value="created">Created</option>
          <option value="started">Last used</option>
          <option value="name">Name</option>
        </select>
        <select v-model="status" @change="onStatusChanged">
          <option value="">Filter by status</option>
          <option value="finished">Finished</option>
          <option value="running">Running</option>
          <option value="cancelled">Cancelled</option>
          <option value="ready">Ready</option>
        </select>
        <label>
          <input type="radio" v-model="order" value="asc" @change="onOrderChanged"/> A-Z
        </label>
        <label>
          <input type="radio" v-model="order" value="desc" @change="onOrderChanged"/> Z-A
        </label>
        <input type="text" placeholder="Search" v-model="keyword" @keyup="onKeywordChanged"/>
      </nav>
      <ExperimentList :limit="10" ref="experimentList" :pagination="true" />
      </section>
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import ExperimentList from '../ExperimentList.vue';

export default {
  name: 'TheExperimentList',
  components: {
    ExperimentList
  },
  props: {
  },
  data() {
    return {
      order: "asc",
      sort: "modified",
      keyword: "",
      keywordPrev: "",
      keywordLastUpdate: 0,
      status: ""
    }
  },
  created: function () {
  },
  methods: {
    startCreateExperiment () {
      appState.draftExperiment();
    },
    onAppear () {
      this.$refs.experimentList.load();
    },
    title () { return "Experiment Logs" },
    onOrderChanged () {
      this.$refs.experimentList.setOrder(this.order);
    },
    onSortChanged () {
      this.$refs.experimentList.setSort(this.sort);
    },
    onStatusChanged () {
      this.$refs.experimentList.setStatus(this.status);
    },
    onKeywordChanged () {
      let now = new Date().getTime();
      this.keywordLastUpdate = now;
      setTimeout(()=>{
        if (now == this.keywordLastUpdate && this.keyword != this.keywordPrev) {
          this.keywordPrev = this.keyword;
          this.$refs.experimentList.setKeyword(this.keyword);
        }
      }, 350)
    
    }
    
  }
}
</script>