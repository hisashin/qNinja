<template>
  <div class="col-12 mt-1">
    <h3>Protocol List</h3>
    <button>New</button>
    <div class="card p-3">
      <ul v-for="(item, index) in protocols">
        <ProtocolCard :pid="item.id" :protocol="item.protocol" />
      </ul>
    </div>
  </div>
</template>
<script>
import ProtocolCard from './ProtocolCard.vue'
import appState from "../lib/AppState.js";
export default {
  name: 'ProtocolList',
  data() {
    return {
      protocols:[]
    }
  },
  methods: {
  },
  components: {
    ProtocolCard
  },
  created: function () {
    this.protocols = appState.getProtocols();
    appState.addProtocolEventHandler({
      onProtocolListUpdate:(protocols)=>{
        this.protocols = protocols;
      }
    });
  }
}
</script>