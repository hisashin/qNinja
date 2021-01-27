"use strict";
const Util = require("../lib/Util.js");

class RestClient {
  
  _createURL (baseURL, params) {
      let a = [];
      if (params == null || Object.keys(params).length === 0) {
        // No params
        return baseURL;
      }
      for (let key in params) {
        a.push(key + "=" + params[key]);
      }
      return baseURL + "?" + a.join("&");
  }
  
  // GET device/experiment
  fetchDeviceExperiment (onSuccess, onFail) {
    Util.requestData("device/experiment", null, "GET", 
      (data)=>{
        console.log("Device.fetchDeviceExperiment callback");
        onSuccess(data);
      }, (error)=>{
        console.log("Error %s", error);
        onFail(error);
      }
    );
  }
  // GET /protocols
  fetchProtocols (params, callback, onError) {
    Util.requestData(client._createURL("protocols", params), null, "GET", 
      (data)=>{
        callback(data);
      }, (error)=>{
        console.log("Error");
        if (onError) {
          onError(error);
        }
      }
    );
  }
  
  // GET /protocol/{id}
  fetchProtocol (id, callback, onError) {
    Util.requestData("protocols/" + id, null, "GET", 
      (data)=>{
        callback(data);
      }, (error)=>{
        console.error(error);
        if (onError) {
          onError(error);
        }
      }
    );
  }
  
  // POST /protocols
  submitCreateProtocol (obj, onSave, onError) {
    const path = "protocols";
    Util.requestData(path, obj, "POST", (res)=>{
      if (onSave) {
        onSave(res);
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // PUT protools/{id}
  submitUpdateProtocol (obj, onSave, onError) {
    const path = "protocols/" + obj.id;
    Util.requestData(path, obj, "PUT", ()=>{
      if (onSave) {
        onSave();
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // GET /experiments
  fetchExperiments (params, callback, onError) {
    Util.requestData(client._createURL("experiments", params), null, "GET", 
      (data)=>{
        if (callback) {
          callback(data);
        }
      }, (error)=>{
        console.log("Error %s", error);
        if (onError) {
          onError(error);
        }
      }
    );
  }
  
  // POST /experiments
  submitCreateExperiment (obj, onSave, onError) {
    const path = "experiments";
    Util.requestData(path, obj, "POST", (res)=>{
      if (onSave) {
        onSave(res);
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // GET /experiment/id
  fetchExperiment (id, callback, onFail) {
    Util.requestData("experiments/" + id, null, "GET", 
      (data)=>{
        callback(data);
      }, (error)=>{
        console.log(error);
        if (onFail) {
          onFail(error);
        }
      }
    );
  }
  
  // PUT /experiments/{id}/{key}
  submitUpdateExperimentProperty (id, key, valueObj, onSave, onError) {
    const path = "experiments/" + id + "/" + key;
    Util.requestData(path, valueObj, "PUT", (res)=>{
      if (onSave) {
        onSave(res);
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // PUT /experiments/{id}
  submitUpdateExperiment (id, valueObj, onSave, onError) {
    const path = "experiments/" + id;
    Util.requestData(path, valueObj, "PUT", (res)=>{
      if (onSave) {
        onSave(res);
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // DELETE /experiments/{id}
  submitDeleteProtocol (id, onSave, onError) {
    const path = "protocols/" + id;
    Util.requestData(path, null, "DELETE", ()=>{
      if (onSave) {
        onSave();
      }
      client.fetchProtocols();
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  // POST experiments/draft
  submitDraftExperiment (option, onSuccess, onError) {
    Util.requestData("experiments/draft", option, "POST", onSuccess, onError);
  }
}
const client = new RestClient();
module.exports = client;