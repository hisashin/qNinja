"use strict";
const device = require("../lib/Device.js");
const Util = require("../lib/Util.js");

class AppState {
  constructor () {
    this.protocols = [];
    this.experimentSummaries = [];
    this.selectedProtocol = null;
    this.navigationHandler = null;
    
    /* Event handlers */
    this.panelContainer = null;
    this.panelStack = [];
    
    this.PANELS = {
      DASHBOARD:1,
      PROTOCOL_LIST:2,
      PROTOCOL_DETAIL:3,
      PROTOCOL_EDITOR:4,
      EXPERIMENT_EDITOR:5,
      EXPERIMENT_LIST:6,
      EXPERIMENT_DETAIL:7,
      EXPERIMENT_MONITOR:8,
      TEMPLATE:9
    };
    this.views = {
      protocolDetail: null,
      protocolEditor: null,
      experimentDetail: null,
      experimentEditor: null,
      experimentMonitor: null
    };
    this.panelStack.push(this.PANELS.DASHBOARD);
  }
  setNavigationHandler (handler) {
    this.navigationHandler = handler;
  }
  getPanel (panel) {
    return this.viewsMap[panel];
  }
  
  init () {
    console.log("AppState.init");
    /* HTTP request methods */
    Util.requestData("device", null, "GET", 
      (data)=>{
        device.config = data.config;
        if (data.hasExperiment) {
          Util.requestData("device/experiment", null, "GET", 
            (data)=>{
              device.setProtocol(data.protocol);
            }, 
            ()=>{});
        }
        device.setDeviceState(data);
      }, (error)=>{
        console.error(error);
      }
    );
  }
  setViews (views) {
    this.views = views;
    this.viewsMap = [];
    this.viewsMap[this.PANELS.DASHBOARD] = this.views.panelDashboard;
    this.viewsMap[this.PANELS.PROTOCOL_LIST] = this.views.panelProtocolList;
    this.viewsMap[this.PANELS.PROTOCOL_DETAIL] = this.views.panelProtocolDetail;
    this.viewsMap[this.PANELS.EXPERIMENT_LIST] = this.views.panelExperimentList;
    this.viewsMap[this.PANELS.EXPERIMENT_DETAIL] = this.views.panelExperimentDetail;
    this.viewsMap[this.PANELS.PROTOCOL_EDITOR] = this.views.panelProtocolEditor;
    this.viewsMap[this.PANELS.EXPERIMENT_EDITOR] = this.views.panelExperimentEditor;
    this.viewsMap[this.PANELS.EXPERIMENT_MONITOR] = this.views.panelExperimentMonitor;
    this.viewsMap[this.PANELS.TEMPLATE] = this.views.panelTemplate;
    this.views.panelDashboard.onAppear();

  }
  
  /* Public methods */
  pushPanel (panel) {
    const toPanel = this.getPanel(panel);
    location.href=("#" + Math.random())
    if (toPanel && toPanel.onAppear) {
      toPanel.onAppear();
    } else {
      console.log("onAppear not defined.");
    }
    this.panelStack.push(panel);
    if (this.panelContainer) {
      this.panelContainer.presentPanel(panel);
      this._didNavigate();
    } else {
      console.log("PushPanel panelContainer is null.");
    }
  }
  backPanel () {
    if (this.panelStack.length < 2) {
      return;
    }
    this.panelStack.pop();
    console.log(this.panelStack)
    if (this.panelContainer) {
      const panel = this.panelStack[this.panelStack.length-1];
      const toPanel = this.getPanel(panel);
      if (toPanel && toPanel.onAppear) {
        toPanel.onAppear();
      } else {
        console.log("onAppear not defined.");
      }
      this.panelContainer.presentPanel(panel);
      this._didNavigate();
    }
  }
  _didNavigate () {
    console.log("didNavigate")
    if (this.navigationHandler) {
      this.navigationHandler(this.panelStack);
    }
  }
  prepareExperiment (id) {
    console.log("AppState.prepareExperiment");
    this._loadProtocol(id, (data)=>{
      console.log("loadProtocol  callback");
      console.log(data)
      this.views.panelExperimentEditor.startCreateExperiment(data);
      this.pushPanel(this.PANELS.EXPERIMENT_EDITOR);
    });
  }
  run (protocol, config) {
    device.registerProtocol(protocol);
    device.start(config);
    this.pushPanel(this.PANELS.EXPERIMENT_MONITOR);
  }
  
