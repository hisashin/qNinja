<template>
  <div id="app">
    <TheMain />
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
  margin:auto;
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

/* Frame */
.header {
  box-shadow: 0 1px 1px 1px rgba(0,0,0,0.2);
  padding: 0.4em 0;
}
.header__content {
  max-width: 800px;
  margin: auto;
  display:flex;
  flex-direction:row;
}
.header__title {
  margin:0;
  padding:0;
  font-size:1.5rem;
  flex-grow:1;
}
.header__device {
  flex-grow:1;
  text-align:right;
}
.main {
  max-width: 800px;
  margin: auto;
}
.footer {
  max-width: 800px;
  margin: auto;
}
/* Layout params of top-level blocks */
.header,.device-monitor,.panel-nav,.section {
  margin-bottom:1.5rem;
}
/* Layout params of secondary-level blocks */
.section__header:not(:last-child),
.section__nav:not(:last-child),
.section__body:not(:last-child),
.section__body__item:not(:last-child) {
  margin-bottom:0.75rem;
  padding:0;
}

.device-monitor {
}
.panel {
}
.panel-nav {
}
.section {
}

.section__header {

}
.section__header__title {
  font-size: 1.5rem;
}
.section__header__menu {
  float:right;
}
.section__nav {

}
.section__nav--top {

}
.section__nav--bottom {

}
.section__body__item {

}
/* Inside section__body */
.item {

}
/* Item variants */
/* Item variant: List card */
.item--list-card {
}
.item--list-card__cell--header {

}
.item--list-card__cell--item {

}
.item--list-card__cell--footer {

}
.item--list-card__cell--error {

}
/* Item variant: Detail card */
.item--detail-card {
}
/* Item variant: Text paragraph */
.item--paragraph {

}
/* Card styles */
.item--list-card, .item--detail-card, .item--tabbed {
  border: 1px solid #ddd;
  border-radius: 0.5rem;
}

/* Tabbed section */
.item--tabbed {
}
.item--tabbed__tabs {
  padding:0.5em;
}
.item--tabbed__content {
  padding: 0.5em
}

/* Common list view */
.protocol-cell-content, .experiment-cell-content {
  padding:1em;
}
li:not(:last-child) .protocol-cell-content, li:not(:last-child) .experiment-cell-content {
  border-bottom:1px solid rgba(0, 0, 0, 0.125);

}

/* Protocol summary */
.protocol-summary {
  font-size:1em;
}
.protocol-summary__title {
  font-size: 1.2em;
  font-weight:bold;
}
.protocol-summary__stages {

}
.protocol-summary__stages__stage {

}
.protocol-summary__stages__stage__label {
  display:inline-block;
  width:6em;
  font-weight:bold;

}
.protocol-summary__stages__stage__step {
  display:inline-block;
  margin-right:1em;
}
.protocol-summary__stages__stage__step__temp {
  display:inline-block;
  width:3.2em;
  text-align:right;
}
.protocol-summary__stages__stage__step__duration {
  display:inline-block;
  width:3.2em;
  text-align:right;
}
.protocol-summary__stages__stage__cycles {
  display:inline-block;
  text-align:left;
}

/* Log list */

/* Protocol detail & editor view */
.protocol {
}
.protocol__header {
  padding:1em;
}
.protocol__header__name {
  font-size: 1.5rem;
}
.protocol__stages {

}
.protocol__stages__stage {
  border-top:1px solid rgba(0, 0, 0, 0.125);
  padding:1em;
}
.protocol__stages__stage-add {
  text-align:right;
  height:38px;
  margin-top:-19px;
  margin-bottom:-19px;
  z-index:2;
  padding-right:1em;
}
.protocol__stages__stage__title {
  font-size:1.45rem;
}
.protocol__stages__stage__steps {

}
.protocol__stages__stage__steps__step {

}
.protocol__stages__stage__steps__step__label {
  display:inline-block;
  width:100px;
}
.protocol__stages__stage__steps__step__value {
  display:inline-block;
  width:auto;
}
.protocol__stages__stage__footer {
  padding:0.2em 0;
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
.input-cycles {
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
  padding: 0.2em 0.6em;
  border-radius: 0.2em;
}
.paging__pages__page__label--linked {
  background-color: #fff;
  border-color: #007bff;
  color: #007bff;
}
.paging__pages__page__label--current {
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
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
.validation-label {
  position:relative;
  font-size:1rem;
  font-weight:normal;
}
.validation-label__content {
  position: absolute;
  background-color: pink;
  border-radius: 0.3em;
  font-size: 0.75em;
  padding: 0.2em 1em;
  line-height:120%;
  white-space: nowrap;
  left:0;
  top:100%;
  box-shadow: 0px 2px 2px rgba(0,0,0,0.2)
}

.well_selected {
  background-color:pink;
}
.well_available {
  background-color:white;
}
.well_unavailable {
  background-color:gray;
}


.pcr_table {
  border-collapse: collapse;
}
.pcr_table td, .pcr_table th {
  border:1px solid #888;
}

.labeled_list {
  display: flex;
	flex-wrap:wrap;
}
.labeled_list__label {
  flex-basis:20%;
  flex-grow: 1;
}
.labeled_list__content {
  flex-basis:80%;
  flex-grow: 4;
}
</style>
