<template>
  <div class="">
    <div class="card p-3">
      <p>Device: {{ connectionStatus }}</p>
      <div>
        <b-button
          v-show="!connected"
          pill
          variant="primary"
          @click="connect"
        >
          Connect
        </b-button>
        <b-button
          v-show="connected"
          pill
          variant="primary"
          @click="start"
        >
          Start
        </b-button>
      </div>
    </div>
  </div>
</template>


<script>
import network from "../lib/Device.js";
export default {
  data() {
    return {
      connected: false,
      connectionStatus: "Disconnected"
    }
  },
  created: function () {
    console.log("NetworkStatus.created");
    this.network = network;
    const handler = {
      onOpen: ()=>{
        console.log("NetworkStatus.onOpen");
        this.connected = true;
        this.connectionStatus = "Connected";
      }
    };
    this.network.addConnectionEventHandler(handler);
  },
  methods: {
    connect: function () {
      console.log("connect");
      this.network.connect();
    },
    start: function () {
      this.network.start();
    }
  }
}
</script>