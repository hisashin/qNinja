<template>
  <div class="my-1">
    <b-button variant="primary" v-on:click="back">Back</b-button>
  </div>
</template>
<script>
import appState from "../lib/AppState.js";
export default {
  name: 'BackButton',
  methods: {
    back() {
      appState.backPanel();
    }
  }
}
</script>