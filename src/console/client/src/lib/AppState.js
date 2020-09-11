"use strict";
const device = require("../lib/Device.js");
const Util = require("../lib/Util.js");

class AppState {
  constructor () {
    this.protocols = [];
    this.logSummaries = [];
    this.selectedProtocol = null;
    
    /* Event handlers */
    this.protocolEventHandlers = [];
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
  
  /* Public methods */
  pushPanel (panel) {
    console.log("AppState.pushPanel %d",panel);
    this.panelStack.push(panel);
    if (this.panelContainer) {
      this.panelContainer.presentPanel(panel);
    } else {
      console.log("PushPanel panelContainer is null.");
    }
  }
  backPanel () {
    console.log("backPanel Stack=" + this.panelStack);
    if (this.panelStack.length < 2) {
      return;
    }
    this.panelStack.pop();
    if (this.panelContainer) {
      this.panelContainer.presentPanel(this.panelStack[this.panelStack.length-1]);
    }
  }
  prepareExperiment (id) {
    console.log("AppState.prepareExperiment");
    this._loadProtocol(id, (data)=>{
      this.views.experimentEditor.setProtocol(data.protocol);
      this.pushPanel(this.PANELS.EXPERIMENT_EDITOR);
    });
  }
  run (protocol, config) {
    device.registerProtocol(protocol);
    device.start(config);
    this.pushPanel(this.PANELS.EXPERIMENT_MONITOR);
  }
  editProtocol (id) {
    console.log("AppState.editProtocol");
    this._loadProtocol(id, (data)=>{
      this.views.protocolEditor.setProtocol(data);
      this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
    });
  }
  revealDetailProtocol (id) {
    console.log("AppState.revealDetailProtocol id=%s", id);
    this._loadProtocol(id, (item)=>{
      this.views.protocolDetail.setProtocol(item.protocol);
      this.pushPanel(this.PANELS.PROTOCOL_DETAIL);
    });
  }
  deleteProtocol (id) {
    console.log("AppState.deleteProtocol (TODO)");
  }
  duplicateProtocol (id) {
    console.log("AppState.duplicateProtocol (TODO)");
  }
  
  getProtocols () {
    return this.protocols;
  }
  sortProtocols () {
    console.log("AppState.sortProtocols");
  }
  
  reloadProtocols () {
    console.log("AppState.reloadProtocols");
    Util.requestData("protocols", null, "GET", 
      (data)=>{
        this.protocols = data;
        this.protocolEventHandlers.forEach((handler)=>{
          if (handler.onProtocolListUpdate) {
            handler.onProtocolListUpdate(this.protocols);
          }
        });
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
        console.log("AppState.reloadLogs callback");
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
      this.views.logDetail.setLog(log);
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
  
  saveProtocol (obj, onSave) {
    console.log("AppState.saveProtocol");
    const path = "protocols/" + obj.id;
    Util.requestData(path, obj, "PUT", ()=>{
      if (onSave) {
        onSave();
      }
      this.reloadProtocols();
    }, ()=>{
    });
  }
  
  /* Event handler registration */
  addProtocolEventHandler (handler) {
    this.protocolEventHandlers.push(handler);
  }
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