const templatePCR = `
<div>
  <h3>PCR Stage</h3>
  Repeat <input v-model.number="repeat" type="number"/> times
  <ul>
    <li>
      Extending
      <input v-model.number="denaturingTemp" type="number"/>℃
      <input v-model.number="denaturingHold" type="number" step="1"/>sec
    </li>
    <li>
      Annealing
      <input v-model.number="annealingTemp" type="number"/>℃
      <input v-model.number="annealingHold" type="number" step="1"/>sec
    </li>
    <li>
      Extending
      <input v-model.number="extendingTemp" type="number"/>℃
      <input v-model.number="extendingHold" type="number" step="1"/>sec
    </li>
  </ul>
  <button v-on:click="save">OK</button>
</div>
`;
Vue.component('pcr-stage', {
  data: function () {
    return {
      repeat:30,
      denaturingTemp:94,
      denaturingHold:20,
      annealingTemp:56,
      annealingHold:15,
      extendingTemp:72,
      extendingHold:10
    }
  },
  methods: {
    save: function (event) {
      console.log("Repeat %d times", this.repeat);
      console.log("Denaturing %fC %dsec", this.denaturingTemp, this.denaturingHold);
      console.log("Annealing %fC %dsec", this.annealingTemp, this.annealingHold);
      console.log("Extending %fC %dsec", this.extendingTemp, this.extendingHold);
    }
  },
  template: templatePCR
})
new Vue({ 
  el: '#protocolEditor',
  data: {
    stages: [ 0 ]
  },
  methods: {
    add: function () {
      this.stages.push(0);
    }
  }
})