<!-- Inside "detail-card__body" -->
<template>
  <div class="protocol-detail" v-if="protocol!=null">
    <div class="protocol-detail__header">
      <h3 class="protocol-detail__protocol-name">
        {{ protocol.name }}
      </h3>
      <div class="protocol-detail__protocol-conf">
        <span>
          Lid {{ protocol.lid_temp }}℃
        </span>
        <span 
          v-if="protocol.final_hold_temp>0">
          Final hold {{ protocol.final_hold_temp }}℃
        </span>
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
                <div class="protocol-detail-step__values protocol-detail-values">
                  <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                  {{ stage.steps[0].temp }}℃
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                  {{ stage.steps[0].duration }}s
                  </div>
                </div>
              </li>
            </ul>
          </template>
          <template
            v-if="stage.type==2 && stage.steps.length>2">
            <h3 class="protocol-detail-stage__title">qPCR</h3>
            {{ stage.cycles }} cycles
            <ul class="protocol-detail-steps">
              <li v-for="(step, step_index) in stage.steps" class="protocol-detail-steps__step protocol-detail-step"
                v-bind:key="step_index">
                <div 
                  v-if="step_index==0" class="protocol-detail-step__label">Denaturing</div>
                <div 
                  v-if="step_index==1" class="protocol-detail-step__label">Annealing</div>
                <div 
                  v-if="step_index==2" class="protocol-detail-step__label">Extending</div>
                <div class="protocol-detail-step__values protocol-detail-values">
                  <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                  {{ step.temp }}℃
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                  {{ step.duration }}s
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                    <span v-if="step.ramp_speed>0">
                      {{ step.ramp_speed }}℃/s
                    </span>
                  </div>
                </div>
                <div v-if="step.data_collection && step.data_collection.ramp_end" class="protocol-detail-step__data-collection">
                  Collect data at ramp end
                </div>
                <div v-if="step.data_collection && step.data_collection.hold_end" class="protocol-detail-step__data-collection">
                  Collect data at hold end
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
                <div v-if="step_index==0" class="protocol-detail-step__label">Denaturing</div>
                <div v-if="step_index==1" class="protocol-detail-step__label">Cooling</div>
                <div v-if="step_index==2" class="protocol-detail-step__label">Melting</div>
                <div class="protocol-detail-step__values protocol-detail-values">
                  <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                  {{ step.temp }}℃
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                  {{ step.duration }}s
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                    <span v-if="step.ramp_speed>0">
                      {{ step.ramp_speed }}℃/s
                    </span>
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                    <span v-if="step.data_collection.measurement_interval_temp>0">
                      {{ step.data_collection.measurement_interval_temp }}℃
                    </span>
                  </div>
                </div>
              </li>
            </ul>
          </template>
          <template
            v-if="stage.type==4 && stage.steps.length>2">
            <h3 class="protocol-detail-stage__title">Normal PCR</h3>
            {{ stage.cycles }} cycles
            <ul class="protocol-detail-steps">
              <li v-for="(step, step_index) in stage.steps" class="protocol-detail-steps__step protocol-detail-step"
                v-bind:key="step_index">
                <div v-if="step_index==0" class="protocol-detail-step__label">Denaturing</div>
                <div v-if="step_index==1" class="protocol-detail-step__label">Annealing</div>
                <div v-if="step_index==2" class="protocol-detail-step__label">Extending</div>
                <div class="protocol-detail-step__values protocol-detail-values">
                  <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                  {{ step.temp }}℃
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                  {{ step.duration }}s
                  </div>
                  <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                    <span v-if="step.ramp_speed>0">
                      {{ step.ramp_speed }}℃/s
                    </span>
                  </div>
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

