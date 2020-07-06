<template>
  <div class="">
    <div class="card">
      <div class="card-header">
        Protocol Detail
      </div>
      <div class="p-3">
        <div>
          {{protocol.name}}
        </div>
        <div>
          Lid temp: {{protocol.lidTemp}}
        </div>
        <ul v-for="(stage, index) in protocol.stages">
          <li>
            <template v-if="stage.type==1">
              <h3>Hold Stage</h3>
              <ul>
                <li>
                  {{stage.steps[0].temp}}℃
                  {{stage.steps[0].duration}}s
                </li>
              </ul>
            </template>
            <template v-if="stage.type==2">
              <h3>PCR Stage</h3>
              Repeat {{stage.repeat}} times
              <ul>
                <li>
                  Denaturing
                  {{stage.steps[0].temp}}℃
                  {{stage.steps[0].duration}}s
                </li>
                <li>
                  Annealing
                  {{stage.steps[1].temp}}℃
                  {{stage.steps[1].duration}}s
                </li>
                <li>
                  Extending
                  {{stage.steps[2].temp}}℃
                  {{stage.steps[2].duration}}s
                </li>
              </ul>
            </template>
            <template v-if="stage.type==3">
              <h3>Melt Curve Stage</h3>
              <ul>
                <li>
                  Denaturing
                  {{stage.steps[0].temp}}℃
                  {{stage.steps[0].duration}}s
                  {{stage.steps[0].speed}}℃/s
                </li>
                <li>
                  Cooling
                  {{stage.steps[1].temp}}℃
                  {{stage.steps[1].duration}}s
                  {{stage.steps[1].speed}}℃/s
                </li>
                <li>
                  Melting
                  {{stage.steps[2].temp}}℃
                  {{stage.steps[2].duration}}s
                  {{stage.steps[2].speed}}℃/s
                </li>
              </ul>
            </template>
          </li>
        </ul>
      </div>
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
      id:"",
      protocol: {
        name: "New Protocol",
        lidTemp: 110,
        stages: [
        ]
      }
    }
  },
  methods: {
    back: function () {
      appState.backPanel();
    },
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    }
  },
  created: function () {
    console.log("ProtocolDetail.created");
    appState.addProtocolEventHandler(this);
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
}
a {
  color: #42b983;
}
</style>
