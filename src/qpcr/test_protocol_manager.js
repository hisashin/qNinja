"use strict";
const ProtocolManager = require("./protocol_manager.js");

const pm = new ProtocolManager();

const demo_protocol_d = {
  "name": "Demo Protocol D",
  "created": "2020-06-27T00:00:00Z",
  "modified": "2020-06-28T00:00:00Z",
  "protocol": {
    "lidTemp": 110,
    "stages": [
      {
        "type": 1,
        "repeat": 1,
        "steps": [
          {
            "label": "hold",
            "temp": 94,
            "duration": 15,
            "data_collection": []
          }
        ]
      },
      {
        "type": 2,
        "repeat": 30,
        "steps": [
          {
            "label": "denature",
            "temp": 94,
            "duration": 15,
            "data_collection": [
              3,
              4
            ]
          },
          {
            "label": "anneal",
            "temp": 55,
            "duration": 12,
            "data_collection": [
              3,
              4
            ]
          },
          {
            "label": "extend",
            "temp": 72,
            "duration": 18,
            "data_collection": [
              3,
              4
            ]
          }
        ]
      },
      {
        "type": 3,
        "repeat": 1,
        "steps": [
          {
            "label": "denature",
            "temp": 94,
            "duration": 10,
            "speed": 4,
            "data_collection": []
          },
          {
            "label": "cool",
            "temp": 55,
            "duration": 5,
            "speed": 4,
            "data_collection": []
          },
          {
            "label": "melt",
            "temp": 94,
            "duration": 15,
            "speed": 0.05,
            "data_collection": [
              1
            ]
          }
        ]
      }
    ]
  }
};

// demo_protocol_d
/*
const demo_uuid = "33D4665F-C85F-4CD7-9A3E-F51D4F2550FD";
pm.getProtocols((protocols)=>{
  console.log("onLoad");
  protocols.forEach((protocol)=>{
    console.log(protocol.content.name);
  });
},
()=>{
  console.log("Error");
});
*/
/*

pm.save(demo_protocol_d, null, (id)=>{
  console.log("Saved as %s",id);
});
*/
/*

pm.delete("93608c5a-8837-4a6b-971e-d8c10ea0a293")
*/

pm.duplicate("704D8607-5040-4B07-8401-7F90E8B855C4", (id, content)=>{
  console.log("id:");
  console.log(id);
  console.log("content");
  console.log(content);
},
 (err)=>{
   console.log(err);
 });