<template>
  <div class="card">
    <ul v-for="(item, index) in protocols" class="row">
      <ProtocolCard :pid="item.id" :protocol="item.protocol" v-if="index < limit" />
    </ul>
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
  props: {
    limit: { type:Number }
  },
  methods: {
  },
  components: {
    ProtocolCard
  },
  created: function () {
    this.protocols = appState.getProtocols();
    console.log("ProtocolList.created");
    appState.addProtocolEventHandler({
      onProtocolListUpdate:(protocols)=>{
        this.protocols = protocols;
      }
    });
  }
}
</script>