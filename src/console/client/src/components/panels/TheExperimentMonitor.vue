<template>
  <div class="panel panel--experiment-monitor">
    <div class="panel__menu">
    </div>
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
              <div style="width:800px;height:640px;">
                <TemperatureChart ref="temperatureChart" />
              </div>
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
      autoPause: false,
      subs: [],
    };
  },
  created: function () {
  },
  methods: {
    title () { return "Experiment Monitor" },
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
    subscribe (topic, handler) {
      this.subs.push(device.subscribe(topic, handler));
    },
    removeExperiment () {
      if (this.experiment) {
        console.log("TheExperimentMonitor.onDisappear UNsub all.");
        this.experiment = null;
        this.subs.forEach((subId)=>{device.unsubscribe(subId)});
        this.$refs.temperatureChart.clear();
        this.$refs.amplificationChart.clear();
        this.$refs.meltCurveChart.clear();
      }
      this.subs = [];
      device.experiment.removeObserver(this.experimentObserverId);
    },
    onDisappear () {
      this.removeExperiment();
    },
    onAppear () {
      console.log("TheExperimentMonitor.onAppear");
      document.getElementById("measurement").innerHTML = "";
      this.subscribe("experiment.update.progress", (topic, obj)=>{
        try {
          document.getElementById("measurement").innerHTML += (obj.plate + "\n");
        } catch (e) {
          console.warn(e);
        }
      });
      

      this.experimentObserverId = device.experiment.observe((experiment)=>{
        console.log("TheExperimentMonitor experiment");
        console.log(experiment)
        this.removeExperiment();
        this.experiment = experiment;
        if (!experiment) return;
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
          if (experiment.log.fluorescence && experiment.log.fluorescence.melt_curve) {
            this.$refs.meltCurveChart.setHardwareConf(experiment.hardware);
            this.$refs.meltCurveChart.setData(experiment.log.fluorescence.melt_curve);
            this.$refs.meltCurveChart.setAnalysis(experiment.analysis);
          }
          
          try {
            this.$refs.progressMonitor.reset();
            this.$refs.progressMonitor.protocol = this.experiment.protocol;
            
          } catch (ex) {
            console.log(ex);
          }
          this.subscribe("experiment.update.finish", (topic, obj)=>{
              console.log("onComplete");
              startTime = new Date();
          });
          this.subscribe("experiment.update.onAutoPause", (topic, obj)=>{
              console.log("TheExperimentMonitor AutoPause event received.");
              this.autoPause = true;
          });
          this.subscribe("experiment.update.progress", (topic, obj)=>{
            if (!(obj.state && (obj.state.state == 'preheat' && obj.state.state == 'complete'))) {
              this.$refs.temperatureChart.add(obj.elapsed, obj.plate, obj.lid);
            }
          });
          this.subscribe("experiment.update.fluorescence", (topic, obj)=>{
            this.$refs.amplificationChart.add(obj);
          });
          this.subscribe("experiment.update.meltCurve", (topic, obj)=>{
            this.onMeltCurveUpdate(obj);
          });
          this.subscribe("experiment.update.fluorescence", (topic, obj)=>{
            this.onFluorescenceEvent(obj);
          });
        });
        }
      );
    }
  }
}
</script>