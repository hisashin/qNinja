<template>
  <div>
    <h2>Protocols</h2>
    <div>
      <input type="text" placeholder="Search"/>
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
  props: {
  },
  created: function () {
  },
  methods: {
    startCreateProtocol () {
      appState.startCreateProtocol();
    },
    onAppear () {
      console.log("TheProtocolList.onAppear()");
      this.$refs.protocolList.load();
    }
  }
}
</script>