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
  </div>
</template>

<script>
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";

export default {
  name: 'ProtocolDetail',
  components:{},
  data() {
    return {
      log:{}
    }
  },
  created: function () {
    appState.addLogEventHandler(this);
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
