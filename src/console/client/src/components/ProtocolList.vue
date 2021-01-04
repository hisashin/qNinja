<template>
  <div class="card">
    <ul
      class="row protocol-list">
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
    <div v-if="pagination" class="row pagination">
      Paging
      offset: {{ paging.offset }} /
      limit: {{ paging.limit }} /
      page: {{ paging.page }} /
      size: {{ paging.size }} /
      total: {{ paging.total }} /
      pages: {{ paging.pages }} /
    </div>
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
      paging:{}
    }
  },
  created: function () {
  },
  methods: {
    load: function () {
      console.log("LogList.load");
      /*
        offset, page, limit, sort, order, keyword
      */
      let params = {
        page:0,
        limit:this.limit
      };
      appState.fetchProtocols(params, (res)=>{
        this.protocols = res.data;
        this.paging = res.paging;
      });
    
    }
  }
}
</script>