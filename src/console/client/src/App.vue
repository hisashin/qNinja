<template>
  <div id="app">
    <link rel="stylesheet" type="text/css" media="all" v-bind:href="[css]" />
    <TheMain />
  </div>
</template>

<script>
import TheMain from './components/TheMain.vue'
import appState from "./lib/AppState.js";
import device from "./lib/Device.js";

export default {
  name: 'App',
  components: {
    TheMain
  },
  created: function () {
    appState.init();
    device.connect();
  },
  computed: {
    css: function() {
      return (appState.isKiosk()) ?  "/css/style-kiosk.css" : "/css/style-app.css"; 
    }
  }
}
</script>

<style>

</style>
