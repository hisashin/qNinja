<template>
  <div class="panel">
    <ProgressMonitor />
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
            <div>baseline={{ baselineExists }}</div>
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
            :id="id"
            :protocol="protocol" /></p>
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
      protocol:null,
      id:null,
      oneShot:false,
      continuous:false,
      baselineExists:false
    };
  },
  created: function () {
    device.addTransitionHandler({
      onStart: (obj)=>{
        startTime = new Date();
      }
    });
    device.addProgressHandler({
      onProgress:(obj)=>{
        let timestamp = new Date().getTime() - startTime.getTime();
        this.$refs.temperatureMonitor.add(timestamp, obj.well, obj.lid);
      }
    });
    device.addFluorescenceUpdateHandler(this);
    device.addBaselineHandler(this);
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
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    },
    onBaselineUpdate: function (data) {
      this.$refs.fluorescenceMonitor.setBaseline(data);
    },
    onFluorescenceUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      this.$refs.fluorescenceMonitor.add(timestamp, data);
    },
    onFluorescenceEvent (data) {
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
        case "baseline": 
        this.baselineExists = true;
        break;
        default:
        break;
      }
    },
    onAppear () {
      console.log("TheExperimentMonitor.onAppear()");
    }
  }
}
</script>