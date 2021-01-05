<template>
  <div>
    <div class="card">
      <div class="row">
        <div v-if="error" class="col-12 error">
          <h2 class="error__title">Failed to load protocols.</h2>
          <div class="error__retry">
            <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
          </div>
        </div>
        <ul
          class="col-12 row protocol-list">
          <template v-for="(item, index) in protocols"
          >
            <ProtocolCell
              :key="index"
              v-if="index < limit"
              :pid="item.id"
              :protocol="item.protocol"
            />
          </template>
        </ul>
      </div>
    </div>
    <nav class="paging col-12" v-if="pagination && !error">
      <ul class="paging__pages">
        <li class="paging__pages__page" v-for="index in paging.pages" v-bind:key="index">
          <a class="paging__pages__page__label paging__pages__page__label--linked" v-if="index-1!=paging.page" href="javascript:void(0)" @click="reload(index-1)">{{ index }}</a>
          <span class="paging__pages__page__label paging__pages__page__label--current" v-if="index-1==paging.page">{{ index }}</span>
        </li>
      </ul>
      (Total protocols: {{ paging.total }})
    </nav>
  </div>
</template>
<script>
import ProtocolCell from './ProtocolCell.vue'
import appState from "../lib/AppState.js";
export default {
  name: 'ProtocolList',
  components: {
    ProtocolCell
  },
  props: {
    limit: { type:Number },
    pagination: { type:Boolean }
  },
  data() {
    return {
      protocols:[],
      paging:{},
      params:{},
      error: false
    }
  },
  created: function () {
    this.params.limit = this.limit;
  },
  methods: {
    load: function () {
      console.log("ExperimentList.load");
      this.error = false;
      /*
        offset, page, limit, sort, order, keyword
      */
      let params = this.$data.params;
      appState.fetchProtocols(params, 
      (res)=>{
        console.log("fetchProtocols callback");
        this.protocols = res.data;
        this.paging = res.paging;
      },
      ()=>{
        // Error
        this.error = true;
        this.protocols = [];
      });
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
    }
  }
}
</script>