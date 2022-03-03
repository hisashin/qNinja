<template>
  <div>
    <header class="header">
      <div class="header__content">
        <h1 class="header__title">
          <a href="ninjaqpcr_splash.html">Ninja qPCR</a>
        </h1>
        <!-- Device monitor -->
          <div class="header__device">
          <span>
            {{ connectionStatus.message }}
            Well {{ wellTemp }}℃
            Lid {{ lidTemp }}℃
          </span>
          <!-- Network -->
          <button
            v-show="!connectionStatus.connected"
            
            class="btn btn-link"
            @click="reConnect"
          >
            Connect
          </button>
        </div>
      </div>
    </header>
    <main class="main">
      <TheDeviceSummary v-show="selectedPanel!=panels.EXPERIMENT_MONITOR"/>
      <nav 
        v-if="panelTitle && selectedPanel!=panels.DASHBOARD"
        class="panel-nav">
        <BackButton v-show="backEnabled" />
        <h2 class="panel-nav__title">
          {{ panelTitle }}
        </h2>
      </nav>
      <!-- Panels -->
      <TheDashboard ref="panelDashboard" v-show="selectedPanel==panels.DASHBOARD" />
      <TheProtocolList ref="panelProtocolList" v-show="selectedPanel==panels.PROTOCOL_LIST" />
      <TheProtocolDetail ref="panelProtocolDetail" v-show="selectedPanel==panels.PROTOCOL_DETAIL" />
      <TheExperimentList ref="panelExperimentList" v-show="selectedPanel==panels.EXPERIMENT_LIST" />
      <TheProtocolEditor ref="panelProtocolEditor" v-show="selectedPanel==panels.PROTOCOL_EDITOR" />
      <TheExperimentEditor ref="panelExperimentEditor" v-show="selectedPanel==panels.EXPERIMENT_EDITOR" />
      <TheExperimentMonitor ref="panelExperimentMonitor" v-show="selectedPanel==panels.EXPERIMENT_MONITOR" />
      <TheOpticsMonitor ref="panelOpticsMonitor" v-show="selectedPanel==panels.OPTICS_MONITOR" />
      <ThePlateControlMonitor ref="panelPlateControlMonitor" v-show="selectedPanel==panels.PLATE_CONTROL_MONITOR" />
      <PanelTemplate ref="panelTemplate" v-show="selectedPanel==panels.TEMPLATE" />
      <div class="debug">
      (Dev. menu)
        <b-button class="mr-1 btn-sm"
          @click.stop="rebootAP">
          AP mode
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="reboot">
          Reboot
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="shutdown">
          Shutdown
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="showTemplate">
          Panel Template
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="home">
          Home
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="revealDetailLatestExperiment">
          Last Experiment
        </b-button>
        <b-button class="mr-1 btn-sm"
          @click.stop="ping">
          Ping
        </b-button>
      </div>
    </main>
    <footer class="footer">
    </footer>
  </div>
</template>
<script>

import TheDeviceSummary from './TheDeviceSummary.vue'

import TheDashboard from './panels/TheDashboard.vue'
import TheExperimentEditor from './panels/TheExperimentEditor.vue'
import TheExperimentMonitor from './panels/TheExperimentMonitor.vue'
import TheExperimentList from './panels/TheExperimentList.vue'
import TheProtocolDetail from './panels/TheProtocolDetail.vue'
import TheProtocolEditor from './panels/TheProtocolEditor.vue'
import TheProtocolList from './panels/TheProtocolList.vue'
import TheOpticsMonitor from './panels/TheOpticsMonitor.vue'
import ThePlateControlMonitor from './panels/ThePlateControlMonitor.vue'
import PanelTemplate from './panels/PanelTemplate.vue'

import BackButton from './BackButton.vue';

import device from "../lib/Device.js";
import appState from "../lib/AppState.js";

const DEVICE_STATUS_IDLE = 1;
const DEVICE_STATUS_RUNNING = 2;
const DEVICE_STATUS_FINISHED = 3;
const DEVICE_STATUS_AUTO_PAUSE = 4;

export default {
  name: 'TheMain',
  components: {
  TheDashboard,
    TheExperimentList,
    TheProtocolDetail,
    TheProtocolList,
    TheExperimentMonitor,
    TheExperimentEditor,
    TheProtocolEditor,
    PanelTemplate,
    TheDeviceSummary,
    TheOpticsMonitor,
    ThePlateControlMonitor,
    BackButton
  },
  data() {
    return {
      isIdle:true,
      status:DEVICE_STATUS_IDLE,
      panels:appState.PANELS,
      selectedPanel:appState.PANELS.DASHBOARD,
      backEnabled: false,
      panelTitle: "",
      connectionStatus: device.Connection.DISCONNECTED,
      wellTemp: "-",
      lidTemp: "-"
    }
  },
  created: function () {
    appState.setPanelContainer(this);
    device.connectionStatus.observe((status)=>{
      this.connectionStatus = status;
    });

    device.subscribe("experiment.update.start", (topic, data)=>{
        console.log("Experiment started.");
        this.status = DEVICE_STATUS_RUNNING;
    });
    device.subscribe("experiment.update.finish", (topic, data)=>{
        console.log("Experiment is complete!");
        this.status = DEVICE_STATUS_FINISHED;
    });
    device.subscribe("experiment.update.autoPause", (topic, data)=>{
        console.log("Experiment is paused automatically by protocol!");
        this.status = DEVICE_STATUS_AUTO_PAUSE;
    });
    appState.setNavigationHandler((panelStack)=>{
      this.backEnabled = (panelStack.length > 1);
    
    });
    device.subscribe("pong", (topic, data)=>{
      alert("TheMain.vue pong received.");
    });
    device.subscribe("device.update.temperature", (topic, data)=>{
      this.wellTemp = data.plate.main.toFixed(1);
      this.lidTemp = data.lid.main.toFixed(1);
    });
    device.subscribe("device.update.shutdown", (topic, data)=>{
      alert("The device is going to shut down.");
    });
    device.subscribe("device.update.rebootAP", (topic, data)=>{
      alert("The device is going to reboot in AP mode.");
    });
    device.subscribe("device.update.reboot", (topic, data)=>{
      alert("The device is going to restart.");
    });
  },
  mounted: function () {
    appState.setViews(this.$refs);
  
  },
  methods: {
    reConnect: function () {
      console.log("reConnect");
      device.connect();
    },
    presentPanel(panel, toPanel) {
      this.selectedPanel = panel;
      this.panelTitle = (toPanel.title) ? toPanel.title() : "N/A";
    },
    rebootAP () {
      // Reboot in AP mode
      device.publish("device.command.rebootAP", {});
    },
    reboot () {
      // Simply reboot
      device.publish("device.command.reboot", {});
    },
    shutdown () {
      // Reboot in AP mode
      device.publish("device.command.shutdown", {});
    },
    showTemplate () {
      appState.pushPanel(appState.PANELS.TEMPLATE);
      
    },
    home () {
      appState.home();
    },
    ping () {
      device.publish("ping", {});
    },
    revealDetailLatestExperiment () {
      appState.revealDetailLatestExperiment(this);
    }
  }
}
</script>