'use strict' ;
const OpticsAnalysis = require("./optics_analysis");

const id = "882c49ec-6e24-4b5c-bde7-57055301e332";
OpticsAnalysis.fromLogFile(id,(analysis)=>{
    analysis.calcBaseline();
    analysis.calcCt();
    let hasNext = true;
    do {
      hasNext = analysis.calcMeltCurve(10);
      console.log(hasNext)
    } while (hasNext);
    console.log(analysis.getMeltCurve());
  }, (error)=>{
  console.error(error);
});