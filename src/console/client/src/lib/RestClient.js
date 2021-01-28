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
    Util.requestData("device/experiment", null, "GET", onSuccess, onFail);
  }
  // GET /protocols
  fetchProtocols (params, callback, onError) {
    Util.requestData(client._createURL("protocols", params), null, "GET", callback, onError);
  }
  
  // GET /protocol/{id}
  fetchProtocol (id, callback, onError) {
    Util.requestData("protocols/" + id, null, "GET", callback, onError);
  }
  
  // POST /protocols
  submitCreateProtocol (obj, onSave, onError) {
    const path = "protocols";
    Util.requestData(path, obj, "POST", onSave, onError);
  }
  
  // PUT protools/{id}
  submitUpdateProtocol (obj, onSave, onError) {
    const path = "protocols/" + obj.id;
    Util.requestData(path, obj, "PUT", onSave, onError);
  }
  
  // GET /experiments
  fetchExperiments (params, callback, onError) {
    Util.requestData(client._createURL("experiments", params), null, "GET", callback, onError);
  }
  
  // POST /experiments
  submitCreateExperiment (obj, onSave, onError) {
    const path = "experiments";
    Util.requestData(path, obj, "POST", onSave, onError);
  }
  
  // GET /experiment/id
  fetchExperiment (id, callback, onFail) {
    Util.requestData("experiments/" + id, null, "GET", callback, onFail);
  }
  
  // PUT /experiments/{id}/{key}
  submitUpdateExperimentProperty (id, key, valueObj, onSave, onError) {
    const path = "experiments/" + id + "/" + key;
    Util.requestData(path, valueObj, "PUT", onSave, onError);
  }
  
  // PUT /experiments/{id}
  submitUpdateExperiment (id, valueObj, onSave, onError) {
    const path = "experiments/" + id;
    Util.requestData(path, valueObj, "PUT", onSave, onError);
  }
  
  // DELETE /experiments/{id}
  submitDeleteProtocol (id, onSave, onError) {
    const path = "protocols/" + id;
    Util.requestData(path, null, "DELETE", onSave, onError);
  }
  
  // POST experiments/draft
  submitDraftExperiment (option, onSuccess, onError) {
    Util.requestData("experiments/draft", option, "POST", onSuccess, onError);
  }
}
const client = new RestClient();
module.exports = client;