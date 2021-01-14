<template>
  <div class="panel">
  
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >Protocol</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
        <ProtocolDetail ref="protocolDetail" />
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
    
    }
  }
}
</script>