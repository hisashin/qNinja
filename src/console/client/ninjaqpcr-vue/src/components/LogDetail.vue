<template>
  <div class="">
    <div class="card">
      <div class="card-header">
        Log Detail
      </div>
      <div class="p-3">
        {{log.start}}
      </div>
    </div>
    <ProtocolDetail
      :id="log.protocol_name"
      :protocol="log.protocol" />
    <div class="card">
      <b-tabs content-class="mt-3">
        <b-tab title="Fluorescence">
          <p>TODO</p>
        </b-tab>
        <b-tab
          title="Temperature"
          active>
          <p>TODO</p>
        </b-tab>
        <b-tab
          title="Standard Curve">
          <p>TODO</p>
        </b-tab>
      </b-tabs>
    </div>
  </div>
</template>

<script>
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";
import ProtocolDetail from './ProtocolDetail.vue'

export default {
  name: 'LogDetail',
  components:{
    ProtocolDetail
  },
  data() {
    return {
      log:{}
    }
  },
  created: function () {
    network.connect();
  },
  methods: {
    onSelectLog: function (log) {
      console.log("LogDetaio.onSelectLog");
      this.log = log;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
}
a {
  color: #42b983;
}
</style>
