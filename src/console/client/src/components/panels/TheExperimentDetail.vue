<template>
  <div class="panel">
    <ExperimentDetail ref="experimentDetail" />
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import ExperimentDetail from '../ExperimentDetail.vue';

export default {
  name: 'TheExperimentDetail',
  components: {
    ExperimentDetail
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
    setExperiment (experiment) {
      this.$refs.experimentDetail.setExperiment(experiment);
    },
    onAppear () {
      console.log("TheExperimentDetail.onAppear()");
    }
  }
}
</script>