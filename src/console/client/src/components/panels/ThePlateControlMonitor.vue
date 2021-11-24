<!-- Plate control demo screen -->
<template>
  <div class="panel panel--optics">
    <div class="panel__menu">
    </div>
    <section class="section section--dashboard-protocols">
      <header class="section__header">
        
        <h2 class="section__title" >
          Plate Control Monitor
        </h2>
        <div>
          <b-button @click="start" variant="outline-secondary" size="sm">
            Start
          </b-button>
          <b-button @click="off" variant="outline-secondary" size="sm">
            Off
          </b-button>
        </div>
        <div>
          <ul>
            <li>Well: {{block}}</li>
            <li>Air: {{air}}</li>
            <li>
              Heater <input v-model="outputHeater" type="range" min=0 max=1.0 step=0.1>{{outputHeater}}
            </li>
            <li>
              Peltier <input v-model="outputPeltier" type="range" min=-1.0 max=1.0 step=0.1>{{outputPeltier}}
            </li>
            <li>
              Heater <input v-model="outputFan" type="range" min=0 max=1.0 step=0.1>{{outputFan}}
            </li>
          </ul>
        </div>
        <div>
          <b-button @click="setOutput" variant="outline-secondary" size="sm">
            Set Output
          </b-button>
        </div>
        <div>
          <textarea id="plateControlTextarea" cols="60" rows="8"></textarea>
          <div>
            <b-button @click="clearTextBox" variant="outline-secondary" size="sm">
              Clear
            </b-button>
            <b-button @click="copyTextBox" variant="outline-secondary" size="sm">
              Copy
            </b-button>
          
          </div>
        </div>
        
        <div class="section__header__menu"></div>
      </header>
    </section>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import device from "../../lib/Device.js";

export default {
  name: 'ThePlateControlMonitor',
  components: {
  },
  props: {
  },
  title () { return "Optics Monitor" },
  data() {
    return {
      outputHeater: 0,
      outputPeltier: 0,
      outputFan: 0,
      air:0,
      block:0
    }
  },
  created: function () {
  },
  methods: {
    start () {
      device.publish("device.command.runPlateControl", {});
    },
    off () {
      device.publish("plate.command.off", {});
    },
    clearTextBox () {
      document.getElementById("plateControlTextarea").innerHTML = "";
    },
    copyTextBox () {
      const copyText = document.querySelector("#plateControlTextarea");
      copyText.select();
      document.execCommand("copy");
    },
    setOutput () {
      const data = {
        heater:parseFloat(this.outputHeater),
        peltier:parseFloat(this.outputPeltier),
        fan:parseFloat(this.outputFan)
      };
      console.log(data)
      device.publish("plate.command.setOutput", data);
    },
    title () {
      return "Plate Control Monitor";
    },
    onAppear () {
      console.log("ThePlateControlMonitor.onAppear");
      this.subId = device.subscribe("plate.update", (topic, data)=>{
          this.block = data.plate.block;
          this.air = data.plate.air;
          const tokens = [data.plate.block, data.plate.air];
          const line = tokens.join("\t") + "\n";
          document.getElementById("plateControlTextarea").innerHTML += line;
        });
    },
    onDisappear () {
      console.log("ThePlateControlMonitor.onDisappear");
      device.unsubscribe(this.subId);
    }
  }
}
</script>