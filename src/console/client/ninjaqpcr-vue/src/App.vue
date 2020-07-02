<template>
  <div id="app">
    <header class="header">
      <h1>Ninja qPCR</h1>
    </header>
    <main class="main p-3">
      <div class="row">
        <NetworkStatus />
      </div>
      <DeviceMonitor></DeviceMonitor>
    </main>
  </div>
</template>

<script>
import DeviceMonitor from './components/DeviceMonitor.vue'
import NetworkStatus from './components/NetworkStatus.vue'

export default {
  name: 'App',
  components: {
    NetworkStatus,
    DeviceMonitor
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
</style>
