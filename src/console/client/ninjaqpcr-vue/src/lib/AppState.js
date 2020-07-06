const device = require("../lib/Device.js");

const API_ENDPOINT = "http://localhost:2222/";
class AppState {
  constructor () {
    this.protocols = [];
    this.selectedProtocol = null;
    
    /* Event handlers */
    this.protocolEventHandlers = [];
    this.panelContainer = null;
    this.panelStack = [];
    
    this.PANELS = {
      DASHBOARD:1,
      PROTOCOL_LIST:2,
      PROTOCOL_EDITOR:3,
      PROTOCOL_DETAIL:4,
      EXPERIMENT_MONITOR:5
    };
    this.panelStack.push(this.PANELS.DASHBOARD);
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
  
  /* Getting protocols */
  _requestData (path, data, method, onSuccess, onError) {
    const xmlhttp = new XMLHttpRequest();
    const url = API_ENDPOINT + path;
    xmlhttp.onreadystatechange = ()=>{
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        onSuccess(JSON.parse(xmlhttp.responseText));
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
      }, ()=>{
        console.log("Error");
      }
    );
  }
  saveProtocol (obj, onSave) {
    console.log("AppState.saveProtocol");
    const xmlhttp = new XMLHttpRequest();
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
    console.log("AppState.addProtocolEventHandler added. (current num=%d)",this.protocolEventHandlers.length);
  }
  setPanelContainer (container) {
    this.panelContainer = container;
  }
  
  
}
const appState = new AppState();
module.exports = appState;