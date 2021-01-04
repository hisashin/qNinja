<template>
  <div>
    <h2>Recent protocols</h2>
    <ProtocolList :limit="2" ref="protocolList" :pagination="false" />
    <b-button @click="viewProtocolList">
      More
    </b-button>
    <h2>Recent experiments</h2>
    <LogList :limit="3" ref="logList" :pagination="false" />
    <b-button @click="viewLogList">
      More
    </b-button>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import ProtocolList from '../ProtocolList.vue'
import LogList from '../LogList.vue'

export default {
  name: 'TheDashboard',
  components: {
    ProtocolList,
    LogList
  },
  props: {
  },
  data() {
    return {
    }
  },
  created: function () {
  },
  methods: {
    viewProtocolList () {
      appState.pushPanel(appState.PANELS.PROTOCOL_LIST);
    },
    viewLogList () {
      appState.pushPanel(appState.PANELS.LOG_LIST);
    },
    onAppear () {
      console.log("TheDashboard.onAppear()");
      this.$refs.protocolList.load();
    }
  }
}
</script>