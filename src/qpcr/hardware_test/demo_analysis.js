"use strict";

const experimentManager = require("../experiment_manager");
const OpticsAnalysis = require("../optics_analysis");
const EXPERIMENT_ID = "ca89d006-d8fe-4c4e-ad2a-2619dbd600da";
experimentManager.getExperiment(EXPERIMENT_ID, 
  (experiment)=>{
    // console.log(experiment);
    try {
      console.log("Experiment loaded...");
      const analysis = new OpticsAnalysis(experiment).analyze();
      console.log(analysis);
    } catch (e) {
      console.error(e);
    }
  }, 
  ()=>{}
);