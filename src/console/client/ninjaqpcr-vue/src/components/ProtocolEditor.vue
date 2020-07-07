<template>
  <div class="">
    <div class="card">
      <div class="card-header">
        Protocol Editor
      </div>
      <!-- Modal (Select stage type) -->
      <b-modal
        id="add-stage-modal"
        title="Add a Stage"
        hide-footer
      >
        <b-button
          variant="primary"
          block
          class="mr-1"
          @click="addHold()"
        >
          + Hold
        </b-button>
        <b-button
          variant="primary"
          block
          class="mr-1"
          @click="addPCR()"
        >
          + PCR
        </b-button>
        <b-button
          variant="primary"
          block
          @click="addMeltCurve()"
        >
          + Melt Curve
        </b-button>
        <b-button
          class="mt-3"
          block
          @click="$bvModal.hide('add-stage-modal')"
        >
          Close
        </b-button>
      </b-modal>
      <div class="protocol">
        <div class="protocol-header">
          <div>
            Name <input
              v-model.number="protocol.name"
              type="text"
            >
          </div>
          <div>
            Lid temp <input
              v-model.number="protocol.lid_temp"
              class="input-temp"
              type="number"
            >
          </div>
        </div>
        <ul class="protocol-stages">
          <template v-for="(stage, index) in protocol.stages" >
            <li class="protocol-stage-add" :key="index + '_add'">
              <b-button
                pill
                @click="openAddStageModal(index)"
              >
                Add
              </b-button>
            </li>
            <li class="protocol-stage" :key="index + '_stage'">
              <template v-if="stage.type==1">
                <h3 class="protocol-stage-label">
                  Hold Stage
                  <b-button
                    size="sm"
                    variant="outline-danger"
                    class="ml-2"
                    @click="confirmDelete(index)"
                  >
                    Delete
                  </b-button>
                </h3>
                <ul class="protocol-steps">
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Hold
                    </div>
                    <input
                      v-model.number="stage.steps[0].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[0].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                  </li>
                </ul>
              </template>
              <template v-if="stage.type==2">
                <h3 class="protocol-stage-label">
                  PCR Stage
                  <b-button
                    size="sm"
                    variant="outline-danger"
                    class="ml-2"
                    @click="confirmDelete(index)"
                  >
                    Delete
                  </b-button>
                </h3>
                Repeat <input
                  v-model.number="stage.repeat"
                  type="number"
                  class="input-repeat"
                > times
                <ul class="protocol-steps">
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Denaturing
                    </div>
                    <input
                      v-model.number="stage.steps[0].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[0].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                  </li>
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Annealing
                    </div>
                    <input
                      v-model.number="stage.steps[1].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[1].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                  </li>
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Extending
                    </div>
                    <input
                      v-model.number="stage.steps[2].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[2].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                  </li>
                </ul>
              </template>
              <template v-if="stage.type==3">
                <h3 class="protocol-stage-label">
                  Melt Curve Stage
                  <b-button
                    size="sm"
                    variant="outline-danger"
                    class="ml-2"
                    @click="confirmDelete(index)"
                  >
                    Delete
                  </b-button>
                </h3>
                <ul class="protocol-steps">
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Denaturing
                    </div>
                    <input
                      v-model.number="stage.steps[0].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[0].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                    <input
                      v-model.number="stage.steps[0].speed"
                      class="input-speed"
                      type="number"
                      step="1"
                    >℃/sec
                  </li>
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Cooling
                    </div>
                    <input
                      v-model.number="stage.steps[1].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[1].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                    <input
                      v-model.number="stage.steps[1].speed"
                      class="input-speed"
                      type="number"
                      step="1"
                    >℃/sec
                  </li>
                  <li class="protocol-step">
                    <div class="protocol-step-label">
                      Melting
                    </div>
                    <input
                      v-model.number="stage.steps[2].temp"
                      class="input-temp"
                      type="number"
                    >℃
                    <input
                      v-model.number="stage.steps[2].duration"
                      class="input-duration"
                      type="number"
                      step="1"
                    >sec
                    <input
                      v-model.number="stage.steps[2].speed"
                      class="input-speed"
                      type="number"
                      step="1"
                    >℃/sec
                  </li>
                </ul>
              </template>
            </li>
          </template>
          <li class="protocol-stage-add">
            <b-button
              pill
              @click="openAddStageModal(protocol.stages.length)"
            >
              Add
            </b-button>
          </li>
        </ul>
        <div class="protocol-footer">
          <b-button
            variant="primary"
            @click="save"
          >
            Save
          </b-button>
        </div>
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
  name: 'ProtocolEditor',
  components:{},
  data() {
    return {
      id:"",
      protocol: {
        name: "New Protocol",
        lid_temp: 110,
        stages: [
        ]
      },
      /* Form management (Do not send them) */
      addStagePosition:0
    }
  },
  created: function () {
    console.log("ExperimentMonitor.created");
    appState.addProtocolEventHandler(this);
  },
  methods: {
    confirmDelete: function (index) {
      if (window.confirm("Delete " + index + "?")) {
        this.protocol.stages.splice(index, 1);
      }
    },
    addStage(stage) {
      this.protocol.stages.splice(this.addStagePosition, 0, stage);
    },
    addHold: function () {
      this.addStage(DEFAULT_STAGE_HOLD);
      this.$bvModal.hide('add-stage-modal');
    },
    addPCR: function () {
      console.log("addPCR");
      this.addStage(DEFAULT_STAGE_PCR);
      this.$bvModal.hide('add-stage-modal');
    },
    addMeltCurve: function () {
      this.addStage(DEFAULT_STAGE_MELT_CURVE);
      this.$bvModal.hide('add-stage-modal');
    },
    back: function () {
      appState.backPanel();
    },
    save: function () {
      appState.saveProtocol(this.$data, ()=>{
        console.log("(Toast)");
      });
    },
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    },
    openAddStageModal (before) {
      console.log("openAddStageModal(%d)", before);
      this.$bvModal.show('add-stage-modal')
      this.addStagePosition = before;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
