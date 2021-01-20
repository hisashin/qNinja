<template>
  <div class="panel">
  
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu">
          <b-button v-show="!pickingProtocol"
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
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Plate Layout</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
      </div>
    </section>
    <div>
      <b-button
        class="ml-1"
        @click.stop="run">
        Run
      </b-button>
    </div>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import ProtocolDetail from '../ProtocolDetail.vue';
import ProtocolPicker from '../ProtocolPicker.vue';

// TODO Prepare UI for experiment conf


const DEFAULT_CONF = {
  tubes: [
    { id:0, label:"Sample A", quantity:0.1 },
    { id:1, label:"Sample B", quantity:0.2 },
    { id:2, label:"Sample C", quantity:0.3 },
    { id:3, label:"Sample D", quantity:0.4 },
    { id:4, label:"Sample E", quantity:0.5 },
    { id:5, label:"Sample F", quantity:0.6 },
    { id:6, label:"Sample G", quantity:0.7 },
    { id:7, label:"Sample H", quantity:0.8 }
  ]
};
const DEFAULT_STATUS = {
  status:"ready"
  
};
const DEFAULT_INFO = {};
const DEFAULT_ANALYSIS_CONFIG = {};
const DEFAULT_ANALYSIS = {};

export default {
  name: 'TheExperimentEditor',
  components: {
    ProtocolDetail,
    ProtocolPicker
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      experiment: {},
      pickingProtocol: false,
      isEditing: false
    }
  },
  created: function () {
  },
  methods: {
    _createExperimentDraft (option) {
      const timestamp = new Date().getTime();
      let experiment = {
        protocol_id: option.protocol.id || option.protocol_id,
        protocol: option.protocol,
        log: {
          temp: {
            time:[],
            well:[],
            lid:[]
          },
          events: [
            // transition
          ],
          baseline:[], 
          fluorescence: {
            baseline: [],
            qpcr: [],
            melt_curve: []
          }
        },
        config: (option.config)? option.config : DEFAULT_CONF,
        info: (option.info)? option.info : DEFAULT_INFO,
        analysis: (option.analysis)? option.analysis : DEFAULT_ANALYSIS,
        analysis_config: (option.analysis_config)? option.analysis_config : DEFAULT_ANALYSIS_CONFIG,
        status: (option.status)? option.status : DEFAULT_STATUS
      };
      experiment.created = timestamp;
      return experiment;
    },
    run () {
      console.log("TheExperimentEditor.run");
      this.isEditing = false;
      appState.submitCreateExperiment(this.$data.experiment, (createdItem)=>{
        console.log(createdItem)
        console.log(createdItem.id)
        appState.run(createdItem.id);
      });
    },
    setProtocol (protocol) {
      this.protocol = protocol;
    },
    onAppear () {
      console.log("TheExperimentEditor.onAppear()");
    },
    startUpdateExperiment () {
    
    },
    startCreateExperiment (item) {
      console.log("startCreateExperiment");
      console.log(item)
      this.experiment = this._createExperimentDraft({protocol:item.protocol,protocol_id:item.id});
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
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
    }
  }
}
</script>