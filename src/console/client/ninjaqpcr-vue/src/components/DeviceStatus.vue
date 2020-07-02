<template>
  <div class="col-12 mt-1">
    <div class="card">
      <div class="row">
        <div class="col-6">
          <div>
            Well {{ wellTemp }}℃
          </div>
          <div>
            <meter min="0" max="110" v-bind:value="wellTemp" style="width:100%"></meter>
          </div>
        </div>
        <div class="col-6">
          <div>
            Well {{ lidTemp }}℃
          </div>
          <div>
            <meter min="0" max="110" v-bind:value="lidTemp" style="width:100%"></meter>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-2">
          Stage {{ cycle }} / {{ totalCycles }}
        </div>
        <div class="col-2">
          Step {{ step }} / {{ totalSteps }}
        </div>
        <div class="col-2">
          Repeat {{ repeat }} / {{ totalRepeats }}
        </div>
        <div class="col-2">
          {{ state }}
        </div>
        <div class="col-2">
          {{ stepElapsed }} msec
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import network from "../lib/device.js";
export default {
  name: 'DeviceStatus',
  data() {
    return {
      wellTemp:0,
      lidTemp:0,
      totalCycles:0,
      cycle:0,
      totalSteps:0,
      step:0,
      state:"Idle",
      totalRepeats:0,
      repeat:0,
      stepElapsed:0,
      protocol:null,
    }
  },
  methods: {
    connect: function () {
    }
  },
  created: function () {
    this.network = network;
    this.network.addTransitionHandler({
      onStart:(obj)=>{
        console.log("onStart");
        console.log(obj);
        this.protocol = obj.protocol;
        console.log(this.protocol);
        this.totalCycles = this.protocol.stages.length;
      },
      onTransition:(obj)=>{
        let status = obj.to;
        if (obj.to == null) { return; }
        const stage = this.protocol.stages[status.cycle];
        this.totalRepeats = stage.repeat;
        this.totalSteps = stage.steps.length;
        const step = stage.steps[status.step];
      }
    });
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