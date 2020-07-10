<template>
  <div id="app">
    <header class="header">
      <h1>Ninja qPCR</h1>
    </header>
    <main class="main">
      <DeviceMonitor />
    </main>
  </div>
</template>

<script>
import DeviceMonitor from './components/DeviceMonitor.vue'
import appState from "./lib/AppState.js";
import device from "./lib/Device.js";

export default {
  name: 'App',
  components: {
    DeviceMonitor
  },
  created: function () {
    appState.init();
    device.connect();
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  max-width: 800px;
}
/* Reset */
ul {
  list-style-type: none;
  padding: 0;
  margin:0;
}
li {
  margin: 0;
  padding:0;
}
a {
  color: #42b983;
}

.main {
  padding:2em;
}

/* Common list view */
.protocol-list, .log-list {
}
.protocol-cell, .log-cell {
}
.protocol-cell-content, .log-cell-content {
  padding:1em;
}
li:not(:last-child) .protocol-cell-content, li:not(:last-child) .log-cell-content {
  border-bottom:1px solid rgba(0, 0, 0, 0.125);

}

/* Protocol list */

/* Log list */

/* Protocol detail & editor view */
.protocol {

}
.protocol-stages {

}
.protocol-stage {
  border-top:1px solid rgba(0, 0, 0, 0.125);
  padding:1em;
}
.protocol-stage-add {
  text-align:right;
  height:38px;
  margin-top:-19px;
  margin-bottom:-19px;
  z-index:2;
  padding-right:1em;
}
.protocol-stage-label {

}
.protocol-steps {

}
.protocol-step {

}
.protocol-step-label {
  display:inline-block;
  width:100px;
}
.protocol-header {
  padding:1em;
}
.protocol-footer {
  padding:1em;
  border-top:1px solid rgba(0, 0, 0, 0.125);
}

.progress-meter {
  display:flex;
}
.progress-meter-item {
  border:1px solid rgba(0, 0, 0, 0.125);
  text-align:center;
  padding:0.2em;
  margin:0.1em;
  width: 100%;
}
.progress-meter-item-current {
  text-align:center;
  padding:0.2em;
  margin:0.1em;
  width: 100%;
  background-color:#007bff;
  border-color:#007bff;
  color:#ffffff;
}
/* Input fields */
.input-repeat {
  width:80px;
}
.input-temp {
  width:80px;
}
.input-duration {
  width:80px;
}
.input-speed {
  width:80px;
}
</style>
