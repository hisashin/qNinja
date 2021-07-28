<!-- Inside "detail-card__body" -->
<template>
  <div class="protocol-detail" v-if="protocol!=null">
    <div class="protocol-detail__header">
      <h3 class="protocol-detail__protocol-name">
        {{ protocol.name }}
      </h3>
      <div>
        Lid temp: {{ protocol.lid_temp }}
      </div>
      <div 
        v-if="protocol.final_hold_temp>0">
        Final hold temp: {{ protocol.final_hold_temp }}
      </div>
    </div>
    <ul class="protocol-detail-stages">
      <template v-for="(stage, index) in protocol.stages">
        <li :key="index" class="protocol-detail-stages__stage protocol-detail-stage">
          <template
            v-if="stage.type==1 && stage.steps.length>0">
            <h3 class="protocol-detail-stage__title">Hold</h3>
            <ul class="protocol-detail-steps">
              <li class="protocol-detail-steps__step protocol-detail-step">
                <div class="protocol-detail-step__label">
                  Hold
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[0].temp }}℃
                  {{ stage.steps[0].duration }}s
                </div>
              </li>
            </ul>
          </template>
          <template
            v-if="stage.type==2 && stage.steps.length>2">
            <h3 class="protocol-detail-stage__title">qPCR</h3>
            Repeat {{ stage.cycles }} times
            <ul class="protocol-detail-steps">
              <li v-for="(step, step_index) in stage.steps" class="protocol-detail-steps__step protocol-detail-step"
                v-bind:key="step_index">
                <div 
                  v-if="step_index==0">Denaturing</div>
                <div 
                  v-if="step_index==1">Annealing</div>
                <div 
                  v-if="step_index==2">Extending</div>
                <div class="protocol__steps__step__value">
                  {{ step.temp }}℃
                  {{ step.duration }}s
                  {{ step.ramp_speed }}℃/s
                </div>
                <div v-if="step.data_collection">
                  Collect data at 
                  <div v-if="step.data_collection.ramp_end">
                    ramp end
                  </div>
                  <div v-if="step.data_collection.hold_end">
                    hold end
                  </div>
                </div>
              </li>
            </ul>
          </template>
          <template
            v-if="stage.type==3 && stage.steps.length>2">
            <h3 class="protocol-detail-stage__title">Melt Curve</h3>
            <ul class="protocol-detail-steps">
              <li v-for="(step, step_index) in stage.steps" class="protocol-detail-steps__step protocol-detail-step"
                v-bind:key="step_index">
                <div v-if="step_index==0">Denaturing</div>
                <div v-if="step_index==1">Cooling</div>
                <div v-if="step_index==2">Melting</div>
                <div class="protocol__steps__step__value">
                  {{ step.temp }}℃
                  {{ step.duration }}s
                  {{ step.ramp_speed }}℃/s
                </div>
              </li>
            </ul>
          </template>
          <template
            v-if="stage.type==4 && stage.steps.length>2">
            <h3 class="protocol-detail-stage__title">Normal PCR</h3>
            Repeat {{ stage.cycles }} times
            <ul class="protocol-detail-steps">
              <li v-for="(step, step_index) in stage.steps" class="protocol-detail-steps__step protocol-detail-step"
                v-bind:key="step_index">
                <div v-if="step_index==0">Denaturing</div>
                <div v-if="step_index==1">Annealing</div>
                <div v-if="step_index==2">Extending</div>
                <div class="protocol__steps__step__value">
                  {{ step.temp }}℃
                  {{ step.duration }}s
                  {{ step.ramp_speed }}℃/s
                </div>
              </li>
            </ul>
          </template>
          <div class="protocol__stage__footer"
            v-if="stage.pause_after">Pause after the stage</div>
        </li>
      </template>
    </ul>
  </div>
</template>

<script>
import appState from "../lib/AppState.js";
import Constants from "../lib/constants.js";


let LABEL_MAP = {};
LABEL_MAP[Constants.StageType.HOLD] = "Hold";
LABEL_MAP[Constants.StageType.QPCR] = "qPCR";
LABEL_MAP[Constants.StageType.MELT_CURVE] = "Melt Curve";
LABEL_MAP[Constants.StageType.PCR] = "Normal PCR";

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;
  
export default {
  name: 'ProtocolDetail',
  components:{},
  data() {
    return {
      id:"",
      protocol:{}
    }
  },
  props: {
  },
  created: function () {
  },
  methods: {
    back: function () {
      appState.backPanel();
    },
    setProtocol: function (protocol) {
      this.protocol = protocol;
    }
  }
}
</script>

<style>
</style>
