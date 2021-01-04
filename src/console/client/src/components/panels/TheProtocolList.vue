<template>
  <div>
    <h2>Protocols</h2>
    <div>
      <select v-model="sort" @change="onSortChanged">
        <option value="updated">Last edited</option>
        <option value="created">Last created</option>
        <option value="used">Last used</option>
        <option value="name">Name</option>
      </select>
      <label>
        <input type="radio" v-model="order" value="asc" @change="onOrderChanged"/> A-Z
      </label>
      <label>
        <input type="radio" v-model="order" value="desc" @change="onOrderChanged"/> Z-A
      </label>
      <input type="text" placeholder="Search" v-model="keyword" @keyup="onKeywordChanged"/>
    </div>
    <ProtocolList :limit="2" :pagination="true" ref="protocolList"/>
    <b-button @click="startCreateProtocol">
      New Protocol
    </b-button>
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
      sort: "updated",
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