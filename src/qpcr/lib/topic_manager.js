"use strict";
// Manage topic tree
class TopicManager {
  constructor () {
    this.topicRoot = {
      subTopic: "",
      topics: {},
      subscribers: [],
    };
    this.idMap = {};
    this.maxSubId = 0;
    this.count = 0;
  }
  add (topic, item) {
    const path = topic.split(".");
    const subId = this._issueSubId();
    let node = this.topicRoot;
    if (topic.length > 0) {
      for (let depth = 0; depth < path.length; depth++) {
        const subTopic = path[depth];
        if (node.topics[subTopic]) {
          node = node.topics[subTopic];
        } else {
          console.log("subTopic=%s",subTopic)
          const newNode = {
            topic: subTopic,
            topics: {},
            subscribers: []
          };
          node.topics[subTopic] = newNode;
          node = newNode;
        }
      }
    }
    node.subscribers.push({id:subId, item:item});
    this.idMap[subId] = topic;
    this.count ++;
    return subId;
  }
  find (topic) {
    const path = topic.split(".");
    let node = this.topicRoot;
    let targets = [];
    node.subscribers.forEach((subscriber)=>{
      targets.push(subscriber);
    });
    for (let depth = 0; depth < path.length; depth++) {
      const subTopic = path[depth];
      if (node.topics[subTopic]) {
        node = node.topics[subTopic];
        node.subscribers.forEach((subscriber)=>{
          targets.push(subscriber);
        });
      } else {
        break;
      }
    }
    return targets.map(v=>v.item);
  }
  remove (id) {
    // TODO
    const topic = this.idMap[id];
    if (topic == null) {
      console.log("Topic %d not found.",id);
      return false;
    }
    const path = topic.split(".");
    const objPath = [];
    let node = this.topicRoot;
    objPath.push(node);
    for (let depth = 0; depth < path.length; depth++) {
      const subTopic = path[depth];
      if (node.topics[subTopic]) {
        node = node.topics[subTopic];
        objPath.push(node);
      } else {
        break;
      }
    }
    delete this.idMap[id];
    // Find node to remove
    for (let i=0; i<node.subscribers.length; i++) {
      if (node.subscribers[i].id == id) {
        node.subscribers.splice(i, 1);
        break;
      }
    }
    // Remove empty node
    let depth = objPath.length - 1;
    let subTopic = null;
    while (depth >= 0) {
      const node = objPath[depth];
      if (subTopic != null) {
        delete node.topics[subTopic];
      }
      subTopic = node.topic;
      const isEmpty = node.subscribers.length==0 && Object.keys(node.topics).length == 0;
      if (!isEmpty) {
        break;
      }
      depth -= 1;
    }
    this.count --;
    return true;
  }
  _issueSubId () {
    this.maxSubId ++;
    return this.maxSubId;
  }
}
module.exports = TopicManager;