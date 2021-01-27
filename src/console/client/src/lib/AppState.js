"use strict";
const device = require("../lib/Device.js");
const Util = require("../lib/Util.js");
const client = require("../lib/RestClient.js");

class AppState {
  constructor () {
    this.protocols = [];
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
  
  // Returns current panel component
  pushPanel (panel) {
    this._confirmLeavePanel(()=>{
      const toPanel = this.getPanel(panel);
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
    });
  }
  backPanel () {
    if (this.panelStack.length < 2) {
      return;
    }
    this._confirmLeavePanel(()=>{
      this.panelStack.pop();
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
    });
  }
  home () {
    if (this.panelStack.length < 2) {
      return;
    }
    this._confirmLeavePanel(()=>{
      while (this.panelStack.length > 1) {
        this.panelStack.pop();
      }
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
      
    });
    
  }
  // Call custom confirmation handler and wait for its result.
  _confirmLeavePanel (callback) {
    const fromPanel = this._currentPanel();
    if (fromPanel.confirmLeave) {
      fromPanel.confirmLeave(callback);
      if (fromPanel.onDisappear) {
        fromPanel.onDisappear();
      }
    } else {
      callback();
      if (fromPanel.onDisappear) {
        fromPanel.onDisappear();
      }
    }
  }
  _currentPanel () {
    return this.getPanel(this.panelStack[this.panelStack.length-1]);
  }
  _didNavigate () {
    //console.log("didNavigate")
    if (this.navigationHandler) {
      this.navigationHandler(this.panelStack);
    }
  }
  run (experimentId) {
    device.runExperiment(experimentId);
    this.pushPanel(this.PANELS.EXPERIMENT_MONITOR);
  }
  
  startEditProtocol (id) {
    client.fetchProtocol(id, (data)=>{
      this.views.panelProtocolEditor.startEditProtocol(data);
      this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
    });
  }
  startCreateProtocol () {
    console.log("AppState.editProtocol");
    this.views.panelProtocolEditor.startCreateProtocol();
    this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
  }
  newProtocol () {
    console.log("AppState.newProtocol");
  }
  
  revealDetailProtocol (id) {
    console.log("AppState.revealDetailProtocol id=%s", id);
    client.fetchProtocol(id, (item)=>{
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
  
  
  revealDetailExperiment (id) {
    console.log("AppState.revealDetailExperiment.");
    client.fetchExperiment(id, (experiment)=>{
      this.pushPanel(this.PANELS.EXPERIMENT_EDITOR);
      this.views.panelExperimentEditor.setExperiment(experiment);
    },
    (error)=>{
      // TODO
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
  
  /* TODO Separate API call and UI control */
  
  init () {
    /* HTTP request methods */
    Util.requestData("device", null, "GET", 
      (data)=>{
        device.config = data.config;
        if (data.hasExperiment) {
          Util.requestData("device/experiment", null, "GET", 
            (data)=>{
              device.setExperiment(data);
            }, 
            ()=>{});
        }
        device.setDeviceState(data);
      }, (error)=>{
        console.error(error);
      }
    );
  }
  
  draftExperimentWithProtocol (id) {
    client.fetchProtocol(id, (data)=>{
      const option = { protocol: data.protocol };
      client.submitDraftExperiment(option, (data)=>{
          this.views.panelExperimentEditor.startCreateExperiment(data);
          this.pushPanel(this.PANELS.EXPERIMENT_EDITOR);
        }, 
        ()=>{}
      );
    });
  }
  
  draftExperiment () {
    client.submitDraftExperiment({}, (data)=>{
      this.views.panelExperimentEditor.startCreateExperiment(data);
      this.pushPanel(this.PANELS.EXPERIMENT_EDITOR);
    },
    ()=>{
      console.error("error fetch submitDraftExperiment");
    });
  }
  
}
const appState = new AppState();
module.exports = appState;