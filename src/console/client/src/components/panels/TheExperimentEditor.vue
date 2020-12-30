<template>
  <div>
    <p>Protocol detail here.</p>
    <h2>(TODO) Experiment Name</h2>
    <h2>(TODO) Tubes conf</h2>
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

// TODO Prepare UI for experiment conf
const experimentConf = 
{
  name: "Example Name",
  wells: [
    { id:0, label:"Sample A", quantity:0.1 },
    { id:1, label:"Sample B", quantity:0.2 },
    { id:2, label:"Sample C", quantity:0.3 },
    { id:3, label:"Sample D", quantity:0.4 },
    { id:4, label:"Sample E", quantity:0.5 },
    { id:5, label:"Sample F", quantity:0.6 },
    { id:6, label:"Sample G", quantity:0.7 },
    { id:7, label:"Sample H", quantity:0.8 }
  ]
};

export default {
  name: 'TheExperimentEditor',
  components: {
  },
  props: {
    limit: { type:Number }
  },
  data() {
    return {
      protocol:{},
      experimentConf: experimentConf // TODO
    }
  },
  created: function () {
  },
  methods: {
    run () {
      appState.run(this.protocol, this.experimentConf);
    },
    setProtocol (protocol) {
      this.protocol = protocol;
    },
    onAppear () {
      console.log("TheExperimentEditor.onAppear()");
    }
  }
}
</script>