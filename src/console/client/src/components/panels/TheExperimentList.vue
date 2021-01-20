<template>
  <div class="panel">
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Protocols</h2>
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
        <label>
          <input type="radio" v-model="order" value="asc" @change="onOrderChanged"/> A-Z
        </label>
        <label>
          <input type="radio" v-model="order" value="desc" @change="onOrderChanged"/> Z-A
        </label>
        <input type="text" placeholder="Search" v-model="keyword" @keyup="onKeywordChanged"/>
      </nav>
      <ExperimentList :limit="2" ref="experimentList" :pagination="true" />
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
      keywordLastUpdate: 0
    }
  },
  created: function () {
  },
  methods: {
    startCreateExperiment () {
      appState.startCreateExperiment();
    },
    onAppear () {
      console.log("TheExperimentList.onAppear()");
      this.$refs.experimentList.load();
    },
    onOrderChanged () {
      this.$refs.experimentlList.setOrder(this.order);
    },
    onSortChanged () {
      this.$refs.experimentlList.setSort(this.sort);
    },
    onKeywordChanged () {
      let now = new Date().getTime();
      this.keywordLastUpdate = now;
      setTimeout(()=>{
        if (now == this.keywordLastUpdate && this.keyword != this.keywordPrev) {
          this.keywordPrev = this.keyword;
          this.$refs.experimentlList.setKeyword(this.keyword);
        }
      }, 350)
    
    }
    
  }
}
</script>