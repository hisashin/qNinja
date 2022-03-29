<template>
  <div class="panel panel--protocol-editor">
    <div class="panel__menu">
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
        class="ml-1"
        @click="submitCreateProtocol"
        :disabled=hasError
        v-show="isNew"
      >
        Save
      </b-button>
      <b-button
        variant="secondary"
        class="ml-1"
        @click="validateProtocol">
        Validate
      </b-button>
    </div>
    <!-- Modal (Select stage type) -->
    <b-modal
      id="add-stage-modal"
      title="+ New Stage"
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
      <div class="section__body">
        <!-- Variant: Detail card -->
        <div class="item paragraph">
          <!-- Editor here. -->
          <div class="protocol-editor">
            <div class="protocol-editor__header">
              <div>
                Name 
                <span :class="'validation-label validation__name'"/>
                <input
                  v-model="protocol.name" type="text" v-on:input="onChangeProtocol()"
                >
              </div>
              <div>
                Lid
                <span :class="'validation-label validation__lid_temp'"/>
                <input
                  v-model.number="protocol.lid_temp" v-on:input="onChangeProtocol()"
                  class="input-temp input-temp--3" type="number"
                >℃
              </div>
              <div>
                Final Hold
                <span :class="'validation-label validation__final_hold_temp'"/>
                <input
                  v-model.number="final_hold_temp" v-on:input="onChangeProtocol()"
                  class="input-temp input-temp--2"
                >℃ (Optional)
                
              </div>
            </div>
            <div v-show="hasError">
              This protocol has some errors.
            </div>
            
            <span :class="'validation-label validation__stages'"/>
            <div class="protocol-editor-stages-wrapper">
            <ul class="protocol-editor-stages">
              <template v-for="(stage, index) in protocol.stages" >
                <li class="protocol-editor-stages__add-button" :key="index + '_add'">
                  <button class="round-button"
                    @click="openAddStageModal(index)"
                  >
                    +
                  </button>
                </li>
                <li class="protocol-editor-stages__stage protocol-editor-stage" :key="index + '_stage'">
                  <template v-if="stage.type==1">
                    <h3 class="protocol-editor-stage__title">
                      Hold
                      <span class="'validation-label validation__stages__' + index"/>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2" @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                      <input
                        v-model.number="stage.cycles" v-on:input="onChangeProtocol()"
                        type="hidden"
                        class="input-cycles"
                      > 
                    </h3>
                    <ul class="protocol-editor-steps">
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
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
                    <h3 class="protocol-editor-stage__title">
                      <span v-if="stage.type==2">
                        qPCR
                        <span :class="'validation-label validation__stages__'+index"/>
                      </span>
                      <span v-if="stage.type==4">
                        Normal PCR
                        <span :class="'validation-label validation__stages__'+index"/>
                      </span>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2" @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                    </h3>
                    <span :class="'validation-label validation__stages__'+index+'__cycles'"/><input
                      v-model.number="stage.cycles" v-on:input="onChangeProtocol()"
                      type="number"
                      class="input-cycles"
                    > cycles
                    <ul class="protocol-editor-steps">
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Denaturing
                        </div>
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__temp'"/><input
                              v-model.number="stage.steps[0].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__duration'"/>
                            <input
                              v-model.number="stage.steps[0].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3" type="number" step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[0].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        
                        <div v-if="stage.type==2" class="protocol-detail-step__data-collection">
                          &#128248;
                          <span :class="'validation-label validation__stages__'+index+'__steps__0__data_collection'"/>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[0].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                            Ramp End
                          </label>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[0].data_collection.hold_end" v-on:change="onChangeProtocol()">
                            Hold End
                          </label>
                        </div>
                      </li>
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Annealing
                        </div>
                        
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__temp'"/>
                            <input
                              v-model.number="stage.steps[1].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__duration'"/>
                            <input
                              v-model.number="stage.steps[1].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3" type="number" step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[1].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        
                        <div v-if="stage.type==2" class="protocol-detail-step__data-collection">
                          &#128248;
                          <span :class="'validation-label validation__stages__'+index+'__steps__1__data_collection'"/>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[1].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                            Ramp End
                          </label>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[1].data_collection.hold_end" v-on:change="onChangeProtocol()">
                            Hold End
                          </label>
                        </div>
                      </li>
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Extending
                        </div>
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__temp'"/>
                            <input
                              v-model.number="stage.steps[2].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__duration'"/>
                            <input
                              v-model.number="stage.steps[2].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3" type="number" step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[2].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        
                        <div class="protocol-detail-step__data-collection">
                          &#128248;
                          <span :class="'validation-label validation__stages__'+index+'__steps__2__data_collection'"/>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[2].data_collection.ramp_end" v-on:change="onChangeProtocol()">
                            Ramp End
                          </label>
                          <label>
                            <input type="radio" :name="'data_collection'+index" v-model="stage.steps[2].data_collection.hold_end" v-on:change="onChangeProtocol()">
                            Hold End
                          </label>
                        </div>
                      </li>
                    </ul>
                  </template>
                  <template v-if="stage.type==3">
                    <h3 class="protocol-editor-stage__title">
                      Melt Curve
                      <span :class="'validation-label validation__stages__'+index"/>
                      <b-button
                        size="sm"
                        variant="outline-danger" class="ml-2"
                        @click="confirmDeleteStage(index)"
                      >
                        Delete
                      </b-button>
                      <input
                        v-model.number="stage.cycles" v-on:input="onChangeProtocol()"
                        type="hidden"
                        class="input-cycles"
                      > 
                    </h3>
                    <ul class="protocol-editor-steps">
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Denaturing
                        </div>
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__temp'"/>
                            <input
                              v-model.number="stage.steps[0].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__duration'"/>
                            <input
                              v-model.number="stage.steps[0].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3" type="number" step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__0__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[0].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        
                      </li>
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Cooling
                        </div>
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__temp'"/>
                            <input
                              v-model.number="stage.steps[1].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__duration'"/>
                            <input
                              v-model.number="stage.steps[1].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3" type="number" step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__1__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[1].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        
                      </li>
                      <li class="protocol-editor-steps__step protocol-editor-step">
                        <div class="protocol-editor-step__label">
                          Melting
                        </div>
                        <div class="protocol-detail-step__values protocol-detail-values">
                          <div class="protocol-detail-values__value protocol-detail-values__value--temp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__temp'"/>
                            <input
                              v-model.number="stage.steps[2].temp" v-on:input="onChangeProtocol()"
                              class="input-temp input-temp--2" type="number"
                            >℃
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--duration">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__duration'"/>
                            <input
                              v-model.number="stage.steps[2].duration" v-on:input="onChangeProtocol()"
                              class="input-duration input-duration--3"
                              type="number"
                              step="1"
                            >sec
                          </div>
                          <div class="protocol-detail-values__value protocol-detail-values__value--ramp">
                            <span :class="'validation-label validation__stages__'+index+'__steps__2__ramp_speed'"/>
                            <input
                              v-model.number="stage.steps[2].ramp_speed" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number"
                            >℃/sec
                          </div>
                        </div>
                        Measurement Interval <input
                              v-model.number="stage.steps[2].data_collection.measurement_interval_temp" v-on:input="onChangeProtocol()"
                              class="input-speed" type="number" step="0.1"
                            >℃
                        
                      </li>
                    </ul>
                  </template>
                  <div class="protocol__stage__footer">
                    <span :class="'validation-label validation__stages__'+index+'__pause_after'"/>
                    <label><input type="checkbox" v-model="stage.pause_after" v-on:change="onChangeProtocol()">Pause after the stage</label>
                  </div>
                </li>
              </template>
              <li class="protocol-editor-stages__add-button">
                <button type="button" class="round-button"
                  @click="openAddStageModal(protocol.stages.length)"
                >
                  +
                </button>
              </li>
            </ul>
            </div>
          </div>
          <!-- Protocol End -->
        </div>
      </div>
    </section>
  </div><!-- Panel -->
</template>

<script>
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
  cycles:1, 
  steps:[ {label:"hold", temp:94, duration:15, data_collection:{}} ] };
const DEFAULT_STAGE_QPCR = { type: Constants.StageType.QPCR, 
  cycles:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:{"ramp_end":true, "hold_end":false, "ramp_continuous":false, "hold_continuous":false}}, 
  {label:"anneal", temp:55, duration:12, data_collection:{}}, 
  {label:"extend", temp:72, duration:18, data_collection:{}} ] };
const DEFAULT_STAGE_MELT_CURVE = { type: Constants.StageType.MELT_CURVE, 
  cycles:1, 
  steps:[ {label:"denature", temp:94, duration:10, ramp_speed:4, data_collection:{}}, 
  {label:"cool", temp:55, duration:5, ramp_speed:4, data_collection:[]}, 
  {label:"melt", temp:94, duration:15, ramp_speed:0.05, data_collection:{"ramp_end":false, "hold_end":false, "ramp_continuous":true, "measurement_interval_temp":0.5, "hold_continuous":false}} ] };
const DEFAULT_STAGE_PCR = { type: Constants.StageType.PCR, 
  cycles:30, 
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
    title () { return "Protocol Editor" },
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

<!-- + "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
