<template>
  <div>
    <h2>DeviceStatus</h2>
    <dl>
      <dt>Well</dt>
      <dd><meter min="0" max="110" v-bind:value="wellTemp"></meter> {{ wellTemp }}</dd>
      <dt>Lid</dt>
      <dd><meter min="0" max="110" v-bind:value="lidTemp"></meter>{{ lidTemp }}</dd>
      <dt>Cycle</dt>
      <dd>{{ cycle }}</dd>
      <dt>Step</dt>
      <dd>{{ step }}</dd>
      <dt>State</dt>
      <dd>{{ state }}</dd>
      <dt>Repeat</dt>
      <dd>{{ repeat }}</dd>
      <dt>StepElapsed</dt>
      <dd>{{ stepElapsed }}</dd>
    </dl>
  </div>
</template>


<script>
import network from "../lib/network.js";
export default {
  data() {
    return {
      wellTemp:0,
      lidTemp:0,
      cycle:0,
      step:0,
      state:"Idle",
      repeat:0,
      stepElapsed:0
    }
  },
  methods: {
    connect: function () {
    }
  },
  created: function () {
    this.network = network;
    this.network.addProgressHandler({
      onProgress:(obj)=>{
        this.wellTemp = obj.well;
        this.lidTemp = obj.lid;
        if (obj.state) {
          this.cycle = obj.state.cycle;
          this.step = obj.state.step;
          this.state = obj.state.state;
          this.repeat = obj.state.repeat;
          this.stepElapsed = obj.state.stepElapsed;
        }
      }
    });
  }
}
</script>