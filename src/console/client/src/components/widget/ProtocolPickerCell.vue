<template>
  <li
    class="list-card-cell list-card-cell--item"
    @click="select">
    <div class="protocol-summary">
      <h3 class="protocol-summary__title">{{ protocol.name }}</h3>
      <ul class="protocol-summary__stages">
        <li class="protocol-summary__stage"
          v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
          <span v-if="stage.type==1" class="protocol-summary__stage-label">Hold</span>
          <span v-if="stage.type==2" class="protocol-summary__stage-label">PCR</span>
          <span v-if="stage.type==3" class="protocol-summary__stage-label">Melt Curve</span>
          <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex" class="protocol-summary__step">
            <span class="protocol-summary__step-temp">{{ step.temp }}℃</span>
            <span class="protocol-summary__step-duration">{{ step.duration }}sec</span>
          </span>
          <span v-if="stage.type==2" class="protocol-summary__cycles">x{{ stage.cycles }}</span>
        </li>
      </ul>
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