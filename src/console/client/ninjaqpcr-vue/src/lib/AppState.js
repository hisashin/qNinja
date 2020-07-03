const API_ENDPOINT = "http://localhost:2222/";
class AppState {
  constructor () {
    this.protocols = [];
    this.selectedProtocol = null;
    
    /* Event handlers */
    this.protocolEventHandlers = [];
    this.panelContainer = null;
    
    this.PANELS = {
      DASHBOARD:1,
      PROTOCOL_LIST:2,
      PROTOCOL_EDITOR:3,
      PROTOCOL_DETAIL:4,
      EXPERIMENT_MONITOR:5
    };
  }
  
  /* Public methods */
  presentPanel (panel) {
    console.log("AppState.presentPanel");
    if (this.panelContainer) {
      this.panelContainer.presentPanel(panel);
    }
  }
  runProtocol (id) {
    console.log("AppState.runProtocol");
    this._selectProtocol(id, (protocol)=>{
      this.presentPanel(this.PANELS.EXPERIMENT_MONITOR);
    });
  }
  saveProtocol (id) {
    console.log("AppState.saveProtocol");
  }
  editProtocol (id) {
    console.log("AppState.editProtocol");
    this._selectProtocol(id, (protocol)=>{
      this.presentPanel(this.PANELS.PROTOCOL_EDITOR);
    });
  }
  revealDetailProtocol (id) {
    console.log("AppState.revealDetailProtocol");
    this._selectProtocol(id, (protocol)=>{
      this.presentPanel(this.PANELS.PROTOCOL_DETAIL);
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
    xmlhttp.send();
    
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
    console.log("AppState.selectProtocol");
    this._requestData("protocols/" + id, null, "GET", 
      (data)=>{
        this.selectedProtocol = data;
        this.protocolEventHandlers.forEach((handler)=>{
          if (handler.onSelectProtocol) {
            handler.onSelectProtocol(this.selectedProtocol);
          }
          callback(this.selectedProtocol);
        });
      }, ()=>{
        console.log("Error");
      }
    );
  }
  /* Event handler registration */
  addProtocolEventHandler (handler) {
    this.protocolEventHandlers.push(handler);
  }
  setPanelContainer (container) {
    this.panelContainer = container;
  }
  
  
}
const appState = new AppState();
module.exports = appState;