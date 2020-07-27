<template>
  <div v-if="log!=null">
    <div class="card">
      <div class="card-header">
        Log Detail
      </div>
      <div class="p-3">
        {{log.id}}
      </div>
    </div>
    <h2>(TODO) Experiment Summary</h2>
    <h2>(TODO) Protocol Detail</h2>
    <h2>(TODO) Tube Config</h2>
    <h2>(TODO) Temperature Chart</h2>
    <h2>(TODO) qPCR Fluorescence Chart</h2>
    <h2>(TODO) Melt Curve Chart</h2>
    <h2>(TODO) Standard Curve</h2>
  </div>
</template>

<script>
import device from "../lib/Device.js";
import appState from "../lib/AppState.js";

export default {
  name: 'LogDetail',
  components:{
  },
  data() {
    return {
      log:{}
    }
  },
  created: function () {
    this.log = appState.getSelectedLog();
  },
  methods: {
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
