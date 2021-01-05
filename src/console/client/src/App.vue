<template>
  <div id="app">
    <header class="header">
      <h1>Ninja qPCR</h1>
    </header>
    <main class="main">
      <TheMain />
    </main>
  </div>
</template>

<script>
import TheMain from './components/TheMain.vue'
import appState from "./lib/AppState.js";
import device from "./lib/Device.js";

export default {
  name: 'App',
  components: {
    TheMain
  },
  created: function () {
    appState.init();
    device.connect();
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  max-width: 800px;
}
/* Reset */
ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}
li {
  margin: 0;
  padding:0;
}
a {
  color: #42b983;
}

.main {
  padding:2em;
}

/* Common list view */
.protocol-list, .log-list {
  margin-bottom:0;
}
.protocol-cell, .log-cell {
}
.protocol-cell-content, .log-cell-content {
  padding:1em;
}
li:not(:last-child) .protocol-cell-content, li:not(:last-child) .log-cell-content {
  border-bottom:1px solid rgba(0, 0, 0, 0.125);

}

/* Protocol list */

/* Log list */

/* Protocol detail & editor view */
.protocol {

}
.protocol-stages {

}
.protocol-stage {
  border-top:1px solid rgba(0, 0, 0, 0.125);
  padding:1em;
}
.protocol-stage-add {
  text-align:right;
  height:38px;
  margin-top:-19px;
  margin-bottom:-19px;
  z-index:2;
  padding-right:1em;
}
.protocol-stage-label {

}
.protocol-steps {

}
.protocol-step {

}
.protocol-step-label {
  display:inline-block;
  width:100px;
}
.protocol-header {
  padding:1em;
}
.protocol-footer {
  padding:1em;
  border-top:1px solid rgba(0, 0, 0, 0.125);
}

.progress-meter {
  display:flex;
}
.progress-meter-item {
  border:1px solid rgba(0, 0, 0, 0.125);
  text-align:center;
  padding:0.2em;
  margin:0.1em;
  width: 100%;
}
.progress-meter-item-current {
  text-align:center;
  padding:0.2em;
  margin:0.1em;
  width: 100%;
  background-color:#007bff;
  border-color:#007bff;
  color:#ffffff;
}
/* Input fields */
.input-repeat {
  width:80px;
}
.input-temp {
  width:80px;
}
.input-duration {
  width:80px;
}
.input-speed {
  width:80px;
}
/* List pagination */
.paging {
  padding: 1em 0;
  text-align:center;
}
.paging__pages {
  padding:0;
  margin:0;
}
.paging__pages__page {
  display:inline-block;

}
.paging__pages__page__label {
  margin: 0 0.2em;
  border: 1px solid #aaa;
  padding: 0.2em 1em;
  border-radius: 0.2em;
}
.paging__pages__page__label--linked{

}
.paging__pages__page__label--current{
  background-color: #007bff;
}
/* Error in card view */
.error {
  text-align:center;
  padding:2em 0;
}
.error__title {
  color: #666;
  font-weight: normal;
}
.error__retry {

}
.error__retry__link {

}
</style>
