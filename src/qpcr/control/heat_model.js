"use strict";
/*
  Simulate a heat block with a simple mesh model
  (Model structure)
  Power influx (from heater) -> [ Element0 | Element1 | Element2 | Element3 | Element4 ] -> Air
*/

class HeatModel {
  constructor () {
    this.airTemp = 25.0;
    this.meshCount = 5;
    this.elements = []; // Temperature of each mesh element
    this.resBlock = 8; // Heat resistance between blocks
    this.resAir = 300 + 10 * Math.random(); // Heat resistance between block and air
    this.capacity = 0.65 + 0.02 * Math.random(); // Heat capacity of the whole block
    this.capacitySingle = this.capacity/this.meshCount; // Heat capacity of a single mesh
    this.deltaT = 0.5; // Measurement and control interval in sec
    this.sensorIndex = 1; // Use this.elements[1] as the thermistor value
    this.startTemp = 25 + 2  * Math.random();
    
    for (let i=0; i<this.meshCount; i++) {
      this.elements.push(this.startTemp + Math.random() * 1.0);
    }
    this.positiveInflux = 0;
    this.negativeInflux = 0;
    this.influx = 0;
    
    this.interval = 0.5;
    this.count = 1;
   }
  setPositiveInflux (v) {
    this.positiveInflux = Math.abs(v);
    this.influx = this.positiveInflux - this.negativeInflux;
  }
  setNegativeInflux (v) {
    this.negativeInflux = Math.abs(v);
    this.influx = this.positiveInflux - this.negativeInflux;
  }
  update () {
    this.count++;
    let next = this.elements.map(()=>{return 0;});
    next[0] = this.elements[0] + 
      this.deltaT * (this.influx-(this.elements[0]-this.elements[1])/this.resBlock)/this.capacitySingle;
    for (let i=1; i<this.meshCount - 1; i++) {
      next[i] = this.elements[i] + this.deltaT*(this.elements[i-1] + this.elements[i+1] - this.elements[i]*2)/(this.resBlock*this.capacitySingle);
    }
    let index = this.meshCount - 1;
    // Last
    next[index] = this.elements[index] +
      this.deltaT*(
        (this.elements[index-1]-this.elements[index])/this.resBlock-
        (this.elements[index]-this.airTemp)/this.resAir)
        /this.capacitySingle;
    this.elements = next;
  }
  getTemperature () {6
    return this.elements[this.sensorIndex];
  }
  debug () {
    console.log("[" + this.count + "]\t" + this.elements.join("\t"));
  }
}
module.exports = HeatModel;
/*
const model = new HeatModel();
model.setPositiveInflux(1.0);
model.setNegativeInflux(0);
for (let i=0; i<120; i++) {
  model.update();
  // model.debug();
  console.log(model.getTemperature());
}
*/