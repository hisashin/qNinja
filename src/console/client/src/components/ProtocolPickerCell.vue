<template>
  <li
    class="item--list-card__cell item--list-card__cell--item"
    @click="select">
    <div class="protocol-cell-content">
      <div class="row">
        <div class="col-12 protocol-summary">
          <h3 class="protocol-summary__title">{{ protocol.name }}</h3>
          <ul class="protocol-summary__stages">
            <li class="protocol-summary__stages__stage"
              v-for="(stage, stageIndex) in protocol.stages" :key="stageIndex">
              <span v-if="stage.type==1" class="protocol-summary__stages__stage__label">Hold</span>
              <span v-if="stage.type==2" class="protocol-summary__stages__stage__label">PCR</span>
              <span v-if="stage.type==3" class="protocol-summary__stages__stage__label">Melt Curve</span>
              <span v-for="(step, stepIndex) in stage.steps" :key="stepIndex" class="protocol-summary__stages__stage__step">
                <span class="protocol-summary__stages__stage__step__temp">{{ step.temp }}℃</span>
                <span class="protocol-summary__stages__stage__step__duration">{{ step.duration }}sec</span>
              </span>
              <span v-if="stage.type==2" class="protocol-summary__stages__stage__cycles">x{{ stage.cycles }}</span>
            </li>
          </ul>
        </div>
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