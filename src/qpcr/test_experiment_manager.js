"use strict";

const em = require("./experiment_manager");
em.getSummaries({}, {}, (summaries)=>{
  summaries.forEach((summary)=>{
    console.log(summary);
  });
}, 
()=>{
});
/*
em.getLatestExperiment((experiment)=>{
  console.log(experiment);
}, (err)=>{
  console.log(err);
});
*/
/*
em.getExperiment ("037B8ACD-C29E-47FA-A59F-8CDFA3B1D0C8",
  (summary)=>{
    console.log(summary);
  },
  null);
  */