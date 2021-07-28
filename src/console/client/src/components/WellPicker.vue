<template>
  <b-modal
    id="well-picker-modal"
    title="Assign wells"
    hide-footer
  >
    <div>
    
      <table class="pcr-table pcr-table--well_picker">
        <tr v-for="(row, row_index) in layout" v-bind:key="row_index">
          <td v-for="(well, well_index) in row" v-bind:key="well_index" @click="toggle(well.id)" v-bind:class="[ styleClass(well.id) ]">
            {{ well.name }}
            {{ order(well.id) }}
          </td>
        </tr>
      </table>
    </div>
    {{ selected }}
    ( {{ selected.length }} / {{ count }} selected )
    <b-button variant="primary"
      class="mt-3" block @click="ok()"
    >
      OK
    </b-button>
    <b-button
      class="mt-3" block @click="cancel()"
    >
      Cancel
    </b-button>
  </b-modal>
</template>
<script>
export default {
  name: 'WellPicker',
  props: {
  },
  data() {
    return {
      layout:null,
      available:[],
      selected:[],
      count:0
    }
  },
  created: function () {
  },
  methods: {
    select: function() {
    },
    status: function (wellIndex) {
      if (this.selected.indexOf(wellIndex) >= 0) {
        return "S"
      }
      if (this.available.indexOf(wellIndex) >= 0) {
        return "O"
      }
      return "X"
    },
    order: function (wellIndex) {
      if (this.selected.indexOf(wellIndex) >= 0) {
        return this.selected.indexOf(wellIndex) + 1;
      }
      return "";
    },
    styleClass: function (wellIndex) {
      if (this.selected.indexOf(wellIndex) >= 0) {
        return "well_selected"
      }
      if (this.available.indexOf(wellIndex) >= 0) {
        return "well_available"
      }
      return "well_unavailable"
    },
    open: function(layout, availableIds, count) {
      this.layout = layout;
      this.count = count;
      this.selected = [];
      this.available = availableIds;
      this.$bvModal.show('well-picker-modal');
    },
    cancel: function () {
      this.$emit('cancel');
      this.$bvModal.hide('well-picker-modal');
    },
    ok: function () {
      if (this.selected.length == this.count) {
        this.$emit('select', this.selected);
        this.$bvModal.hide('well-picker-modal');
      } else {
        alert("Please select.");
      }
      
    },
    toggle (wellId) {
      if (this.available.indexOf(wellId) < 0) {
        alert("This well is unavailable.");
        return;
      }
      if (this.selected.indexOf(wellId) >= 0) {
        this.selected.splice(this.selected.indexOf(wellId), 1);
      } else {
        if (this.selected.length == this.count) {
          alert("Too many wells");
          return;
        }
        this.selected.push(wellId);
      }
    }
    
  }
}
</script>
<style>
</stule>