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
  fetchDevice (onSuccess, onError) {
    Util.requestData("device", null, "GET", onSuccess, onError);
  }
  
  // GET device/experiment
  fetchDeviceExperiment (onSuccess, onError) {
    Util.requestData("device/experiment", null, "GET", onSuccess, onError);
  }
  // GET /protocols
  fetchProtocols (params, onSuccess, onError) {
    Util.requestData(client._createURL("protocols", params), null, "GET", onSuccess, onError);
  }
  
  // GET /protocol/{id}
  fetchProtocol (id, onSuccess, onError) {
    Util.requestData("protocols/" + id, null, "GET", onSuccess, onError);
  }
  
  // POST /protocols
  submitCreateProtocol (obj, onSuccess, onError) {
    const path = "protocols";
    Util.requestData(path, obj, "POST", onSuccess, onError);
  }
  
  // PUT protools/{id}
  submitUpdateProtocol (obj, onSuccess, onError) {
    const path = "protocols/" + obj.id;
    Util.requestData(path, obj, "PUT", onSuccess, onError);
  }
  
  // GET /experiments
  fetchExperiments (params, onSuccess, onError) {
    Util.requestData(client._createURL("experiments", params), null, "GET", onSuccess, onError);
  }
  
  // POST /experiments
  submitCreateExperiment (obj, onSuccess, onError) {
    const path = "experiments";
    Util.requestData(path, obj, "POST", onSuccess, onError);
  }
  
  // GET /experiment/id
  fetchExperiment (id, onSuccess, onError) {
    Util.requestData("experiments/" + id, null, "GET", onSuccess, onError);
  }
  
  // PUT /experiments/{id}/{key}
  submitUpdateExperimentProperty (id, key, valueObj, onSuccess, onError) {
    const path = "experiments/" + id + "/" + key;
    Util.requestData(path, valueObj, "PUT", onSuccess, onError);
  }
  
  // PUT /experiments/{id}
  submitUpdateExperiment (id, valueObj, onSuccess, onError) {
    const path = "experiments/" + id;
    Util.requestData(path, valueObj, "PUT", onSuccess, onError);
  }
  
  // DELETE /protocol/{id}
  submitDeleteProtocol (id, onSuccess, onError) {
    const path = "protocols/" + id;
    Util.requestData(path, null, "DELETE", onSuccess, onError);
  }
  // DELETE /protocol/{id}
  submitDeleteExperiment (id, onSuccess, onError) {
    const path = "experiments/" + id;
    Util.requestData(path, null, "DELETE", onSuccess, onError);
  }
  
  // POST experiments/draft
  submitDraftExperiment (option, onSuccess, onError) {
    Util.requestData("experiments/draft", option, "POST", onSuccess, onError);
  }
  
  // Export URL
  getExperimentExportURL(id, property, ext) {
    let url = Util.apiEndpoint() + "experiments/" + id + "/log/" + property;
    if (ext) {
      url += ("." + ext);
    }
    return url;
  }
}
const client = new RestClient();
module.exports = client;