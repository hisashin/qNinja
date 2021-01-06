<template>
  <div class="panel">
    <ProtocolDetail ref="protocolDetail" />
  </div>
</template>

<script>
import appState from "../../lib/AppState.js";
import ProtocolDetail from '../ProtocolDetail.vue';


export default {
  name: 'TheProtocolDetail',
  components: {
    ProtocolDetail
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
    setProtocol (protocol) {
      this.$refs.protocolDetail.setProtocol(log);
    },
    onAppear () {
      console.log("TheProtocolDetail.onAppear()");
    }
  }
}
</script>