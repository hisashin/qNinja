<template>
  <div class="card p-3 mb-3" 
    v-if="protocol!=null && progress!=null && deviceState != null">
    <ul class="progress-meter">
      <li 
        class="progress-meter-item"
        v-bind:class="{ 'progress-meter-item-current': progress.state.state=='preheat' }">Preheat</li>
      <li 
        class="progress-meter-item"
        v-for="(stage, index) in protocol.stages" :key="index" 
        v-bind:class="{ 'progress-meter-item-current': progress.state.cycle==index }">
        {{ stageLabel(stage.type) }}
      </li>
      <li
        class="progress-meter-item"
        v-bind:class="{ 'progress-meter-item-current': progress.state.state=='complete' }">Final Hold</li>
    </ul>
    <div class="row">
      <div class="col-6">
        <div>
          Well {{ progress.well }}℃ 
          <template 
            v-if="step!=null && step.temp!=null">/{{step.temp}}℃</template>
        </div>
        <div>
          <meter
            min="0"
            max="110"
            :value="progress.well"
            style="width:100%" />
        </div>
      </div>
      <div class="col-6">
        <div>
          Lid {{ progress.lid }}℃/{{protocol.lid_temp}}℃
        </div>
        <div>
          <meter
            min="0"
            max="110"
            :value="progress.lid"
            style="width:100%"
          />
        </div>
      </div>
    </div>
    <div class="row" v-if="progress.state.state!='preheat' && progress.state.state!='complete'">
      <div class="col-3">
        Stage {{ progress.state.cycle+1 }}/{{ protocol.stages.length }}
      </div>
      <div class="col-3">
        Step {{ progress.state.step+1 }}<template v-if="stage!=null">/{{stage.steps.length}}</template>
      </div>
      <div class="col-3">
        Cycle {{ progress.state.repeat+1 }}<template v-if="stage!=null">/{{stage.repeat}}</template>
      </div>
      <div class="col-3">
        {{ progress.state.state }} 
        {{ stepElapsedSec }} sec
      </div>
    </div>
    <div>
      <template v-if="deviceState != null">
        <b-button pill v-if="deviceState.pauseAvailable" @click="pause">Pause</b-button>
        <b-button pill v-if="deviceState.resumeAvailable" @click="resume">Resume</b-button>
        <b-button pill v-if="deviceState.abortAvailable" @click="abort">Abort</b-button>
        <b-button pill v-if="deviceState.finishAvailable" @click="finish">Finish</b-button>
        <b-button pill v-if="deviceState.startAvailable" @click="start">Start</b-button>
      </template>
    </div>
  </div>
</template>


<script>
import device from "../../lib/Device.js";
var numeral = require('numeral');
const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

let LABEL_MAP = {};
LABEL_MAP[STAGE_TYPE_HOLD] = "Hold";
LABEL_MAP[STAGE_TYPE_PCR] = "PCR";
LABEL_MAP[STAGE_TYPE_MELT_CURVE] = "Melt Curve";
export default {
  name: 'ProgressMonitor',
  data() {
    return {
      protocol:null,
      deviceState: null,
      progress: null,
      stage: { step:[]},
      step: {},
      stepElapsedSec: ""
    }
  },
  created: function () {
    this.protocol = device.getProtocol();
    console.log("ProgressMonitor.created");
    console.log(this.protocol)
    device.addTransitionHandler({
      onStart:(obj)=>{
        console.log("ProgressMonitor.onStart");
        console.log(obj);
        this.protocol = obj.protocol;
      },
      onTransition:(obj)=>{
        console.log("ProgressMonitor.onTransition");
        console.log(obj);
        let status = obj.to;
        if (obj.to == null) { return; }
        if (this.protocol == null) {
          return;
        }
        const stage = this.protocol.stages[status.cycle];
        const step = stage.steps[status.step];
      }
    });
    device.addProgressHandler({
      onProgress:(progress)=>{
        this.progress = progress;
        console.log(progress)
        if (this.protocol == null) {
          return;
        }
        if (progress.state) {
          this.selectStageAndStep();
        }
      }
    });
    this.deviceState = device.getDeviceState();
    device.addDeviceStateHandler({
      onDeviceStateChange: (state)=>{
        console.log("ProgressMonitor.onDeviceStateChange");
        console.log(state);
        this.deviceState = state;
      },
      onUpdateProtocol: (protocol)=>{
        this.protocol = protocol;
        console.log("ProgressMonitor.onUpdateProtocol");
        console.log(protocol)
      }
    });
  },
  methods: {
    stageLabel (stageType) {
      return LABEL_MAP[stageType];
    },
    selectStageAndStep () {
      if (this.protocol == null) {
        return;
      }
      this.stage = this.protocol.stages[this.progress.state.cycle];
      if (this.stage != null) {
        this.step = this.stage.steps[this.progress.state.step];
      } else {
        console.warn("this.stage is null")
      }
      this.stepElapsedSec = numeral(this.progress.state.stepElapsed/1000).format("0.00");
    },
    start : ()=>{ device.start(); },
    pause : ()=>{ device.pause(); },
    resume : ()=>{ device.resume(); },
    abort : ()=>{ device.abort(); },
    finish : ()=>{ device.finish(); }
    
  }
}
</script>
