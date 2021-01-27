<template>
  <div class="panel">
    <ProgressMonitor ref="progressMonitor"/>
    <section class="section">
      <header class="section__header">
        <h2 class="section__header__title" >{{ experiment.info.name }}</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
        <div class="item item--tabbed">
          <b-tabs pills content-class="item--tabbed__content" nav-wrapper-class="item--tabbed__tabs">
            <b-tab title="Temperature">
              <TemperatureMonitor ref="temperatureMonitor" />
            </b-tab>
            <b-tab
              title="Fluorescence"
              active>
                <p><FluorescenceMonitor ref="fluorescenceMonitor" /></p>
                  <div>one-shot={{ oneShot }}</div>
                  <div>continuous={{ continuous }}</div>
            </b-tab>
            <b-tab title="Melt curve">
              <b-button
                class="ml-1"
                @click.stop="updateMeltCurve">
                Update (debug)
              </b-button>
              <MeltCurveMonitor ref="meltCurveMonitor" />
            </b-tab>
            <b-tab title="Protocol">
              <ProtocolDetail
                ref="protocolDetail" />
            </b-tab>
          </b-tabs>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
import device from "../../lib/Device.js";
import appState from "../../lib/AppState.js";
import client from "../../lib/RestClient.js";

import ProtocolDetail from '../ProtocolDetail.vue';
import ProgressMonitor from '../ExperimentMonitor/ProgressMonitor.vue';
import TemperatureMonitor from '../ExperimentMonitor/TemperatureMonitor.vue';
import FluorescenceMonitor from '../ExperimentMonitor/FluorescenceMonitor.vue';
import MeltCurveMonitor from '../ExperimentMonitor/MeltCurveMonitor.vue';

let startTime = new Date();

export default {
  name: 'TheExperimentMonitor',
  components: {
    ProgressMonitor,
    ProtocolDetail,
    TemperatureMonitor,
    FluorescenceMonitor,
    MeltCurveMonitor
  },
  props: {
  },
  data() {
    return {
      experiment: null,
      oneShot: false,
      continuous: false
    };
  },
  created: function () {
  },
  methods: {
    updateMeltCurve:  function () {
    },
    onFluorescenceUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      this.$refs.fluorescenceMonitor.add(data);
    },
    onMeltCurveUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      this.$refs.meltCurveMonitor.add(timestamp, data);
    },
    onFluorescenceEvent (data) {
    // On/Off indicator
      switch (data.type) {
        case "start":
        this.continuous = true;
        break;
        case "stop": 
        this.continuous = false;
        break;
        case "measure": 
        this.oneShot = true;
        setTimeout(()=>{this.oneShot = false}, 1000);
        break;
        default:
        break;
      }
    },
    onDisappear () {
    },
    onAppear () {
      client.fetchDeviceExperiment (
        (experiment)=>{
          this.experiment = experiment;
          this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
          // Set past data
          
          this.$refs.temperatureMonitor.set(
            experiment.log.temp.time, 
            experiment.log.temp.well, 
            experiment.log.temp.lid);
          this.$refs.fluorescenceMonitor.set(experiment.log.fluorescence.qpcr);
          
          // TODO init meltCurveMonitor
          this.$refs.progressMonitor.reset();
          this.$refs.progressMonitor.protocol = this.experiment.protocol;
          
          device.addTransitionHandler({
            onComplete: (obj)=>{
              startTime = new Date();
            }
          });
          device.addProgressHandler({
            onProgress:(obj)=>{
              if (!(obj.state && (obj.state.state == 'preheat' && obj.state.state == 'complete'))) {
                this.$refs.temperatureMonitor.add(obj.elapsed, obj.well, obj.lid);
              
              }
            }
          });
          device.addFluorescenceUpdateHandler(this);
        }, 
        ()=>{}
      );
    }
  }
}
</script>