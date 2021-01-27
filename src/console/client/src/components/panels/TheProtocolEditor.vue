<template>
  <div class="panel">
    <!-- Modal (Select stage type) -->
    <b-modal
      id="add-stage-modal"
      title="Add a Stage"
      hide-footer
    >
      <b-button
        variant="primary" block class="mr-1" @click="addHold()"
      >
        + Hold
      </b-button>
      <b-button
        variant="primary" block class="mr-1" @click="addPCR()"
      >
        + Normal PCR (Without fluorescence)
      </b-button>
      <b-button
        variant="primary" block class="mr-1" @click="addQPCR()"
      >
        + qPCR
      </b-button>
      <b-button variant="primary" block @click="addMeltCurve()"
      >
        + Melt Curve
      </b-button>
      <b-button
        class="mt-3" block @click="$bvModal.hide('add-stage-modal')"
      >
        Close
      </b-button>
    </b-modal>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Protocol Editor</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
        <!-- Variant: Detail card -->
        <div class="item item--detail-card">
          <!-- Editor here. -->
          <div class="protocol">
            <div class="protocol-header">
              <div>
                Name 
                <span :class="'validation-label validation__name'"/>
                <input
                  v-model.number="protocol.name" type="text" v-on:input="onChangeProtocol()"
                >
              </div>
              <div>
                Lid temp
                <span :class="'validation-label validation__lid_temp'"/>
                <input
                  v-model.number="protocol.lid_temp" v-on:input="onChangeProtocol()"
                  class="input-temp" type="number"
                >℃
              </div>
              <div>
                Final Hold Temp
                <span :class="'validation-label validation__final_hold_temp'"/>
                <input
                  v-model.number="final_hold_temp" v-on:input="onChangeProtocol()"
                  class="input-temp"
                >℃ (Optional)
                
              </div>
            </div>
            
            <span :class="'validation-label validation__stages'"/>
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
                      <span class="'validation-label validation__stages__' + index"/>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2" @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                      <input
                        v-model.number="stage.repeat" v-on:input="onChangeProtocol()"
                        type="hidden"
                        class="input-repeat"
                      > 
                    </h3>
                    <ul class="protocol-steps">
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Hold
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__temp'"/>
                        <input
                          v-model.number="stage.steps[0].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__duration'"/>
                        <input
                          v-model.number="stage.steps[0].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        
                      </li>
                    </ul>
                  </template>
                  <template v-if="stage.type==2 || stage.type==4">
                    <h3 class="protocol-stage-label">
                      <span v-if="stage.type==2">
                        qPCR Stage
                        <span :class="'validation-label validation__stages__'+index"/>
                      </span>
                      <span v-if="stage.type==4">
                        Normal PCR Stage
                        <span :class="'validation-label validation__stages__'+index"/>
                      </span>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2" @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                    </h3>
                    Repeat <span :class="'validation-label validation__stages__'+index+'__repeat'"/><input
                      v-model.number="stage.repeat" v-on:input="onChangeProtocol()"
                      type="number"
                      class="input-repeat"
                    > times
                    <ul class="protocol-steps">
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Denaturing
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__temp'"/><input
                          v-model.number="stage.steps[0].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__duration'"/>
                        <input
                          v-model.number="stage.steps[0].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[0].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
                        >℃/sec
                        
                        <div v-if="stage.type==2">
                          Data Collection : 
                          <span :class="'validation-label validation__stages__'+index+'__steps__0__data_collection'"/>
                          <input type="checkbox" v-model="stage.steps[0].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                          Ramp End
                          <input type="checkbox" v-model="stage.steps[0].data_collection.hold_end" v-on:change="onChangeProtocol()">
                          Hold End
                        </div>
                      </li>
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Annealing
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__temp'"/>
                        <input
                          v-model.number="stage.steps[1].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__duration'"/>
                        <input
                          v-model.number="stage.steps[1].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[1].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
                        >℃/sec
                        
                        <div v-if="stage.type==2">
                          Data Collection : 
                          <span :class="'validation-label validation__stages__'+index+'__steps__1__data_collection'"/>
                          <input type="checkbox" v-model="stage.steps[1].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                          Ramp End
                          <input type="checkbox" v-model="stage.steps[1].data_collection.hold_end" v-on:change="onChangeProtocol()">
                          Hold End
                        </div>
                      </li>
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Extending
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__temp'"/>
                        <input
                          v-model.number="stage.steps[2].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__duration'"/>
                        <input
                          v-model.number="stage.steps[2].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[2].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
                        >℃/sec
                        <div v-if="stage.type==2">
                          Data Collection : 
                          <span :class="'validation-label validation__stages__'+index+'__steps__2__data_collection'"/>
                          <input type="checkbox" v-model="stage.steps[2].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                          Ramp End
                          <input type="checkbox" v-model="stage.steps[2].data_collection.hold_end" v-on:change="onChangeProtocol()">
                          Hold End
                          
                        </div>
                      </li>
                    </ul>
                  </template>
                  <template v-if="stage.type==3">
                    <h3 class="protocol-stage-label">
                      Melt Curve Stage
                      <span :class="'validation-label validation__stages__'+index"/>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2"
                        @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                      <input
                        v-model.number="stage.repeat" v-on:input="onChangeProtocol()"
                        type="hidden"
                        class="input-repeat"
                      > 
                    </h3>
                    <ul class="protocol-steps">
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Denaturing
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__temp'"/>
                        <input
                          v-model.number="stage.steps[0].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__duration'"/>
                        <input
                          v-model.number="stage.steps[0].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__0__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[0].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
                        >℃/sec
                        
                      </li>
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Cooling
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__temp'"/>
                        <input
                          v-model.number="stage.steps[1].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__duration'"/>
                        <input
                          v-model.number="stage.steps[1].duration" v-on:input="onChangeProtocol()"
                          class="input-duration" type="number" step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__1__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[1].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
                        >℃/sec
                      </li>
                      <li class="protocol-step">
                        <div class="protocol-step-label">
                          Melting
                        </div>
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__temp'"/>
                        <input
                          v-model.number="stage.steps[2].temp" v-on:input="onChangeProtocol()"
                          class="input-temp" type="number"
                        >℃
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__duration'"/>
                        <input
                          v-model.number="stage.steps[2].duration" v-on:input="onChangeProtocol()"
                          class="input-duration"
                          type="number"
                          step="1"
                        >sec
                        <span :class="'validation-label validation__stages__'+index+'__steps__2__ramp_speed'"/>
                        <input
                          v-model.number="stage.steps[2].ramp_speed" v-on:input="onChangeProtocol()"
                          class="input-speed" type="number" step="1"
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
              <li class="protocol-stage">
                <!-- Footer empty cell -->
              </li>
            </ul>
          </div>
          <!-- Protocol End -->
        </div>
      </div>
      <nav class="section__nav section__nav--bottom">
        <div v-show="hasError">
          This protocol has some errors.
        </div>
        <b-button
          variant="primary"
          @click="submitUpdateProtocol"
          :disabled=hasError
          v-show="!isNew"
        >
          Save
        </b-button>
        <b-button
          variant="primary"
          @click="submitCreateProtocol"
          :disabled=hasError
          v-show="isNew"
        >
          Save
        </b-button>
        <b-button
          variant="secondary"
          @click="validateProtocol">
          Validate
        </b-button>
      </nav>
    

    </section>
  </div><!-- Panel -->
