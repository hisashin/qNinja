const STAGE_TYPE_HOLD = 1;
const STAGE_TYPE_PCR = 2;
const STAGE_TYPE_MELT_CURVE = 3;

/* Templates */
const templateHoldStage = `
<div>
  <h3>Hold Stage</h3>
  <ul>
    <li>
      <input v-model.number="temp" type="number"/>℃
      <input v-model.number="hold" type="number" step="1"/>sec
    </li>
  </ul>
  <button v-on:click="confirmDelete">Delete</button>
</div>
`;

const templatePCRStage = `
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
  <button v-on:click="confirmDelete">Delete</button>
</div>
`;

const templateMeltCurveStage = `
<div>
  <h3>Melt Curve Stage</h3>
  <ul>
    <li>
      Heating
      <input v-model.number="heatTemp" type="number"/>℃
      <input v-model.number="heatHold" type="number" step="1"/>sec
      <input v-model.number="heatSpeed" type="number" step="1"/>℃/sec
    </li>
    <li>
      Cooling
      <input v-model.number="coolTemp" type="number"/>℃
      <input v-model.number="coolHold" type="number" step="1"/>sec
      <input v-model.number="coolSpeed" type="number" step="1"/>℃/sec
    </li>
    <li>
      Melting
      <input v-model.number="meltTemp" type="number"/>℃
      <input v-model.number="meltHold" type="number" step="1"/>sec
      <input v-model.number="meltSpeed" type="number" step="1"/>℃/sec
    </li>
  </ul>
  <button v-on:click="confirmDelete">Delete</button>
</div>
`;


const templateStage = `
<hold-stage v-if="stage.type==1"></hold-stage>
<pcr-stage v-if="stage.type==2"></pcr-stage>
<melt-curve-stage v-if="stage.type==3"></melt-curve-stage>
`;

/* Components */
Vue.component('hold-stage', {
  data: function () {
    return {
      temp:94,
      hold:120
    }
  },
  methods: {
    confirmDelete: function (event) {
      alert("TODO delete");
    }
  },
  template: templateHoldStage
});

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
    confirmDelete: function (event) {
      alert("TODO delete");
    }
  },
  template: templatePCRStage
});

Vue.component('melt-curve-stage', {
  data: function () {
    return {
      heatTemp:94,
      heatHold:20,
      heatSpeed:4,
      coolTemp:94,
      coolHold:20,
      coolSpeed:4,
      meltTemp:94,
      meltHold:20,
      meltSpeed:0.04
    }
  },
  methods: {
    confirmDelete: function (event) {
      alert("TODO delete");
    }
  },
  template: templateMeltCurveStage
});


Vue.component('stage', {
  template: templateStage
});

new Vue({ 
  el: '#protocolEditor',
  data: {
    stages: [ 
      { type: STAGE_TYPE_HOLD },
      { type: STAGE_TYPE_PCR },
      { type: STAGE_TYPE_MELT_CURVE }
    ]
  },
  methods: {
    add: function () {
      this.stages.push({ type: STAGE_TYPE_MELT_CURVE});
    },
    save: function () {
      this.stages.forEach((stage)=>{
        console.log(stage)
        if (stage.type==STAGE_TYPE_HOLD) {
          console.log("Hold %d, %d", stage.temp, stage.hold);
        }
        if (stage.type==STAGE_TYPE_PCR) {
          console.log("PCR %d, %d", stage.temp, stage.hold);
        }
        if (stage.type==STAGE_TYPE_MELT_CURVE) {
          console.log("Melt Curve %d, %d", stage.temp, stage.hold);
        }
      });
    }
  }
});