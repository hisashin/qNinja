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

/* Protocol view */
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
