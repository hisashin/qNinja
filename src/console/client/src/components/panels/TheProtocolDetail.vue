<template>
  <div class="panel panel--protocol-detail">
    <div class="panel__menu">
      <b-button class="mr-1"
        @click.stop="run">
        Run
      </b-button>
      <b-button class="mr-1"
        @click.stop="edit">
        Edit
      </b-button>
      <b-button class="mr-1"
        @click.stop="deleteIt">
        Delete
      </b-button>
      <b-button class="mr-1"
        @click.stop="duplicate">
        Copy
      </b-button>
    </div>
    <section class="section">
      <div class="section__body">
        <div class="item paragraph">
          <div class="paragraph__body">
            <ProtocolDetail ref="protocolDetail" />
          </div>
        </div>
      </div>
    </section>
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
      pid: null
    }
  },
  created: function () {
  },
  methods: {
    exampleMethod () {},
    setProtocol (item) {
      this.$refs.protocolDetail.setProtocol(item.protocol);
      this.pid = item.id;
    },
    onAppear () {
    },
    title () { return "Protocol Detail" },
    run: function(id) {
      appState.draftExperimentWithProtocol(this.pid);
    },
    edit: function() {
      appState.startEditProtocol(this.pid);
    },
    deleteIt: function() {
      if (!window.confirm("Are you sure you want to delete this protocol?")) {
        return;
      }
      client.submitDeleteProtocol(this.pid, ()=>{
        appState.toast(this, "Deleted", "The protocol was deleted.");
        appState.backPanel();
      });
    },
    duplicate: function() {
    }
  }
}
</script>