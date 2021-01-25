<template>
  <div class="protocol" v-if="protocol!=null">
    <div class="protocol-header">
      <h3>
        {{ protocol.name }}
      </h3>
      <div>
        Lid temp: {{ protocol.lid_temp }}
      </div>
    </div>
    <ul class="protocol-stages">
      <template v-for="(stage, index) in protocol.stages">
        <li :key="index" class="protocol-stage">
          <template v-if="stage.type==1 && stage.steps.length>0">
            <h3 class="protocol-stage-label">Hold Stage</h3>
            <ul class="protocol-steps">
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Hold
                </div>
                {{ stage.steps[0].temp }}℃
                {{ stage.steps[0].duration }}s
              </li>
            </ul>
          </template>
          <template v-if="stage.type==2 && stage.steps.length>2">
            <h3 class="protocol-stage-label">qPCR Stage</h3>
            Repeat {{ stage.repeat }} times
            <ul class="protocol-steps">
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Denaturing
                </div>
                {{ stage.steps[0].temp }}℃
                {{ stage.steps[0].duration }}s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Annealing
                </div>
                {{ stage.steps[1].temp }}℃
                {{ stage.steps[1].duration }}s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Extending
                </div>
                {{ stage.steps[2].temp }}℃
                {{ stage.steps[2].duration }}s
              </li>
            </ul>
          </template>
          <template v-if="stage.type==3 && stage.steps.length>2">
            <h3 class="protocol-stage-label">Melt Curve Stage</h3>
            <ul class="protocol-steps">
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Denaturing
                </div>
                {{ stage.steps[0].temp }}℃
                {{ stage.steps[0].duration }}s
                {{ stage.steps[0].ramp_speed }}℃/s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Cooling
                </div>
                {{ stage.steps[1].temp }}℃
                {{ stage.steps[1].duration }}s
                {{ stage.steps[1].ramp_speed }}℃/s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Melting
                </div>
                {{ stage.steps[2].temp }}℃
                {{ stage.steps[2].duration }}s
                {{ stage.steps[2].ramp_speed }}℃/s
              </li>
            </ul>
          </template>
          <template v-if="stage.type==4 && stage.steps.length>2">
            <h3 class="protocol-stage-label">Normal PCR Stage</h3>
            Repeat {{ stage.repeat }} times
            <ul class="protocol-steps">
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Denaturing
                </div>
                {{ stage.steps[0].temp }}℃
                {{ stage.steps[0].duration }}s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Annealing
                </div>
                {{ stage.steps[1].temp }}℃
                {{ stage.steps[1].duration }}s
              </li>
              <li class="protocol-step">
                <div class="protocol-step-label">
                  Extending
                </div>
                {{ stage.steps[2].temp }}℃
                {{ stage.steps[2].duration }}s
              </li>
            </ul>
          </template>
        </li>
      </template>
    </ul>
  </div>
</template>

<script>
import network from "../lib/Device.js";
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
