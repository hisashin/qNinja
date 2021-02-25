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
            <dl class="labeled_list">
              <dt class="labeled_list__label">Name</dt>
              <dd class="labeled_list__content"><input
                v-model="experiment.info.name" type="text" style="width:80%"
              ></dd>
              <dt class="labeled_list__label">Comment</dt>
              <dd class="labeled_list__content"><textarea
                v-model="experiment.info.comment" type="text" style="width:80%" rows="4"
              ></textarea></dd>
            </dl>
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
    
    <!-- Raw Log -->
    <section class="section" v-show="isStarted">
      <header class="section__header">
        <h2 class="section__header__title" >Log</h2>
      </header>
      <div class="section__body">
        <!-- Raw log tabs -->
        <div class="item item--tabbed">
          <b-tabs pills content-class="item--tabbed__content" nav-wrapper-class="item--tabbed__tabs">
            <b-tab title="Temperature">
              <TemperatureMonitor ref="temperatureMonitor" />
            </b-tab>
            <b-tab
              title="Amplification"
              active>
              <FluorescenceMonitor ref="fluorescenceMonitor" />
            </b-tab>
            <b-tab title="Melt curve">
              <MeltCurveMonitor ref="meltCurveMonitor" />
            </b-tab>
          </b-tabs>
        </div>
      </div>
    </section>
    <!-- Analysis -->
    <section class="section" v-show="isStarted">
      <header class="section__header">
        <h2 class="section__header__title" >Analysis</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          Analytics Config
          <b-button
            class="mr-1"
            @click.stop="updateAnalysis">
            Update (Debug)
          </b-button>
        </div>
      </div>
    </section>
    
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
import client from "../../lib/RestClient.js";

import ProtocolDetail from '../ProtocolDetail.vue';
import ProtocolPicker from '../ProtocolPicker.vue';
import ExperimentConfig from '../ExperimentConfig.vue';
import TemperatureMonitor from '../ExperimentMonitor/TemperatureMonitor.vue';
import FluorescenceMonitor from '../ExperimentMonitor/FluorescenceMonitor.vue';
import MeltCurveMonitor from '../ExperimentMonitor/MeltCurveMonitor.vue';

export default {
  name: 'TheExperimentEditor',
  components: {
    ProtocolDetail,
    ProtocolPicker,
    ExperimentConfig,
    TemperatureMonitor,
    FluorescenceMonitor,
    MeltCurveMonitor
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
  },
  mounted: function () {
  
  },
  methods: {
    saveAndRun () {
      this.isEditing = false;
      this.experiment.config = this.$refs.experimentConfig.config;
      if (this.isNew) {
        this.isNew = false;
        client.submitCreateExperiment(this.$data.experiment, (createdItem)=>{
          console.log("submitCreateExperiment success. id=%s", createdItem.id);
          appState.run(createdItem.id);
        });
      } else {
        client.submitUpdateExperiment(this.experiment.id, this.$data.experiment, 
        ()=>{
          console.log("Saved. run...");
          appState.run(this.experiment.id);
        },
        ()=>{});
      
      }
    },
    save () {
      this.experiment.config = this.$refs.experimentConfig.config;
      console.log(this.$data.experiment)
      if (this.isNew) {
        client.submitCreateExperiment(this.$data.experiment, (createdItem)=>{
          this.isNew = false;
          console.log("submitCreateExperiment success. id=%s", createdItem.id);
          this.experiment = createdItem;
        });
      } else {
        client.submitUpdateExperiment(this.experiment.id, this.$data.experiment, 
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
    },
    /* Panel transition */
    setExperiment (experiment) {
      this.experiment = experiment;
      this.isStarted = experiment.status.start > 0;
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
      this.$refs.experimentConfig.setConfig(this.experiment.config);
      
      if (!this.$refs.temperatureMonitor) {
        console.warn("this.$refs.temperatureMonitor is null. why?")
      }
      if (this.isStarted) {
        if (experiment.log && experiment.log.temp) {
          console.log("setExperiment 1.1");
          this.$refs.temperatureMonitor.set(
            experiment.log.temp.time, 
            experiment.log.temp.well, 
            experiment.log.temp.lid);
        
        }
        if (experiment.log) {
          this.$refs.fluorescenceMonitor.setHardwareConf(experiment.hardware);
          this.$refs.fluorescenceMonitor.setData(experiment.log.fluorescence.qpcr);
          this.$refs.fluorescenceMonitor.setAnalysis(experiment.analysis);
        }
      
      }
      
      this.isNew = false;
    },
    startCreateExperiment (draft) {
      this.isNew = true;
      this.isStarted = false;
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
      this.pickingProtocol = true;
      this.$refs.protocolPicker.load();
      
    },
    onPickProtocol (id, protocol) {
      this.pickingProtocol = false;
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
      client.submitUpdateExperimentProperty (this.$data.experiment.id, "info",
       this.$data.experiment.info, (resObj)=>{
        console.log(resObj)
       }, ()=>{});
    },
    updateConfig: function () {
      this.experiment.config = this.$refs.experimentConfig.config;
      client.submitUpdateExperimentProperty (this.$data.experiment.id, "config",
       this.$data.experiment.config, (resObj)=>{
        console.log(resObj);
       }, ()=>{});
    },
    updateAnalysis: function () {
      this.experiment.analysis_config.dummy = new Date().getTime();
      console.log(this.$data.experiment.id);
      console.log(this.$data.experiment.analysis_config);
      client.submitUpdateExperimentProperty (this.$data.experiment.id, "analysis_config",
       this.$data.experiment.analysis_config, (resObj)=>{
        console.log(resObj.analysis);
        this.$refs.fluorescenceMonitor.setAnalysis(this.$data.experiment.analysis);
       }, ()=>{});
    }
  }
}
</script>