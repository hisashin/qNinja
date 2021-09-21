<template>
  <div class="panel panel--experiment-monitor">
    <div class="panel__menu">
    </div>
    <strong>the experiment monitor</strong>
    <ProgressMonitor ref="progressMonitor"/>
    <section class="section" v-if="experiment">
      <header class="section__header">
        <h2 class="section__title" >{{ experiment.info.name }}</h2>
        <div class="section__header__menu"></div>
      </header>
      <div class="section__body">
        <div v-if="autoPause">
          The expriment is automatically paused.
          <b-button
            class="ml-1"
            @click.stop="finishAutoPause">
            Continue
          </b-button>
        </div>
        <div class="item item--tabbed">
          <b-tabs pills content-class="item--tabbed__content" nav-wrapper-class="item--tabbed__tabs" active>
            <b-tab title="Temperature">
              <TemperatureChart ref="temperatureChart" />
            </b-tab>
            <b-tab
              title="Amplification"
              >
                <p><AmplificationChart ref="amplificationChart" /></p>
                  <div>one-shot={{ oneShot }}</div>
                  <div>continuous={{ continuous }}</div>
            </b-tab>
            <b-tab title="Melt curve">
              <MeltCurveChart ref="meltCurveChart" />
            </b-tab>
            <b-tab title="Protocol">
              <ProtocolDetail
                ref="protocolDetail" />
            </b-tab>
          </b-tabs>
        </div>
      </div>
    </section>
    <textarea id="measurement">
    </textarea>
  </div>
</template>
<script>
import device from "../../lib/Device.js";
import appState from "../../lib/AppState.js";
import client from "../../lib/RestClient.js";

import ProtocolDetail from '../ProtocolDetail.vue';
import ProgressMonitor from '../ExperimentMonitor/ProgressMonitor.vue';
import TemperatureChart from '../ExperimentMonitor/TemperatureChart.vue';
import AmplificationChart from '../ExperimentMonitor/AmplificationChart.vue';
import MeltCurveChart from '../ExperimentMonitor/MeltCurveChart.vue';

let startTime = new Date();

export default {
  name: 'TheExperimentMonitor',
  components: {
    ProgressMonitor,
    ProtocolDetail,
    TemperatureChart,
    AmplificationChart,
    MeltCurveChart
  },
  props: {
  },
  data() {
    return {
      experiment: null,
      oneShot: false,
      continuous: false,
      autoPause: false
    };
  },
  created: function () {
  },
  methods: {
    title () { return "Experiment Monitor" },
    onFluorescenceUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      this.$refs.amplificationChart.add(data);
    },
    onMeltCurveUpdate: function (data) {
      let timestamp = new Date().getTime() - startTime.getTime();
      this.$refs.meltCurveChart.add(timestamp, data);
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
    finishAutoPause () {
      device.finishAutoPause();
      this.autoPause = false;
    },
    onDisappear () {
      console.log("TheExperimentMonitor.onDisappear unsub");
      device.unsubscribe(this.progressSubId);
    },
    onAppear () {
      console.log("TheExperimentMonitor.onAppear");
      document.getElementById("measurement").innerHTML = "";
      this.progressSubId = device.subscribe("experiment.update.progress", (topic, obj)=>{
        try {
          console.log("TheExperimentMonitor.experiment.update.progress updated");
          document.getElementById("measurement").innerHTML += (obj.plate + "\n"); //[obj.plate, obj.extra[0], obj.extra[1]].join("\t") + "\n";
        } catch (e) {
          console.warn(e);
        }
      });
      
      console.log("TheExperimentMonitor.onAppear subscribing experiment.update.progress");
      client.fetchDeviceExperiment (
        (experiment)=>{
          this.experiment = experiment;
          this.$nextTick(()=>{
            this.$refs.protocolDetail.setProtocol(this.experiment.protocol);
            // Set past data
            this.$refs.temperatureChart.set(
              experiment.log.temp.time, 
              experiment.log.temp.plate, 
              experiment.log.temp.lid);
            try {
              this.$refs.amplificationChart.setHardwareConf(experiment.hardware);
              this.$refs.amplificationChart.setData(experiment.log.fluorescence.qpcr);
            
            } catch (ex) {
              console.log(ex);
            }
            
            // TODO init meltCurveChart
            
            try {
              this.$refs.progressMonitor.reset();
              this.$refs.progressMonitor.protocol = this.experiment.protocol;
              
            } catch (ex) {
              console.log(ex);
            }
            device.addTransitionHandler({
              onComplete: (obj)=>{
                startTime = new Date();
              },
              onAutoPause: (obj)=>{
                console.log("TheExperimentMonitor AutoPause event received.");
                this.autoPause = true;
              }
            });
            device.addProgressHandler({
              onProgress:(obj)=>{
                if (!(obj.state && (obj.state.state == 'preheat' && obj.state.state == 'complete'))) {
                  this.$refs.temperatureChart.add(obj.elapsed, obj.plate, obj.lid);
                
                }
              }
            });
            device.addFluorescenceUpdateHandler(this);
          });
        }, 
        ()=>{}
      );
    }
  }
}
</script>