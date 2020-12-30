<template>
  <div>
    <LogDetail ref="logDetail" />
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import LogDetail from '../LogDetail.vue';

export default {
  name: 'TheLogDetail',
  components: {
    LogDetail
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
    setLog (log) {
      this.$refs.logDetail.setLog(log);
    },
    onAppear () {
      console.log("TheLogDetail.onAppear()");
    }
  }
}
</script>