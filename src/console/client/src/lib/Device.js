"use strict";
const Util = require("../lib/Util.js");
const TopicManager = require("qpcr/lib/topic_manager.js");
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
    this.connected = false;
    this.topicManager = new TopicManager();
  }
  
  apiEndpoint () {
    return "ws://" + location.hostname + ":" + WS_API_PORT + "/";
  }
  
  /* Event bus proxy functionalities */
  subscribe (topic, handler/* (topic, data)=>{} */) {
    if (typeof(topic) != 'string') {
      throw "EventBus.subscribe topic should be <string> type.";
    }
    if (typeof(handler) != 'function') {
      throw "EventBus.subscribe handler should be <handler> type.";
    }
    const subscription = {
      handler: handler,
      topic: topic
    };
    const subId = this.topicManager.add(topic, subscription);
    console.log("Device.subscribe %s count=%d", topic, this.topicManager.count);
    return subId;
  }
  unsubscribe (subId) {
    this.topicManager.remove(subId);
    console.log("Device.UNsubscribe count=%d", topic, this.topicManager.count);
  }
  publish (topic, data) {
    const obj = {
      "topic": topic,
      "data": data
    };
    this.send(obj);
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
      this.connected = true;
      this.connectionEventHandlers.forEach((handler)=>{
        if (handler.onConnectionOpen != null) {
          handler.onConnectionOpen();
        }
      });
    };
    this.ws.onmessage = (e) => {
      const obj = JSON.parse(e.data);
      const topic = obj.topic;
      const targets = this.topicManager.find(topic);
      // console.log("%d targets for topic %s", targets.length, topic);
      targets.forEach((subscriber)=>{
        subscriber.handler(topic, obj.data);
      });
      // TODO remove.
      switch (obj.topic) {
        case "experiment.update.transition":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onTransition) {
              handler.onTransition(obj.data);
            }
          });
          break;
        case "experiment.update.progress":
          this.progressHandlers.forEach((handler)=>{
            this.progress = obj.data;
            console.log(obj.data);
            if (handler.onProgress) {
              handler.onProgress(obj.data);
            }
          });
          break;
        case "experiment.update.fluorescence":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onFluorescenceUpdate) {
              handler.onFluorescenceUpdate(obj.data);
            }
          });
          break;
        case "experiment.update.meltCurve":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onMeltCurveUpdate) {
              handler.onMeltCurveUpdate(obj.data);
            }
          });
          break;
        case "experiment.update.fluorescenceEvent":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onFluorescenceEvent) {
              handler.onFluorescenceEvent(obj.data);
            }
          });
          break;
        case "experiment.update.autoPause":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onAutoPause) {
              handler.onAutoPause(obj.data);
            }
          });
          break;
        case "experiment.update.start":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onStart) {
              console.log(obj)
              handler.onStart(obj.data);
            }
          });
          break;
        case "experiment.update.finish":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onComplete) {
              handler.onComplete(obj.data);
            }
          });
          break;
        case "device.update.transition":
          this.setDeviceState(obj.data);
          break;
        default:
          break;
      }
    };
    this.ws.onclose = (e) => {
      console.log("WebSocket.onclose");
      console.log(e);
      this.connected = false;
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
  
  /* Experiment Control */
  pause () {
    const obj = {
      "topic":"experiment.command.pause"
    };
    this.send(obj);
  }
  finishAutoPause () {
    const obj = {
      "topic":"experiment.command.finishAutoPause"
    };
    this.send(obj);
  }
  resume () {
    const obj = {
      "topic":"experiment.command.resume"
    };
    this.send(obj);
  }
  cancel () {
    const obj = {
      "topic":"experiment.command.cancel"
    };
    this.send(obj);
  }
  
  finish () {
    const obj = {
      "topic":"experiment.command.finish"
    };
    this.send(obj);
  }
  
  runExperiment (experimentId) {
    const obj = {
      topic:"experiment.command.runExperiment",
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
    this.deviceStateHandlers.forEach((handler)=>{
      if (handler.onUpdateProtocol) {
        handler.onUpdateProtocol(this.experiment.protocol);
      }
    });
  }
}
const device = new Device();
module.exports = device;