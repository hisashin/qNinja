"use strict";
const Util = require("../lib/Util.js");
const client = require("../lib/RestClient.js");
const TopicManager = require("qpcr/lib/topic_manager.js");
const WS_API_PORT = "2222";
class ObservableValue {
  constructor (value) {
    this._value = value;
    this.observers = [];
    this.maxId = 0;
  }
  set (value) {
    const changed = this._value != value;
    this._value = value;
    if (changed) {
      this.observers.forEach((observer)=>{observer.f(this._value)});
    }
  }
  get () {
    return this._value;
  }
  observe (observer) {
    observer(this._value);
    const id = this.maxId;
    this.maxId++;
    this.observers.push({f:observer, id:id});
    return id;
  }
  removeObserver (id) {
    this.observers = this.observers.filter((obs)=>{return obs.id != id});
  }
}
const Connection = {
  DISCONNECTED: {connected:false, message:"Disconnected"},
  CONNECTED:  {connected:true, message:"Connected"},
  ERROR:  {connected:false, message:"Error"}
};
class Device {
  constructor () {
    this.ws = null; // WebSocket object
    
    this.topicManager = new TopicManager();
    this.config = null;

    this.deviceState = new ObservableValue(null);
    this.experiment = new ObservableValue(null);
    this.protocol = new ObservableValue(null);
    this.connectionStatus = new ObservableValue(Connection.DISCONNECTED);

  }
  init () {
    this.experiment.observe((experiment)=>{
      if (experiment) {
        this.protocol.set(experiment.protocol);
      }
    });
    client.fetchDevice(
      (data)=>{
        this.config = data.config;
        this.deviceState.set(data);
        if (data.hasExperiment) {
          client.fetchDeviceExperiment(
            (data)=>{
              this.experiment.set(data);
            }, 
            ()=>{});
        }
      }, (error)=>{
        console.error(error);
      }
    );
    this.subscribe("device.update.transition", (topic, data, id)=>{
      this.deviceState.set(data);
    });
    this.subscribe("experiment.update.start", (topic, data, id)=>{
      client.fetchDeviceExperiment(
        (data)=>{
          this.experiment.set(data);
        }, 
        ()=>{});
    });
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
    console.log("Device.subscribe topic=%s count=%d", topic, this.topicManager.count);
    return subId;
  }
  unsubscribe (subId) {
    this.topicManager.remove(subId);
    console.log("Device.UNsubscribe count=%d", this.topicManager.count);
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
      this.connectionStatus.set(this.Connection.CONNECTED);
    };
    this.ws.onmessage = (e) => {
      const obj = JSON.parse(e.data);
      const topic = obj.topic;
      const targets = this.topicManager.find(topic);
      targets.forEach((subscriber)=>{
        subscriber.handler(topic, obj.data);
      });
    };
    this.ws.onclose = (e) => {
      this.connectionStatus.set(this.Connection.DISCONNECTED);
    };
    this.ws.onerror = (e) => {
      console.error(e);
      this.connectionStatus.set(this.Connection.ERROR);
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
  
}
const device = new Device();
device.Connection = Connection;
module.exports = device;