</template>

<script>
import network from "../../lib/Device.js";
import appState from "../../lib/AppState.js";
import client from "../../lib/RestClient.js";
import Constants from "../../lib/constants.js";

// const PROJ_ROOT_DIR = "../../../../../../";
import validator from "qpcr/protocol_validator.js";
// import validator from "../../lib/protocol_validator.js";

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
      isNew: true,
      lastUpdated: 0,
      hasError: false,
      isEdited: false
    }
  },
  created: function () {
  },
  watch: {
    protocol: function (val) {
    }
  },
  methods: {
    confirmDeleteStage: function (index) {
      if (window.confirm("Delete " + index + "?")) {
        this.protocol.stages.splice(index, 1);
      }
    },
    addStage(stage) {
      this.protocol.stages.splice(this.addStagePosition, 0, stage);
      this.onChangeProtocol();
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
    process422: function (content) {
      console.log("process422");
      if (content.data) {
        this.processValidationResult(content.data);
      }
    },
    submitUpdateProtocol: function () {
      const finalHoldTemp = parseFloat(this.final_hold_temp);
      if (finalHoldTemp > 0) {
        this.protocol.final_hold_temp = finalHoldTemp;
      } else {
        delete this.protocol.final_hold_temp;
      }
      client.submitUpdateProtocol(this.$data, ()=>{
        this.isEdited = false;
        appState.toast(this, "Save", "Saved.");
      }, (error)=>{
        if (error!=null && error.status == 422) {
          this.process422(error.content);
        }
      });
    },
    submitCreateProtocol: function () {
      const finalHoldTemp = parseFloat(this.final_hold_temp);
      if (finalHoldTemp > 0) {
        this.protocol.final_hold_temp = finalHoldTemp;
      } else {
        delete this.protocol.final_hold_temp;
      }
      client.submitCreateProtocol(this.$data.protocol, ()=>{
        this.isEdited = false;
        appState.toast(this, "Save", "Saved.");
      }, (error)=>{
        if (error!=null && error.status == 422) {
          this.process422(error.content);
        }
      });
    },
    _setMessage: function (selector, message) {
      let elements = document.querySelectorAll(selector);
      for (let i=0; i<elements.length; i++) {
        elements[i].innerHTML = message;
      }
      if (elements.length == 0) {
        console.warn("No element for selector %s", selector);
      }
    },
    processValidationResult: function (result) {
      this._setMessage(".validation-label", "");
      console.log(result)
      for (let item of result) {
        console.log("Path=" + this.pathToClassName(item.path));
        this._setMessage(this.pathToClassName(item.path), '<div class="validation-label__content">'+item.message+'</div>')
      }
      // this._setMessage(".validation-label", '<div class="validation-label__content">DEBUG</div>'); // For style debug
      this.hasError = (result.length > 0);
    },
    validateProtocol: function () {
      this.processValidationResult(validator.validate(this.$data.protocol));
    },
    pathToClassName: function(path) {
      return ".validation__" + path.join("__");
    },
    startCreateProtocol: function () {
      this.protocol = NEW_PROTOCOL;
      this.isEdited = false;
      this.id = null;
      this.isNew = true;
    },
    startEditProtocol: function (protocol) {
      this.protocol = protocol.protocol;
      this.isEdited = false;
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
    },
    onAppear () {
      console.log("TheProtocolEditor.onAppear()");
    },
    onChangeProtocol () {
      this.isEdited = true;
      const now = new Date();
      this.lastUpdated = now;
      setTimeout(()=>{
        if (now == this.lastUpdated) {
          this.validateProtocol();
        }
      }, 350);
    },
    confirmLeave (callback) {
      if (this.isEdited) {
        if (window.confirm("Are you sure you want to discard the changes?")) {
          callback();
        }
      } else {
        callback();
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