  startEditProtocol (id) {
    console.log("AppState.startEditProtocol");
    this._loadProtocol(id, (data)=>{
      this.views.panelProtocolEditor.startEditProtocol(data);
      this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
    });
  }
  
  startCreateProtocol (id) {
    console.log("AppState.editProtocol");
    this.views.panelProtocolEditor.startCreateProtocol();
    this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
  }
  
  newProtocol () {
    console.log("AppState.newProtocol");
    
  }
  
  revealDetailProtocol (id) {
    console.log("AppState.revealDetailProtocol id=%s", id);
    this._loadProtocol(id, (item)=>{
      this.views.panelProtocolDetail.setProtocol(item.protocol);
      this.pushPanel(this.PANELS.PROTOCOL_DETAIL);
    });
  }
  duplicateProtocol (id) {
    console.log("AppState.duplicateProtocol (TODO)");
  }
  
  // Deprecated
  getProtocols () {
    return this.protocols;
  }
  // Deprecated
  sortProtocols () {
    console.log("AppState.sortProtocols");
  }
  
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
  
  fetchProtocols (params, callback, onError) {
    console.log("AppState.fetchProtocols");
    Util.requestData(this._createURL("protocols", params), null, "GET", 
      (data)=>{
        this.protocols = data.data;
        callback(data);
      }, (error)=>{
        console.log("Error");
        if (onError) {
          onError(error);
        }
      }
    );
  }
  
  // TODO use callback
  fetchExperiments (params, callback, onError) {
    console.log("AppState.fetchExperiments");
    Util.requestData(this._createURL("experiments", params), null, "GET", 
      (data)=>{
        this.experimentSummaries = data;
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
  
  fetchMeltCurve (onSuccess, onFail) {
    Util.requestData("device/experiment/melt_curve", null, "GET", 
      (data)=>{
        console.log("Device.fetchMeltCurve callback");
        onSuccess(data);
      }, (error)=>{
        console.log("Error %s", error);
        onFail(error);
      }
    );
    
  }
  
  revealDetailExperiment (id) {
    console.log("AppState.revealDetailExperiment.");
    this._loadExperiment(id, (experiment)=>{
      this.pushPanel(this.PANELS.EXPERIMENT_DETAIL);
      this.views.panelExperimentDetail.setExperiment(experiment);
    });
  }
  
  _loadExperiment (id, callback) {
    Util.requestData("experiments/" + id, null, "GET", 
      (data)=>{
        callback(data);
      }, (error)=>{
        console.log(error);
      }
    );
  }
  
  // Select protocol for running
  _loadProtocol (id, callback) {
    Util.requestData("protocols/" + id, null, "GET", 
      (data)=>{
        callback(data);
      }, (error)=>{
        console.error(error);
      }
    );
  }
  
  submitUpdateProtocol (obj, onSave, onError) {
    console.log("AppState.submitUpdateProtocol");
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
  
  submitCreateProtocol (obj, onSave, onError) {
    console.log("AppState.saveProtocol");
    const path = "protocols";
    Util.requestData(path, obj, "POST", ()=>{
      if (onSave) {
        onSave();
      }
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  submitDeleteProtocol (id, onSave, onError) {
    console.log("AppState.submitDeleteProtocol %s", id);
    const path = "protocols/" + id;
    Util.requestData(path, null, "DELETE", ()=>{
      if (onSave) {
        onSave();
      }
      this.fetchProtocols();
    }, (error)=>{
      if (onError) {
        onError(error);
      }
    });
  }
  
  /* Event handler registration */
  setPanelContainer (container) {
    this.panelContainer = container;
  }
  
  toast (context, title, message) {
    console.log("AppState.toast %s %s", title, message);
    context.$bvToast.toast(message, {
      title: title
    })
  }
  
}
const appState = new AppState();
module.exports = appState;