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
        v-bind:class="{ 'progress-meter-item-current': progress.state.stage==index }">
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
        Stage {{ progress.state.stage+1 }}/{{ protocol.stages.length }}
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
      <div class="col-12">
        <meter
          min="0"
          :max="progress.remaining+progress.elapsed"
          :value="progress.elapsed"
          style="width:100%" />
        {{ progress.state.state }}
        Elapsed:{{ elapsedTime }} 
        Remaining:{{ remainingTime }} 
        Total: {{ totalTime }}
      </div>
    </div>
    <div>
      <template v-if="deviceState != null">
        <b-button pill v-if="deviceState.pauseAvailable" @click="pause" class="mr-1">Pause</b-button>
        <b-button pill v-if="deviceState.resumeAvailable" @click="resume" class="mr-1">Resume</b-button>
        <b-button pill v-if="deviceState.abortAvailable" @click="abort" class="mr-1">Abort</b-button>
        <b-button pill v-if="deviceState.finishAvailable" @click="finish" class="mr-1">Finish</b-button>
        <b-button pill v-if="deviceState.startAvailable" @click="start" class="mr-1">Start</b-button>
      </template>
    </div>
  </div>
</template>


<script>
import device from "../../lib/Device.js";
import Util from "../../lib/Util.js";
import Constants from "../../lib/constants.js";
var numeral = require('numeral');

let LABEL_MAP = {};
LABEL_MAP[Constants.StageType.HOLD] = "Hold";
LABEL_MAP[Constants.StageType.QPCR] = "qPCR";
LABEL_MAP[Constants.StageType.MELT_CURVE] = "Melt Curve";
LABEL_MAP[Constants.StageType.PCR] = "Normal PCR";

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
  computed: {
    elapsedTime: function () {
      return Util.humanTime(this.progress.elapsed/1000);
    },
    remainingTime: function () {
      return Util.humanTime(this.progress.remaining/1000);
    },
    totalTime: function () {
      return Util.humanTime((this.progress.remaining+this.progress.elapsed)/1000);
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
        let status = obj.to;
        if (obj.to == null) { return; }
        if (this.protocol == null) {
          return;
        }
        const stage = this.protocol.stages[status.stage];
        const step = stage.steps[status.step];
      }
    });
    device.addProgressHandler({
      onProgress:(progress)=>{
        this.progress = progress;
        // console.log(progress)
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
        // console.log(state);
        this.deviceState = state;
      },
      onUpdateProtocol: (protocol)=>{
        this.protocol = protocol;
        console.log("ProgressMonitor.onUpdateProtocol");
        // console.log(protocol)
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
      this.stage = this.protocol.stages[this.progress.state.stage];
      if (this.stage != null) {
        this.step = this.stage.steps[this.progress.state.step];
      } else {
        // TODO ignore this warning on preheating phase
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
