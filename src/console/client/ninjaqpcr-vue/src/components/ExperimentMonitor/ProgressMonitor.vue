<template>
  <div class="card p-3 mb-3">
    <div>
    <template v-if="deviceState != null">
      <b-button pill v-if="deviceState.pauseAvailable" @click="pause">Pause</b-button>
      <b-button pill v-if="deviceState.resumeAvailable" @click="resume">Resume</b-button>
      <b-button pill v-if="deviceState.abortAvailable" @click="abort">Abort</b-button>
      <b-button pill v-if="deviceState.finishAvailable" @click="finish">Finish</b-button>
      <b-button pill v-if="deviceState.startAvailable" @click="start">Start</b-button>
    </template>
    </div>
    <div class="row">
      <div class="col-6">
        <div>
          Well {{ wellTemp }}℃
        </div>
        <div>
          <meter
            min="0"
            max="110"
            :value="wellTemp"
            style="width:100%" />
        </div>
      </div>
      <div class="col-6">
        <div>
          Well {{ lid_temp }}℃
        </div>
        <div>
          <meter
            min="0"
            max="110"
            :value="lid_temp"
            style="width:100%"
          />
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
</template>


<script>
import network from "../../lib/Device.js";
export default {
  name: 'ProgressMonitor',
  data() {
    return {
      wellTemp:0,
      lid_temp:0,
      totalCycles:0,
      cycle:0,
      totalSteps:0,
      step:0,
      state:"Idle",
      totalRepeats:0,
      repeat:0,
      stepElapsed:0,
      protocol:null,
      deviceState: null
    }
  },
  created: function () {
    this.network = network;
    this.deviceState = this.network.deviceState;
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
        this.lid_temp = obj.lid;
        if (obj.state) {
          this.cycle = obj.state.cycle;
          this.step = obj.state.step;
          this.state = obj.state.state;
          this.repeat = obj.state.repeat;
          this.stepElapsed = obj.state.stepElapsed;
        }
      }
    });
    this.network.addDeviceStateHandler({
      onDeviceStateChange: (obj)=>{
        console.log("ProgressMonitor.onDeviceStateChange");
        console.log(obj);
        this.deviceState = obj;
      }
    });
  },
  methods: {
    start : ()=>{ network.start(); },
    pause : ()=>{ network.pause(); },
    resume : ()=>{ network.resume(); },
    abort : ()=>{ network.abort(); },
    finish : ()=>{ network.finish(); }
  }
}
</script>