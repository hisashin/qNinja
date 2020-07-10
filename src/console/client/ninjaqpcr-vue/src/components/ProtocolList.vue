<template>
  <div class="card">
    <ul
      class="row protocol-list">
      <template v-for="(item, index) in protocols"
      >
        <ProtocolCard
          :key="index"
          v-if="index < limit"
          :pid="item.id"
          :protocol="item.protocol"
        />
      </template>
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