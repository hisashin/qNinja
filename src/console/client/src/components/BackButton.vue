<template>
    <button
      @click="back"
      class="panel-nav__back"
    ></button>
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