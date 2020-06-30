<template>
  <div id="app">
    <h1>Ninja qPCR</h1>
    <NetworkStatus />
    <DeviceStatus />
    <ProtocolEditor name="New Protocol" />
  </div>
</template>

<script>
import DeviceStatus from './components/DeviceStatus.vue'
import ProtocolEditor from './components/ProtocolEditor.vue'
import NetworkStatus from './components/NetworkStatus.vue'

export default {
  name: 'App',
  components: {
    ProtocolEditor,
    NetworkStatus,
    DeviceStatus
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
