"use strict";
const LogManager = require("./log_manager.js");

const lm = new LogManager();
lm.getSummaries({}, {}, (summaries)=>{
  summaries.forEach((summary)=>{
    console.log(summary);
  });
}, 
()=>{
});
/*
lm.getLatestLog((log)=>{
  console.log(log);
}, (err)=>{
  console.log(err);
});
*/
/*
lm.getLog ("037B8ACD-C29E-47FA-A59F-8CDFA3B1D0C8",
  (summary)=>{
    console.log(summary);
  },
  null);
  */