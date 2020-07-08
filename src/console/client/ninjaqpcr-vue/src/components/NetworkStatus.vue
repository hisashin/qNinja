<template>
  <div class="">
    <div class="card p-3">
      <p>Device: {{ connectionStatus }}</p>
      <div>
        <template v-if="deviceState!=null">
          DeviceState={{ deviceState.label }}
        </template>
        <b-button
          v-show="!connected"
          pill
          variant="primary"
          @click="reConnect"
        >
          Connect
        </b-button>
      </div>
    </div>
  </div>
</template>

<script>
import device from "../lib/Device.js";
export default {
  data() {
    return {
      connected: false,
      connectionStatus: "Disconnected",
      deviceState: null
    }
  },
  created: function () {
    console.log("NetworkStatus.created");
    this.device = device;
    this.device.addConnectionEventHandler(this);
    this.deviceState = this.device.getDeviceState();
    this.device.addDeviceStateHandler(this);
  },
  methods: {
    reConnect: function () {
      console.log("reConnect");
      this.device.connect();
    },
    start: function () {
    },
    onOpen: function () {
      console.log("NetworkStatus.onOpen");
      this.connected = true;
      this.connectionStatus = "Connected";
    },
    onDeviceStateChange: function (deviceState){
      this.deviceState = deviceState;
    }
  }
}
</script>