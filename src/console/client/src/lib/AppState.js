"use strict";
const device = require("../lib/Device.js");
const Util = require("../lib/Util.js");

class AppState {
  constructor () {
    this.protocols = [];
    this.logSummaries = [];
    this.selectedProtocol = null;
    
    /* Event handlers */
    this.logEventHandlers = [];
    this.panelContainer = null;
    this.panelStack = [];
    
    this.PANELS = {
      DASHBOARD:1,
      PROTOCOL_LIST:2,
      PROTOCOL_DETAIL:3,
      PROTOCOL_EDITOR:4,
      EXPERIMENT_EDITOR:5,
      LOG_LIST:6,
      LOG_DETAIL:7,
      EXPERIMENT_MONITOR:8
    };
    this.views = {
      protocolDetail: null,
      protocolEditor: null,
      logDetail: null,
      experimentEditor: null,
      experimentMonitor: null
    };
    this.panelStack.push(this.PANELS.DASHBOARD);
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
    this.viewsMap[this.PANELS.LOG_LIST] = this.views.panelLogList;
    this.viewsMap[this.PANELS.LOG_DETAIL] = this.views.panelLogDetail;
    this.viewsMap[this.PANELS.PROTOCOL_EDITOR] = this.views.panelProtocolEditor;
    this.viewsMap[this.PANELS.EXPERIMENT_EDITOR] = this.views.panelExperimentEditor;
    this.viewsMap[this.PANELS.EXPERIMENT_MONITOR] = this.views.panelExperimentMonitor;
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
    }
  }
  prepareExperiment (id) {
    console.log("AppState.prepareExperiment");
    this._loadProtocol(id, (data)=>{
      this.views.panelExperimentEditor.startEditProtocol(data.protocol);
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
  
  fetchProtocols (params, callback) {
    console.log("AppState.fetchProtocols");
    Util.requestData(this._createURL("protocols", params), null, "GET", 
      (data)=>{
        this.protocols = data.data;
        callback(data);
      }, ()=>{
        console.log("Error");
      }
    );
  }
  getLogSummaries () {
    return this.logSummaries;
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
  
  reloadLogs () {
    console.log("AppState.reloadLogs");
    Util.requestData("logs", null, "GET", 
      (data)=>{
        this.logSummaries = data;
        this.logEventHandlers.forEach((handler)=>{
          if (handler.onLogSummariesUpdate) {
            handler.onLogSummariesUpdate(this.logSummaries);
          }
        });
      }, (error)=>{
        console.log("Error %s", error);
      }
    );
  }
  
  revealDetailLog (id) {
    console.log("AppState.revealDetailLog.");
    this._loadLog(id, (log)=>{
      this.pushPanel(this.PANELS.LOG_DETAIL);
      this.views.panelLogDetail.setLog(log);
    });
  }
  
  _loadLog (id, callback) {
    console.log("AppState.selectLog id=%s", id);
    Util.requestData("logs/" + id, null, "GET", 
      (data)=>{
        this.selectedLog = data;
        console.log("AppState.selectLog id=%s data received.", id);
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
        console.log(error);
      }
    );
  }
  
  submitUpdateProtocol (obj, onSave) {
    console.log("AppState.submitUpdateProtocol");
    const path = "protocols/" + obj.id;
    Util.requestData(path, obj, "PUT", ()=>{
      if (onSave) {
        onSave();
      }
    }, ()=>{
    });
  }
  
  submitCreateProtocol (obj, onSave) {
    console.log("AppState.saveProtocol");
    const path = "protocols";
    Util.requestData(path, obj, "POST", ()=>{
      if (onSave) {
        onSave();
      }
    }, ()=>{
    });
  }
  
  submitDeleteProtocol (id, onSave) {
    console.log("AppState.submitDeleteProtocol %s", id);
    const path = "protocols/" + id;
    Util.requestData(path, null, "DELETE", ()=>{
      if (onSave) {
        onSave();
      }
      this.fetchProtocols();
    }, ()=>{
    });
  }
  
  /* Event handler registration */
  addLogEventHandler (handler) {
    this.logEventHandlers.push(handler);
  }
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