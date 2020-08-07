'use strict' ;
const OpticsAnalysis = require("./optics_analysis");
const LogManager = require("./log_manager");

const id = "882c49ec-6e24-4b5c-bde7-57055301e332";

const logManager = new LogManager();
logManager.getLog(id, (log)=>{
  const analysis = new OpticsAnalysis(log);
  analysis.calcBaseline();
  analysis.calcCt();
  analysis.calcMeltCurve();
  log.baseline = analysis.getBaselines();
  log.ct = analysis.getCt();
  log.melt_curve = analysis.getMeltCurve();
  let hasNext = true;
  do {
    hasNext = analysis.calcMeltCurve(10);
    console.log(hasNext)
  } while (hasNext);
  console.log(analysis.getMeltCurve());
  
}, (error)=>{ console.error(error)});