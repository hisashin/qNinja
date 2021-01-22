"use strict";
const pm = require("./protocol_manager.js");

pm.duplicate("704D8607-5040-4B07-8401-7F90E8B855C4", (id, content)=>{
  console.log("id:");
  console.log(id);
  console.log("content");
  console.log(content);
},
 (err)=>{
   console.log(err);
 });