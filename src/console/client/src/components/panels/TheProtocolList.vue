<template>
  <div class="panel panel--protocol-list">
    <div class="panel__menu">
    </div>
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button @click="startCreateProtocol">
            New Protocol
          </b-button>
        </div>
      </header>
      <!-- Search & sort -->
      <nav class="section__nav section__nav--top">
        <select v-model="sort" @change="onSortChanged">
          <option value="modified">Last edited</option>
          <option value="created">Created</option>
          <option value="start">Start time</option>
          <option value="end">End time</option>
          <option value="name">Name</option>
          <option value="protocol_name">Protocol</option>
        </select>
        <label>
          <input type="radio" v-model="order" value="asc" @change="onOrderChanged"/> A-Z
        </label>
        <label>
          <input type="radio" v-model="order" value="desc" @change="onOrderChanged"/> Z-A
        </label>
        <input type="text" placeholder="Search" v-model="keyword" @keyup="onKeywordChanged"/>
      </nav>
      <ProtocolList :limit="10" :pagination="true" ref="protocolList"/>
    </section>
  </div>
</template>
<script>
import ProtocolList from '../ProtocolList.vue'
import appState from "../../lib/AppState.js";
export default {
  name: 'TheProtocolList',
  components: {
    ProtocolList
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
  props: {
  },
  created: function () {
  },
  methods: {
    startCreateProtocol () {
      appState.startCreateProtocol();
    },
    onAppear () {
      this.$refs.protocolList.load();
    },
    title () { return "Protocols" },
    onOrderChanged () {
      this.$refs.protocolList.setOrder(this.order);
    },
    onSortChanged () {
      this.$refs.protocolList.setSort(this.sort);
    },
    onKeywordChanged () {
      let now = new Date().getTime();
      this.keywordLastUpdate = now;
      setTimeout(()=>{
        if (now == this.keywordLastUpdate && this.keyword != this.keywordPrev) {
          this.keywordPrev = this.keyword;
          this.$refs.protocolList.setKeyword(this.keyword);
        }
      }, 350)
    
    }
  }
}
</script>