"use strict";

const TopicManager = require("./topic_manager.js");
let debug = [];
class EventBus {
  constructor () {
    this.tm = new TopicManager();
  }
  subscribe (topic, handler) {
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
    const subId = this.tm.add(topic, subscription);
    return subId;
  }
  unsubscribe (id) {
    this.tm.remove(id);
  }
  publish (topic, data) {
    if (typeof(topic) != 'string') {
      throw "EventBus.subscribe topic should be <string> type.";
    }
    if (!debug.includes(topic)) {
      debug.push(topic);
      console.log(topic);
      console.log(JSON.stringify(data))
    }
    const targets = this.tm.find(topic);
    targets.forEach((subscriber)=>{
      subscriber.handler(topic, data);
    });
  }
}

const bus = new EventBus();
module.exports = bus;