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
          + Normal PCR (Without fluorescence)
        </b-button>
        <b-button
          variant="primary"
          block
          class="mr-1"
          @click="addQPCR()"
        >
          + qPCR
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
            Lid temp
            <input
              v-model.number="protocol.lid_temp"
              class="input-temp"
              type="number"
            >℃
          </div>
          <div>
            Final Hold Temp
            <input
              v-model.number="final_hold_temp"
              class="input-temp"
            >℃ (Optional)
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
              <template v-if="stage.type==2 || stage.type==4">
                <h3 class="protocol-stage-label">
                  <span v-if="stage.type==2">
                    qPCR Stage
                  </span>
                  <span v-if="stage.type==4">
                    Normal PCR Stage
                  </span>
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
                    <div v-if="stage.type==2">
                      Data Collection : 
                      <input type="checkbox" v-model="stage.steps[0].data_collection.ramp_end">
                      Ramp End
                      <input type="checkbox" v-model="stage.steps[0].data_collection.hold_end">
                      Hold End
                    </div>
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
                    <div v-if="stage.type==2">
                      Data Collection : 
                      <input type="checkbox" v-model="stage.steps[1].data_collection.ramp_end">
                      Ramp End
                      <input type="checkbox" v-model="stage.steps[1].data_collection.hold_end">
                      Hold End
                    </div>
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
                    <div v-if="stage.type==2">
                      Data Collection : 
                      <input type="checkbox" v-model="stage.steps[2].data_collection.ramp_end">
                      Ramp End
                      <input type="checkbox" v-model="stage.steps[2].data_collection.hold_end">
                      Hold End
                    </div>
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
                      v-model.number="stage.steps[0].ramp_speed"
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
                      v-model.number="stage.steps[1].ramp_speed"
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
                      v-model.number="stage.steps[2].ramp_speed"
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
            @click="submitUpdateProtocol"
            v-show="!isNew"
          >
            Save
          </b-button>
          <b-button
            variant="primary"
            @click="submitCreateProtocol"
            v-show="isNew"
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

const DEFAULT_STAGE_HOLD = { type: Constants.StageType.HOLD, 
  repeat:1, 
  steps:[ {label:"hold", temp:94, duration:15, data_collection:{}} ] };
const DEFAULT_STAGE_QPCR = { type: Constants.StageType.QPCR, 
  repeat:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:{"ramp_end":true, "hold_end":false, "ramp_continuous":false, "hold_continuous":false}}, 
  {label:"anneal", temp:55, duration:12, data_collection:{}}, 
  {label:"extend", temp:72, duration:18, data_collection:{}} ] };
const DEFAULT_STAGE_MELT_CURVE = { type: Constants.StageType.MELT_CURVE, 
  repeat:1, 
  steps:[ {label:"denature", temp:94, duration:10, ramp_speed:4, data_collection:{}}, 
  {label:"cool", temp:55, duration:5, ramp_speed:4, data_collection:[]}, 
  {label:"melt", temp:94, duration:15, ramp_speed:0.05, data_collection:{"ramp_end":false, "hold_end":false, "ramp_continuous":true, "hold_continuous":false}} ] };
const DEFAULT_STAGE_PCR = { type: Constants.StageType.PCR, 
  repeat:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:{}}, 
  {label:"anneal", temp:55, duration:12, data_collection:{}}, 
  {label:"extend", temp:72, duration:18, data_collection:{}} ] };
const NEW_PROTOCOL = {
  name: "New Protocol",
  lid_temp: 110,
  stages: [
  ]
};
export default {
  name: 'TheProtocolEditor',
  components:{},
  data() {
    return {
      id:"",
      protocol: NEW_PROTOCOL,
      /* Form management (Do not send them) */
      final_hold_temp: '', // Optional string
      addStagePosition:0,
      isNew: true
    }
  },
  created: function () {
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
    addQPCR: function () {
      console.log("addPCR");
      this.addStage(DEFAULT_STAGE_QPCR);
      this.$bvModal.hide('add-stage-modal');
    },
    addMeltCurve: function () {
      this.addStage(DEFAULT_STAGE_MELT_CURVE);
      this.$bvModal.hide('add-stage-modal');
    },
    back: function () {
      appState.backPanel();
    },
    submitUpdateProtocol: function () {
      // TODO validation
      const finalHoldTemp = parseFloat(this.final_hold_temp);
      if (finalHoldTemp > 0) {
        this.protocol.final_hold_temp = finalHoldTemp;
      } else {
        delete this.protocol.final_hold_temp;
      }
      appState.submitUpdateProtocol(this.$data, ()=>{
        appState.toast(this, "Save", "Saved.");
      });
    },
    submitCreateProtocol: function () {
      // TODO validation
      const finalHoldTemp = parseFloat(this.final_hold_temp);
      if (finalHoldTemp > 0) {
        this.protocol.final_hold_temp = finalHoldTemp;
      } else {
        delete this.protocol.final_hold_temp;
      }
      appState.submitCreateProtocol(this.$data.protocol, ()=>{
        appState.toast(this, "Save", "Saved.");
      });
    },
    startCreateProtocol: function () {
      this.protocol = NEW_PROTOCOL;
      this.id = null;
      this.isNew = true;
    },
    startEditProtocol: function (protocol) {
      this.protocol = protocol.protocol;
      if (this.protocol.final_hold_temp !=null && this.protocol.final_hold_temp > 0) {
        this.final_hold_temp = '' + this.protocol.final_hold_temp;
      } else {
        this.final_hold_temp = '';
      }
      this.id = protocol.id;
      this.isNew = false;
    },
    openAddStageModal (before) {
      this.$bvModal.show('add-stage-modal')
      this.addStagePosition = before;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
