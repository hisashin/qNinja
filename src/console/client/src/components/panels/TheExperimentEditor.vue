<template>
  <div class="panel">
    <!-- Info section -->
    <section class="section" v-if="experiment">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button v-show="isStarted"
            class="ml-1"
            @click.stop="updateInfo">
            Save
          </b-button>
        </div>
        <h2 class="section__header__title" >Summary</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <div>
              Name: <input
                v-model.number="experiment.info.name" type="text"
              >
            </div>
            <div>
              Comment: <input
                v-model.number="experiment.info.comment" type="text"
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Protocol Section -->
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button v-show="!pickingProtocol && !isStarted"
            class="ml-1"
            @click.stop="pickProtocol">
            Select protocol
          </b-button>
          
          <b-button v-show="pickingProtocol"
            class="ml-1"
            @click.stop="cancelPickProtocol">
            Cancel
          </b-button>
        </div>
        <h2 class="section__header__title" >Protocol</h2>
      </header>
      <div class="section__body" v-show="!pickingProtocol">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <ProtocolDetail ref="protocolDetail" />
          </div>
        </div>
      </div>
      <!-- Protocol Picker -->
      <ProtocolPicker v-show="pickingProtocol" ref="protocolPicker" :limit="2" :pagination="true" @select="onPickProtocol" />
    </section>
    
    <!-- Config Section  -->
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button v-show="isStarted"
            class="ml-1"
            @click.stop="updateConfig">
            Save
          </b-button>
        </div>
        <h2 class="section__header__title" >Plate Layout</h2>
      </header>
      <ExperimentConfig ref="experimentConfig" />
    </section>
    
    <!-- Log section -->
    <!-- Analysis section -->
    <div>
      <b-button
        v-if="!isStarted"
        class="mr-1"
        @click.stop="saveAndRun">
        Save and Run
      </b-button>
      <b-button
        v-if="!isStarted"
        class="mr-1"
        @click.stop="save">
        Save
      </b-button>
    </div>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import ProtocolDetail from '../ProtocolDetail.vue';
import ProtocolPicker from '../ProtocolPicker.vue';
import ExperimentConfig from '../ExperimentConfig.vue';

export default {
  name: 'TheExperimentEditor',
  components: {
    ProtocolDetail,
    ProtocolPicker,
    ExperimentConfig
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      experiment: null,
      pickingProtocol: false,
      isEditing: false,
      isNew: false,
      isStarted: false
    }
  },
  created: function () {
    console.log("TheExperimentEditor.created");
  },
  mounted: function () {
    console.log("TheExperimentEditor.mounted");
  
  },
  methods: {
    saveAndRun () {
      this.isEditing = false;
      this.experiment.config = this.$refs.experimentConfig.config;
      if (this.isNew) {
        appState.submitCreateExperiment(this.$data.experiment, (createdItem)=>{
          console.log(createdItem)
          console.log(createdItem.id)
          appState.run(createdItem.id);
        });
      } else {
        appState.submitUpdateExperiment(this.experiment.id, this.$data.experiment, 
        ()=>{
          console.log("Saved.");
          appState.run(createdItem.id);
        },
        ()=>{});
      
      }
    },
    save () {
      this.experiment.config = this.$refs.experimentConfig.config;
      if (this.isNew) {
        appState.submitCreateExperiment(this.$data.experiment, (createdItem)=>{
          this.experiment = createdItem;
        });
      } else {
        appState.submitUpdateExperiment(this.experiment.id, this.$data.experiment, 
        ()=>{
          console.log("Saved.");
        },
        ()=>{});
      }
    },
    setProtocol (protocol) {
      this.protocol = protocol;
    },
    onAppear () {
      console.log("TheExperimentEditor.onAppear()");
    },
    /* Panel transition */
    setExperiment (experiment) {
      this.experiment = experiment;
      this.isStarted = experiment.status.start > 0;
      console.log(this.$refs)
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
      this.$refs.experimentConfig.setConfig(this.experiment.config);
      this.isNew = false;
    },
    startCreateExperiment (draft) {
      this.isNew = true;
      this.isStarted = false;
      console.log(this.$refs)
      this.experiment = draft;
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
      this.$refs.experimentConfig.setConfig(this.experiment.config);
    },
    submitCreateExperiment () {
    
    },
    submitUpdateExperiment () {
    
    },
    confirmLeave (callback) {
      if (this.isEditing) {
        if (window.confirm("Are you sure you want to discard the changes?")) {
          callback();
        }
      } else {
        callback();
      }
    },
    pickProtocol () {
      console.log("pickProtocol");
      this.pickingProtocol = true;
      this.$refs.protocolPicker.load();
      
    },
    onPickProtocol (id, protocol) {
      this.pickingProtocol = false;
      console.log("onPickProtocol");
      this.experiment.protocol = protocol;
      this.experiment.protocol_id = id;
      this.pickingProtocol = false;
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
    },
    cancelPickProtocol () {
      this.pickingProtocol = false;
    },
    updateInfo: function () {
      console.log(this.$data.experiment.id)
      console.log(this.$data.experiment.info)
      appState.submitUpdateExperimentProperty (this.$data.experiment.id, "info",
       this.$data.experiment.info, (resObj)=>{
        console.log(resObj)
       }, ()=>{});
    },
    updateConfig: function () {
      this.experiment.config = this.$refs.experimentConfig.config;
      appState.submitUpdateExperimentProperty (this.$data.experiment.id, "config",
       this.$data.experiment.config, (resObj)=>{
        console.log(resObj);
       }, ()=>{});
    }
  }
}
</script>