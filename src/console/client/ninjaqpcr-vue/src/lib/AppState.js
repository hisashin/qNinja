const device = require("../lib/Device.js");

const API_ENDPOINT = "http://localhost:2222/";
class AppState {
  constructor () {
    this.protocols = [];
    this.logSummaries = [];
    this.selectedProtocol = null;
    this.selectedLog = null;
    
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
      LOG_LIST:5,
      LOG_DETAIL:6,
      EXPERIMENT_MONITOR:7
    };
    this.panelStack.push(this.PANELS.DASHBOARD);
  }
  
  init () {
    console.log("AppState.init");
    /* HTTP request methods */
    this._requestData("device", null, "GET", 
      (data)=>{
        console.log("AppState.init received device state");
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
  runProtocol (id) {
    console.log("AppState.runProtocol");
    this._selectProtocol(id, (protocol)=>{
      device.setProtocol(protocol.protocol);
      device.start();
      this.pushPanel(this.PANELS.EXPERIMENT_MONITOR);
    });
  }
  editProtocol (id) {
    console.log("AppState.editProtocol");
    this._selectProtocol(id, (protocol)=>{
      this.pushPanel(this.PANELS.PROTOCOL_EDITOR);
    });
  }
  revealDetailProtocol (id) {
    console.log("AppState.revealDetailProtocol");
    this._selectProtocol(id, (protocol)=>{
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
  
  /* Utilities */
  _requestData (path, data, method, onSuccess, onError) {
    const xmlhttp = new XMLHttpRequest();
    const url = API_ENDPOINT + path;
    console.log("AppState._requestData Requesting %s", url);
    xmlhttp.onreadystatechange = ()=>{
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        console.log("AppState._requestData Success %s", url);
        try {
          onSuccess(JSON.parse(xmlhttp.responseText));
        } catch (e) {
          if (onError != null) {
            onError(e);
          }
        }
      }
    };
    xmlhttp.open(method, url, true);
    if (data == null) {
      xmlhttp.send();
    } else if (typeof(data)=='string') {
      xmlhttp.send(data);
    } else {
      xmlhttp.send(JSON.stringify(data));
    }
  }
  
  reloadProtocols () {
    console.log("AppState.reloadProtocols");
    this._requestData("protocols", null, "GET", 
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
  reloadLogs () {
    console.log("AppState.reloadLogs");
    this._requestData("logs", null, "GET", 
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
    this._selectLog(id, ()=>{
      this.pushPanel(this.PANELS.LOG_DETAIL);
    });
  }
  
  getSelectedLog() {
    this.selectedLog;
  }
  _selectLog (id, callback) {
    console.log("AppState.selectLog id=%s", id);
    this._requestData("logs/" + id, null, "GET", 
      (data)=>{
        this.selectedLog = data;
        console.log("AppState.selectLog id=%s data received.", id);
        console.log("AppState.selectLog calling %d handlers", this.logEventHandlers.length);
        this.logEventHandlers.forEach((handler)=>{
          if (handler.onSelectLog) {
            handler.onSelectLog(data);
          }
        });
        callback();
      }, (error)=>{
        console.log(error);
      }
    );
    
  }
  
  // Get protocol from server
  _selectProtocol (id, callback) {
    this._requestData("protocols/" + id, null, "GET", 
      (data)=>{
        this.selectedProtocol = data;
        console.log("AppState._selectProtocol selected. calling %d handlers.", this.protocolEventHandlers.length);
        this.protocolEventHandlers.forEach((handler)=>{
          if (handler.onSelectProtocol) {
            handler.onSelectProtocol(this.selectedProtocol);
          }
        });
        callback(this.selectedProtocol);
      }, (error)=>{
        console.log(error);
      }
    );
  }
  saveProtocol (obj, onSave) {
    console.log("AppState.saveProtocol");
    const path = "protocols/" + obj.id + "/update";
    this._requestData(path, obj, "POST", ()=>{
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
  
  
}
const appState = new AppState();
module.exports = appState;