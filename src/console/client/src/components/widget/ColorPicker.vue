<template>

  <b-modal
    id="colorPickerModal"
    title="Color Picker"
    hide-footer
  >
    <div class="color-picker">
      ColorPicker
      <div id="colorList">
      <template v-for="(color, index) in colors">
        <div :key="index" @click="pick(color)"
          v-bind:style="{backgroundColor:color}"> 
          {{ color }}
          <template v-if="color==selected">
            Selected
          </template>
        </div>
      </template>
      </div>
      <b-button
        @click.stop="cancel">
        Cancel
      </b-button>
    </div>
  </b-modal>
</template>
<script>
import appState from "../../lib/AppState.js";
import Util from "../../lib/Util.js";
let COLORS = Util.defaultPalette;
/*
for (let h=0; h<=360; h+=20) {
  const color = "hsl(" + h + ", 80%, 70%)";
  COLORS.push(color)
}
*/
export default {
  name: 'ColorPicker',
  components: {
  },
  data() {
    return {
      colors:COLORS,
      selected:null
    }
  },
  computed: {
  },
  methods: {
    open: function (initialColor, onPick) {
      this.onPick = onPick;
      this.selected = initialColor;
      this.$bvModal.show('colorPickerModal');
    },
    pick: function (color) {
      if (this.onPick) {
        this.onPick(color);
      }
      this.$bvModal.hide('colorPickerModal');
    },
    cancel: function () {
      this.$bvModal.hide('colorPickerModal');
    }
  }
}
</script>