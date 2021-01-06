<template>
  <div class="panel">
    <ExperimentList :limit="16" ref="experimentList" :pagination="true" />
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import ExperimentList from '../ExperimentList.vue';

export default {
  name: 'TheExperimentList',
  components: {
    ExperimentList
  },
  props: {
  },
  data() {
    return {
    }
  },
  created: function () {
  },
  methods: {
    exampleMethod () {},
    onAppear () {
      console.log("TheExperimentList.onAppear()");
      this.$refs.experimentList.load();
    }
  }
}
</script>