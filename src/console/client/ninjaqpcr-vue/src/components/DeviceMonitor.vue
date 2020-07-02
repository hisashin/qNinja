<template>
  <div>
    <div v-show="status==1" class="row">
      <ProtocolEditor name="New Protocol" />
    </div>
    <div v-show="status==2" class="row">
      <DeviceStatus />
    
      <div class="col-12 mt-1">
        <div class="card p-3">
          <b-tabs content-class="mt-3">
            <b-tab title="Fluorescence"><p><FluorescenceMonitor /></p></b-tab>
            <b-tab title="Temperature" active><p><TemperatureMonitor /></p></b-tab>
          </b-tabs>
        </div>
      </div>
    </div>
    <div v-show="status==3" class="row">
      <div class="col-12 mt-3">
        <div class="card p-3">
          Complete!
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import ProtocolEditor from './ProtocolEditor.vue'
import DeviceStatus from './DeviceStatus.vue'
import TemperatureMonitor from './TemperatureMonitor.vue'
import FluorescenceMonitor from './FluorescenceMonitor.vue'
import network from "../lib/device.js";

const DEVICE_STATUS_IDLE = 1;
const DEVICE_STATUS_RUNNING = 2;
const DEVICE_STATUS_FINISHED = 3;

export default {
  name: 'DeviceMonitor',
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE
    }
  },
  components: {
    ProtocolEditor,
    DeviceStatus,
    FluorescenceMonitor,
    TemperatureMonitor
  },
  created: function () {
    this.network = network;
    this.network.addTransitionHandler({
      onStart: (obj)=>{
        console.log("Experiment started.");
        this.status = DEVICE_STATUS_RUNNING;
      },
      onFinish: (obj)=>{
        console.log("Experiment finished.");
        this.status = DEVICE_STATUS_FINISHED;
      },
      onTransition:(obj)=>{
        console.log(obj);
      }
    });
  }
}
</script>