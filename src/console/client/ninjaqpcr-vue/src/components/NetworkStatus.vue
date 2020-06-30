<template>
  <div>
    <h2>NetworkStatus</h2>
    <p>{{connectionStatus}}</p>
    <button v-on:click="connect">Connect</button>
    <button v-on:click="start" v-show="connected">Start</button>
  </div>
</template>


<script>
import network from "../lib/network.js";
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
    this.network.addConnectionEventHandlers(handler);
  }
}
</script>