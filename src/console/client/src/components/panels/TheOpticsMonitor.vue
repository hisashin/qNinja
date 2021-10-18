<template>
  <div class="panel panel--optics">
    <div class="panel__menu">
    </div>
    <section class="section section--dashboard-protocols">
      <header class="section__header">
        
        <h2 class="section__title" >
          Optics Monitor
        </h2>
        <div>
          <ul>
            <li v-for="(well, wellIndex) in measurement" :key="wellIndex">
             {{well.id}},{{ well.vl}},{{ well.vs}}
            </li>
          </ul>
        </div>
        <b-button @click="start" class="float-right" variant="outline-secondary" size="sm">
          Start
        </b-button>
        
        <div class="section__header__menu"></div>
      </header>
    </section>
  </div>
</template>
<script>
import appState from "../../lib/AppState.js";
import device from "../../lib/Device.js";

export default {
  name: 'TheOpticsMonitor',
  components: {
  },
  props: {
  },
  title () { return "Optics Monitor" },
  data() {
    return {
      measurement: [
        { id:0, vl:0, vs:0},
        { id:1, vl:0, vs:0},
        { id:2, vl:0, vs:0},
        { id:3, vl:0, vs:0},
        { id:4, vl:0, vs:0},
        { id:5, vl:0, vs:0},
        { id:6, vl:0, vs:0},
        { id:7, vl:0, vs:0},
        { id:8, vl:0, vs:0},
        { id:9, vl:0, vs:0},
        { id:10, vl:0, vs:0},
        { id:11, vl:0, vs:0},
        { id:12, vl:0, vs:0},
        { id:13, vl:0, vs:0},
        { id:14, vl:0, vs:0},
        { id:15, vl:0, vs:0},
      ]
    }
  },
  created: function () {
  },
  methods: {
    start () {
      device.publish("device.command.runOptics", {});
    },
    title () {
      return "Optics Monitor";
    },
    onAppear () {
      console.log("OpticsMonitor.onAppear");
      this.subId = device.subscribe("optics.update", (topic, data)=>{
          console.log(data)
          this.measurement = data;
        });
    },
    onDisappear () {
      console.log("OpticsMonitor.onDisappear");
      device.unsubscribe(this.subId);
    }
  }
}
</script>