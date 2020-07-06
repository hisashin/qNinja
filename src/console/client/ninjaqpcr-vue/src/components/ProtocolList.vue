<template>
  <div class="card">
    <ul
      v-for="(item, index) in protocols"
      :key="index"
      class="row">
      <ProtocolCard
        v-if="index < limit"
        :pid="item.id"
        :protocol="item.protocol"
      />
    </ul>
  </div>
</template>
<script>
import ProtocolCard from './ProtocolCard.vue'
import appState from "../lib/AppState.js";
export default {
  name: 'ProtocolList',
  components: {
    ProtocolCard
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      protocols:[]
    }
  },
  created: function () {
    this.protocols = appState.getProtocols();
    appState.addProtocolEventHandler({
      onProtocolListUpdate:(protocols)=>{
        this.protocols = protocols;
      }
    });
  },
  methods: {
  }
}
</script>