<template>
  <div class="panel">
    <section class="section">
      <header class="section__header">
        <div class="section__header__menu"></div>
        <h2 class="section__header__title" >Protocol detail</h2>
      </header>
      <div class="section__body">
        <div class="item item--detail-card">
          <div class="item--detail-card__body">
            <ProtocolDetail ref="protocolDetail" />
          </div>
        </div>
      </div>
    </section>
    <nav class="section__nav section__nav--bottom">
      <b-button class="mr-1"
        @click.stop="">
        Run
      </b-button>
      <b-button class="mr-1"
        @click.stop="">
        Edit
      </b-button>
      <b-button class="mr-1"
        @click.stop="">
        Delete
      </b-button>
      <b-button class="mr-1"
        @click.stop="">
        Copy
      </b-button>
    </nav>
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
      this.$refs.protocolDetail.setProtocol(protocol);
    },
    onAppear () {
    }
  }
}
</script>