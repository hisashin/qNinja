"use strict";
const Util = require("../lib/Util.js");
const WS_API_PORT = "2222";
class Device {
  constructor () {
    this.ws = null; // WebSocket object
    this.count = 0;
    this.connectionEventHandlers = [];
    this.deviceStateHandlers = [];
    this.transitionHandlers = [];
    this.progressHandlers = [];
    this.fluorescenceUpdateHandlers = [];
    
    this.deviceState = null;
    this.experimentProgress = null;
    this.protocol = null;
    this.progress = null;
  }
  
  apiEndpoint () {
    return "ws://" + location.hostname + ":" + WS_API_PORT + "/";
  }
  
  /* API */
  connect () {
    try {
      console.log("WS Connect...");
      console.log(location.hostname)
      const endpoint = ("ws://" + location.hostname + ":" + WS_API_PORT + "/");
      console.log("Connecting to " + endpoint);
      this.ws = new WebSocket(this.apiEndpoint());
    } catch (ex) {
      return;
    }
    this.ws.onopen = () => {
      console.log('WebSocket Client Connected');
      this.connectionEventHandlers.forEach((handler)=>{
        if (handler.onConnectionOpen != null) {
          handler.onConnectionOpen();
        }
      });
    };
    this.ws.onmessage = (e) => {
      const obj = JSON.parse(e.data);
      switch (obj.category) {
        case "ping":
          console.log("Received ping response");
          break;
        case "experiment.transition":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onTransition) {
              handler.onTransition(obj.data);
            }
          });
          break;
        case "experiment.progress":
          this.progressHandlers.forEach((handler)=>{
            this.progress = obj.data;
            if (handler.onProgress) {
              handler.onProgress(obj.data);
            }
          });
          break;
        case "experiment.fluorescence":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onFluorescenceUpdate) {
              handler.onFluorescenceUpdate(obj.data);
            }
          });
          break;
        case "experiment.meltCurve":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onMeltCurveUpdate) {
              handler.onMeltCurveUpdate(obj.data);
            }
          });
          break;
        case "experiment.fluorescenceEvent":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onFluorescenceEvent) {
              handler.onFluorescenceEvent(obj.data);
            }
          });
          break;
        
        case "experiment.start":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onStart) {
              console.log(obj)
              handler.onStart(obj.data);
            }
          });
          break;
        case "experiment.finish":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onComplete) {
              handler.onComplete(obj.data);
            }
          });
          break;
        case "device.transition":
          this.setDeviceState(obj.data);
          break;
        default:
          console.log("Warning: unhandled category=%s", obj.category);
          break;
      }
    };
    this.ws.onclose = (e) => {
      console.log("WebSocket.onclose");
      console.log(e);
      this.connectionEventHandlers.forEach((handler)=>{
        if (handler.onConnectionClose != null) {
          handler.onConnectionClose();
        }
      });
    };
    this.ws.onerror = (e) => {
      console.log("WebSocket.onerror");
      console.log(e);
    };
  }
  send (obj) {
    console.log(this.ws.readyState);
    this.ws.send(JSON.stringify(obj));
  }
  ping () {
    const obj = {
      "category":"ping"
    };
    this.send(obj);
  }
  
  /* Experiment Control */
  pause () {
    const obj = {
      "category":"experiment.pause"
    };
    this.send(obj);
  }
  resume () {
    const obj = {
      "category":"experiment.resume"
    };
    this.send(obj);
  }
  abort () {
    const obj = {
      "category":"experiment.abort"
    };
    this.send(obj);
  }
  
  finish () {
    const obj = {
      "category":"experiment.finish"
    };
    this.send(obj);
  }
  
  runExperiment (experimentId) {
    const obj = {
      "category":"experiment.runExperiment",
      data:{id:experimentId}
    };
    this.send(obj);
  }
  
  getProtocol () {
    return this.protocol;
  }
  
  /* Event handler registration */
  addConnectionEventHandler (obj) {
    if (this.connectionEventHandlers.indexOf(obj) > -1) {
      console.warn("Device.addConnectionEventHandler: This object is already registered. Skip.");
      return;
    }
    this.connectionEventHandlers.push(obj);
  }
  addDeviceStateHandler (obj) {
    if (this.deviceStateHandlers.indexOf(obj) > -1) {
      console.warn("Device.addDeviceStateHandler: This object is already registered. Skip.");
      return;
    }
    this.deviceStateHandlers.push(obj);
  }
  addTransitionHandler (obj) {
    if (this.transitionHandlers.indexOf(obj) > -1) {
      console.warn("Device.addTransitionHandler: This object is already registered. Skip.");
      return;
    }
    this.transitionHandlers.push(obj);
  }
  addProgressHandler (obj) {
    if (this.progressHandlers.indexOf(obj) > -1) {
      console.warn("Device.addProgressHandler: This object is already registered. Skip.");
      return;
    }
    this.progressHandlers.push(obj);
  }
  addFluorescenceUpdateHandler (obj) {
    if (this.fluorescenceUpdateHandlers.indexOf(obj) > -1) {
      console.warn("Device.addFluorescenceUpdateHandler: This object is already registered. Skip.");
      return;
    }
    this.fluorescenceUpdateHandlers.push(obj);
  }
  
  getDeviceState () {
    return this.deviceState;
  }
  setDeviceState (deviceState) {
    this.deviceState = deviceState;
    this.deviceStateHandlers.forEach((handler)=>{
      if (handler.onDeviceStateChange) {
        handler.onDeviceStateChange(deviceState);
      }
    });
  }
  setExperiment (experiment) {
    this.experiment = experiment;
    this.protocol = this.experiment.protocol;
  }
}
const device = new Device();
module.exports = device;