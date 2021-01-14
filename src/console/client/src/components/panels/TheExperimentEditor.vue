<template>
  <div class="panel">
  
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Protocol</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <ProtocolDetail ref="protocolDetail" />
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Well Layout</h2>
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

export default {
  name: 'TheExperimentEditor',
  components: {
    ProtocolDetail
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      experiment: {}
    }
  },
  created: function () {
  },
  methods: {
    _createExperiment (option) {
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
        conf: (option.conf)? option.conf : DEFAULT_CONF,
        status: (option.status)? option.status : DEFAULT_STATUS
      };
      experiment.created = timestamp;
      return experiment;
    },
    run () {
      appState.run(this.protocol, this.experimentConf);
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
      this.experiment = this._createExperiment({protocol:item.protocol,protocol_id:item.id});
      this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
    },
    submitCreateExperiment () {
    
    },
    submitUpdateExperiment () {
    
    },
    confirmLeave (callback) {
      if (window.confirm("Are you sure you want to discard the changes?")) {
        callback();
      }
    }
  }
}
</script>