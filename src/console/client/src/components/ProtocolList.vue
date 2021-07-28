<template>
  <div><!-- Container -->
    <div class="section__body">
      <!-- List card -->
      <ul class="item item--list-card">
        <template v-for="(item, index) in protocols"
          >
          <ProtocolCell :key="index"
            v-if="index < limit"
            :pid="item.id"
            :protocol="item.protocol"
          />
        </template>
        <li v-if="error" class="list-card-cell list-card-cell--error">
          <div class="error">
            <h2 class="error__title">Failed to load protocols.</h2>
            <div class="error__retry">
              <a class="error__retry__link btn btn-secondary rounded-pill" href="javascript:void(0)" @click="load">Retry</a>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <nav class="section__nav section__nav--bottom paging" v-if="pagination && !error">
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
import ProtocolCell from './ProtocolCell.vue';
import appState from "../lib/AppState.js";
import client from "../lib/RestClient.js";
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
      this.error = false;
      this.params.limit = this.limit;
      let params = this.$data.params;
      client.fetchProtocols(params, 
      (res)=>{
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