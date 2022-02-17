<template>
  <div style="width:100%">
    <div v-if="protocol==null">Protocol is null</div>
    <div v-if="progress==null">Progress is null</div>
    <div v-if="deviceState==null">DeviceState is null</div>
    <div class="progress-monitor"
      v-if="protocol!=null && progress!=null && deviceState != null">
      <!-- Modal dialog to finish the experiment -->
      <b-modal
        id="finish-modal"
        title="The experiment is complete"
        hide-footer
      >
        <b-button 
          variant="primary"
          block @click="finish"
        >
          Stop the device
        </b-button>
      </b-modal>
      <!-- Modal dialog to show the experiment result -->
      <b-modal
        id="result-modal"
        title="The experiment is complete!"
        hide-footer
      >
        <b-button 
          variant="primary"
          block @click="home"
        >
          Home
        </b-button>
        <b-button 
          variant="primary"
          block @click="result"
        >
          Result
        </b-button>
      </b-modal>
      <div class="progress-monitor__row">
        <ul class="progress-meter">
          <li 
            class="progress-meter__item"
            v-bind:class="{ 'progress-meter__item--current': progress.state.state=='preheat','progress-meter__item--done': progress.state.state!='preheat' }">
              <span class="progress-meter__item progress-meter__label">Preheat</span>
            </li>
          <li 
            class="progress-meter__item"
            v-for="(stage, index) in protocol.stages" :key="index" 
            v-bind:class="{ 'progress-meter__item--notyet': progress.state.stage<index,'progress-meter__item--current': progress.state.stage==index,'progress-meter__item--done': progress.state.stage>index }">
            <span class="progress-meter__item progress-meter__label">{{ stageLabel(stage.type) }}</span>
            <div
              v-if="progress.state.stage==index" class="progress-meter__item progress-meter__progress" v-bind:style="{width: (100*progress.state.cycle/stage.cycles) + '%'}"></div>
            <div
              v-if="progress.state.stage==index" class="progress-meter__item progress-meter__detail">
              {{ progress.state.cycle+1 }}<template
                v-if="stage!=null">/{{stage.cycles}}</template> {{ progress.state.state }}</div>
          </li>
          <li
            class="progress-meter__item"
            v-bind:class="{ 'progress-meter__item--current': progress.state.state=='complete', 'progress-meter__item--notyet': progress.state.state!='complete' }">
            <span class="progress-meter__item progress-meter__label">Final Hold</span>
          </li>
        </ul>
      </div>
      
      <div class="progress-monitor__row">
        <div class="temperature-monitor">
          <div class="temperature-monitor__label">
            Plate
            <div class="temperature-monitor__value">{{ plateTemp }} 
            <template 
              v-if="step!=null && step.temp!=null">/{{step.temp}}℃</template>
            </div>
          </div>
          <div class="temperature-monitor__meter">
            <meter class="temperature-monitor__meter-body"
              min="20"
              max="100"
              :value="progress.plate"></meter>
            <div class="temperature-monitor__meter-scale">
              <div class="temperature-monitor__meter-scale-element">20</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">40</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">60</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">80</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">100</div>
            </div>
          </div>
        </div>
        <div class="temperature-monitor">
          <div class="temperature-monitor__label">
            Lid
            <div class="temperature-monitor__value">{{ lidTemp }}/{{protocol.lid_temp}}℃</div>
          </div>
          <div class="temperature-monitor__meter">
            <meter class="temperature-monitor__meter-body"
              min="20"
              :value="progress.lid"
              max="120"></meter>
            <div class="temperature-monitor__meter-scale">
              <div class="temperature-monitor__meter-scale-element">20</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">40</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">60</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">80</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">100</div>
              <div class="temperature-monitor__meter-scale-spacer"></div>
              <div class="temperature-monitor__meter-scale-element">120</div>
            </div>
          </div>
        </div>
      </div>
      <div class="progress-monitor__row" v-if="progress.state.state!='complete'">
        <div class="time-monitor">
          <div class="time-monitor__elapsed">{{ elapsedTime }} </div>
          <div class="time-monitor__estimated"> / {{ totalTime }}</div>
          <div class="time-monitor__remaining"> ({{ remainingTime }} left)</div>
          <meter class="time-monitor__meter" 
            min="0"
            :max="progress.remaining+progress.elapsed"
            :value="progress.elapsed"></meter>
          
          <template v-if="deviceState != null">
          <button class="time-monitor__button" v-if="deviceState.pauseAvailable" @click="pause">Pause</button>
          <button class="time-monitor__button" v-if="deviceState.resumeAvailable" @click="resume">Resume</button>
          <button class="time-monitor__button" v-if="deviceState.cancelAvailable" @click="cancel">Cancel</button>
          <button class="time-monitor__button" v-if="deviceState.finishAvailable" @click="finish">Finish</button>
          <!--<button class="time-monitor__button" v-if="deviceState.startAvailable" @click="start">Start</button>-->
          </template>
          
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import device from "../../lib/Device.js";
import appState from "../../lib/AppState.js";
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
      stepElapsedSec: "",
      elapsedTime: "-",
      remainingTime: "-",
      totalTime: "-",
      plateTemp: "-",
    }
  },
  computed: {
  },
  created: function () {
    device.subscribe("experiment.update.progress", (topic, data, id)=>{
      this.applyProgress(data);
    });
    device.subscribe("device.update.transition", (topic, obj, id)=>{
        let status = obj.to;
        if (obj.to == null) { return; }
        if (this.protocol == null) {
          return;
        }
    });
    device.protocol.observe((protocol)=>{
        this.protocol = protocol;

    });
    device.deviceState.observe((state)=>{
      this.closeModals(); 
      if (this.deviceState && !this.deviceState.finishAvailable && state.finishAvailable) {
        this.$bvModal.show('finish-modal');
      }
      if (this.deviceState && this.deviceState.hasExperiment && !state.hasExperiment) {
        // The device become "idle"
        this.$bvModal.show('result-modal');
      }
      this.deviceState = state;
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
      } else if (this.progress.state.state!='preheat') {
          console.warn("this.stage is null");
      }
      this.stepElapsedSec = numeral(this.progress.state.stepElapsed/1000).format("0.00");
    },
    reset () {
      this.closeModals(); 
    },
    applyProgress : function (progress) {
      this.progress = progress;
      
      this.elapsedTime = Util.humanTime(this.progress.elapsed/1000);
      this.remainingTime = Util.humanTime(this.progress.remaining/1000);
      this.totalTime = Util.humanTime((this.progress.remaining+this.progress.elapsed)/1000);
      this.plateTemp = (this.progress) ? Math.round(this.progress.plate) : "-";
      this.lidTemp = (this.progress) ? Math.round(this.progress.lid) : "-";
      if (progress.state) {
        this.selectStageAndStep();
      }
    },
    pause () { device.pause(); },
    resume () { device.resume(); },
    cancel () { 
      if (window.confirm("Are you sure you want to cancel the experiment?")) {
        device.cancel(); 
        appState.home();
      }
    },
    finish () { 
      device.finish();
    },
    home () { 
      this.closeModals(); 
      appState.home();
    },
    result () {
      this.closeModals(); 
      appState.revealDetailLatestExperiment(this);
    },
    closeModals () {
      this.$bvModal.hide('finish-modal');
      this.$bvModal.hide('result-modal');
    }
    
  }
}
</script>
