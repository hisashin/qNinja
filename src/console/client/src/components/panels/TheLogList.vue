<template>
  <div>
    <LogList :limit="16" ref="logList" :pagination="true" />
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import LogList from '../LogList.vue';

export default {
  name: 'TheLogList',
  components: {
    LogList
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
      console.log("TheLogList.onAppear()");
      this.$refs.logList.load();
    }
  }
}
</script>