<template>
  <div class="">
    <div class="card p-3">
      <p>Device: {{connectionStatus}}</p>
      <div>
        <b-button pill variant="primary" v-on:click="connect" v-show="!connected">Connect</b-button>
        <b-button pill variant="primary" v-on:click="start" v-show="connected">Start</b-button>
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
  methods: {
    connect: function () {
      console.log("connect");
      this.network.connect();
    },
    start: function () {
      this.network.start();
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
  }
}
</script>