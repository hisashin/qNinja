<template>
  <div class="col-12 mt-3">
    <div class="card">
      <div class="card-header">
        Protocol Detail {{ id }}
      </div>
      <div class="p-3">
        <div>
          {{protocol.name}}
        </div>
        <div>
          Lid temp: {{protocol.lidTemp}}
        </div>
        <div v-for="(stage, index) in protocol.stages">
          <div v-if="stage.type==1">
            <h3>Hold Stage</h3>
            <ul>
              <li>
                <input v-model.number="stage.steps[0].temp" type="number"/>℃
                <input v-model.number="stage.steps[0].duration" type="number" step="1"/>sec
              </li>
            </ul>
          </div>
          <div v-if="stage.type==2">
            <h3>PCR Stage</h3>
            Repeat <input v-model.number="stage.repeat" type="number"/> times
            <ul>
              <li>
                Denaturing
                <input v-model.number="stage.steps[0].temp" type="number"/>℃
                <input v-model.number="stage.steps[0].duration" type="number" step="1"/>sec
              </li>
              <li>
                Annealing
                <input v-model.number="stage.steps[1].temp" type="number"/>℃
                <input v-model.number="stage.steps[1].duration" type="number" step="1"/>sec
              </li>
              <li>
                Extending
                <input v-model.number="stage.steps[2].temp" type="number"/>℃
                <input v-model.number="stage.steps[2].duration" type="number" step="1"/>sec
              </li>
            </ul>
          </div>
          <div v-if="stage.type==3">
            <h3>Melt Curve Stage</h3>
            <ul>
              <li>
                Denaturing
                <input v-model.number="stage.steps[0].temp" type="number"/>℃
                <input v-model.number="stage.steps[0].duration" type="number" step="1"/>sec
                <input v-model.number="stage.steps[0].speed" type="number" step="1"/>℃/sec
              </li>
              <li>
                Cooling
                <input v-model.number="stage.steps[1].temp" type="number"/>℃
                <input v-model.number="stage.steps[1].duration" type="number" step="1"/>sec
                <input v-model.number="stage.steps[1].speed" type="number" step="1"/>℃/sec
              </li>
              <li>
                Melting
                <input v-model.number="stage.steps[2].temp" type="number"/>℃
                <input v-model.number="stage.steps[2].duration" type="number" step="1"/>sec
                <input v-model.number="stage.steps[2].speed" type="number" step="1"/>℃/sec
              </li>
            </ul>
          </div>
          <b-button variant="danger" v-on:click="confirmDelete(index)">Delete</b-button>
        </div>
        <div>
          <b-button v-on:click="addHold" class="mr-1">+ Hold</b-button>
          <b-button v-on:click="addPCR">+ PCR</b-button>
          <b-button v-on:click="addMeltCurve">+ Melt Curve</b-button>
        </div>
        <div>
          <b-button variant="primary" v-on:click="save">Save</b-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import network from "../lib/Device.js";
import appState from "../lib/AppState.js";

const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

let LABEL_MAP = {};
LABEL_MAP[STAGE_TYPE_HOLD] = "Hold";
LABEL_MAP[STAGE_TYPE_PCR] = "PCR";
LABEL_MAP[STAGE_TYPE_MELT_CURVE] = "Melt Curve";

const MEASUREMENT_RAMP_CONTINUOUS = 1;
const MEASUREMENT_HOLD_CONTINUOUS = 2;
const MEASUREMENT_RAMP_END = 3;
const MEASUREMENT_HOLD_END = 4;

const DEFAULT_STAGE_HOLD = { type: STAGE_TYPE_HOLD, 
  repeat:1, 
  steps:[ {label:"hold", temp:94, duration:15, data_collection:[]} ] };
const DEFAULT_STAGE_PCR = { type: STAGE_TYPE_PCR, 
  repeat:30, 
  steps:[ {label:"denature", temp:94, duration:15, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"anneal", temp:55, duration:12, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]}, 
  {label:"extend", temp:72, duration:18, data_collection:[MEASUREMENT_RAMP_END, MEASUREMENT_HOLD_END]} ] };
const DEFAULT_STAGE_MELT_CURVE = { type: STAGE_TYPE_MELT_CURVE, 
  repeat:1, 
  steps:[ {label:"denature", temp:94, duration:10, speed:4, data_collection:[]}, 
  {label:"cool", temp:55, duration:5, speed:4, data_collection:[]}, 
  {label:"melt", temp:94, duration:15, speed:0.05, data_collection:[MEASUREMENT_RAMP_CONTINUOUS]} ] };
  
export default {
  name: 'ProtocolDetail',
  components:{},
  data() {
    return {
      id:"",
      protocol: {
        name: "New Protocol",
        lidTemp: 110,
        stages: [
        ]
      }
    }
  },
  methods: {
    confirmDelete: function (index) {
      if (window.confirm("Delete " + index + "?")) {
        this.protocol.stages.splice(index, 1);
      }
    },
    addHold: function () {
      console.log("addHold");
      this.protocol.stages.push(DEFAULT_STAGE_HOLD);
    },
    addPCR: function () {
      console.log("addPCR");
      this.protocol.stages.push(DEFAULT_STAGE_PCR);
    },
    addMeltCurve: function () {
      this.protocol.stages.push(DEFAULT_STAGE_MELT_CURVE);
    },
    save: function () {
      console.log(JSON.stringify(this.$data))
      const xmlhttp = new XMLHttpRequest();
      const url = "http://localhost:2222/protocols/" + this.id + "/update";
      xmlhttp.open("POST", url, true);
      // xmlhttp.setRequestHeader("Content-type", "application/json"); // TODO cors?
      xmlhttp.onreadystatechange = function () { 
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          console.log(xmlhttp.responseText);
        }
      }
      const sendData = {id:this.id, protocol:this.protocol};
      console.log(sendData);
      xmlhttp.send(JSON.stringify(sendData));
    },
    onSelectProtocol: function (item) {
      this.protocol = item.protocol;
      this.id = item.id;
    }
  },
  created: function () {
    appState.addProtocolEventHandler(this);
    /*
    const xmlhttp = new XMLHttpRequest();
    const url = "http://localhost:2222/protocols/" + this.id;
    xmlhttp.onreadystatechange = ()=>{
      console.log("onreadystatechange");
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        console.log(xmlhttp.responseText);
        const obj = JSON.parse(xmlhttp.responseText);
        this.protocol = obj.protocol;
        this.id = obj.id;
      }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
    */
  
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
