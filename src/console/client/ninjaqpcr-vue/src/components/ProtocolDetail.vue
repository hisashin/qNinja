<template>
  <div class="card" v-if="protocol!=null">
    <div class="card-header">
      Protocol
    </div>
    <div class="protocol" v-if="protocol!=null">
      <div class="protocol-header">
        <div>
          {{ protocol.name }}
        </div>
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
              <h3 class="protocol-stage-label">PCR Stage!{{stage.type}}</h3>
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
                  {{ stage.steps[0].speed }}℃/s
                </li>
                <li class="protocol-step">
                  <div class="protocol-step-label">
                    Cooling
                  </div>
                  {{ stage.steps[1].temp }}℃
                  {{ stage.steps[1].duration }}s
                  {{ stage.steps[1].speed }}℃/s
                </li>
                <li class="protocol-step">
                  <div class="protocol-step-label">
                    Melting
                  </div>
                  {{ stage.steps[2].temp }}℃
                  {{ stage.steps[2].duration }}s
                  {{ stage.steps[2].speed }}℃/s
                </li>
              </ul>
            </template>
          </li>
        </template>
      </ul>
    </div>
  </div>
</template>

<script>
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";

const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

let LABEL_MAP = {};
LABEL_MAP[STAGE_TYPE_HOLD] = "Hold";
LABEL_MAP[STAGE_TYPE_PCR] = "PCR";
LABEL_MAP[STAGE_TYPE_MELT_CURVE] = "Melt Curve";

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

const DEFAULT_STAGE_HOLD = { type: STAGE_TYPE_HOLD, 
  repeat:1, 
  steps:[ {label:"hold", temp:94, duration:15, data_collection:[]} ] };
const DEFAULT_STAGE_PCR = { type: STAGE_TYPE_PCR, 
  repeat:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"anneal", temp:55, duration:12, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"extend", temp:72, duration:18, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]} ] };
const DEFAULT_STAGE_MELT_CURVE = { type: STAGE_TYPE_MELT_CURVE, 
  repeat:1, 
  steps:[ {label:"denature", temp:94, duration:10, speed:4, data_collection:[]}, 
  {label:"cool", temp:55, duration:5, speed:4, data_collection:[]}, 
  {label:"melt", temp:94, duration:15, speed:0.05, data_collection:[MEASUREMENT_RAMP_CONTINUOUS]} ] };
  
export default {
  name: 'ProtocolDetail',
  components:{},
  data() {
    return {
    }
  },
  props: {
    id: { type:String },
    protocol: { type:Object },
  },
  created: function () {
    console.log("ProtocolDetail.created");
    // appState.addProtocolEventHandler(this);
  },
  methods: {
    back: function () {
      appState.backPanel();
    } /*,
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    }
    */
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
