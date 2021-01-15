<template>
  <li
    class="item--list-card__cell item--list-card__cell--item"
    @click="select">
    <div class="protocol-cell-content">
      <div class="row">
        <div class="col-12">
          <strong>{{ protocol.name }}</strong>
        </div>
        <ul class="col-12">
          <li
            v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
            <span v-if="stage.type==1">Hold</span>
            <span v-if="stage.type==2">PCR</span>
            <span v-if="stage.type==3">Melt Curve</span>
              
            <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex">
              {{ step.temp }}℃
              {{ step.duration }}sec
            </span>
            <span v-if="stage.type==2">x{{ stage.repeat }}</span>
          </li>
        </ul>
      </div>
    </div>
  </li>
</template>
<script>
export default {
  name: 'ProtocolPickerCell',
  props: {
    pid: { type:String },
    protocol: { type:Object }
  },
  data() {
    return {
    }
  },
  created: function () {
  },
  methods: {
    select: function() {
      console.log("revealDetail %s",this.pid)
      this.$emit('select', this.pid, this.protocol)
    }
  }
}
</script>