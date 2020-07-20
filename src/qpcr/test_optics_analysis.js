'use strict' ;
const OpticsAnalysis = require("./optics_analysis");

const id = "6ad79ae4-e6f0-4cad-8c7f-d799fd86a765";
OpticsAnalysis.fromLogFile(id,(analysis)=>{
    analysis.calcBaseline();
  }, (error)=>{
  console.error(error);
});