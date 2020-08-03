'use strict' ;
const OpticsAnalysis = require("./optics_analysis");

const id = "9c958213-73a5-4583-a793-9fb29ef020f4";
OpticsAnalysis.fromLogFile(id,(analysis)=>{
    analysis.calcBaseline();
    analysis.calcCt();
  }, (error)=>{
  console.error(error);
});