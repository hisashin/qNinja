<!-- Inside "detail-card__body" -->
<template>
  <div class="protocol" v-if="protocol!=null">
    <div class="protocol__header">
      <h3 class="protocol__header__name">
        {{ protocol.name }}
      </h3>
      <div>
        Lid temp: {{ protocol.lid_temp }}
      </div>
    </div>
    <ul class="protocol__stages">
      <template v-for="(stage, index) in protocol.stages">
        <li :key="index" class="protocol__stage">
          <template v-if="stage.type==1 && stage.steps.length>0">
            <h3 class="protocol__stage__title">Hold Stage</h3>
            <ul class="protocol__steps">
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Hold
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[0].temp }}℃
                  {{ stage.steps[0].duration }}s
                </div>
              </li>
            </ul>
          </template>
          <template v-if="stage.type==2 && stage.steps.length>2">
            <h3 class="protocol__stage__title">qPCR Stage</h3>
            Repeat {{ stage.cycles }} times
            <ul class="protocol__steps">
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Denaturing
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[0].temp }}℃
                  {{ stage.steps[0].duration }}s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Annealing
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[1].temp }}℃
                  {{ stage.steps[1].duration }}s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Extending
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[2].temp }}℃
                  {{ stage.steps[2].duration }}s
                </div>
              </li>
            </ul>
          </template>
          <template v-if="stage.type==3 && stage.steps.length>2">
            <h3 class="protocol__stage__title">Melt Curve Stage</h3>
            <ul class="protocol__steps">
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Denaturing
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[0].temp }}℃
                  {{ stage.steps[0].duration }}s
                  {{ stage.steps[0].ramp_speed }}℃/s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Cooling
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[1].temp }}℃
                  {{ stage.steps[1].duration }}s
                  {{ stage.steps[1].ramp_speed }}℃/s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Melting
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[2].temp }}℃
                  {{ stage.steps[2].duration }}s
                  {{ stage.steps[2].ramp_speed }}℃/s
                </div>
              </li>
            </ul>
          </template>
          <template v-if="stage.type==4 && stage.steps.length>2">
            <h3 class="protocol__stage__title">Normal PCR Stage</h3>
            Repeat {{ stage.cycles }} times
            <ul class="protocol__steps">
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Denaturing
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[0].temp }}℃
                  {{ stage.steps[0].duration }}s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Annealing
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[1].temp }}℃
                  {{ stage.steps[1].duration }}s
                </div>
              </li>
              <li class="protocol__steps__step">
                <div class="protocol__steps__step__label">
                  Extending
                </div>
                <div class="protocol__steps__step__value">
                  {{ stage.steps[2].temp }}℃
                  {{ stage.steps[2].duration }}s
                </div>
              </li>
            </ul>
          </template>
          <div class="protocol__stage__footer" v-if="stage.pause_after">Pause after the stage</div>
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
