<template>
  <div class="panel">
    <ProgressMonitor ref="progressMonitor"/>
    <div class="card p-3">
      <b-tabs content-class="mt-3">
        <b-tab
          title="Temperature"
          active>
          <p>
            <TemperatureMonitor ref="temperatureMonitor" />
          </p>
        </b-tab>
        <b-tab title="Fluorescence">
          <p><FluorescenceMonitor ref="fluorescenceMonitor" /></p>
            <div>one-shot={{ oneShot }}</div>
            <div>continuous={{ continuous }}</div>
        </b-tab>
        <b-tab
          title="Melt Curve">
          <p>
            <b-button
              class="ml-1"
              @click.stop="updateMeltCurve">
              Update (debug)
            </b-button>
            <MeltCurveMonitor ref="meltCurveMonitor" />
          </p>
        </b-tab>
        <b-tab
          title="Protocol">
          <p><ProtocolDetail
            ref="protocolDetail" /></p>
        </b-tab>
      </b-tabs>
    </div> 
  </div>
</template>
<script>
import device from "../../lib/Device.js";
import appState from "../../lib/AppState.js";
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
      console.log("updateMeltCurve");
      appState.fetchMeltCurve((data)=>{
        this.$refs.meltCurveMonitor.set(data);
      }, ()=>{
        // TODO error
      });
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
      appState.fetchDeviceExperiment (
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