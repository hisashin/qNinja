"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

class LogManager {
  constructor () {
    this.summaries = null;
  }
  /* API */
  getSummaries (filter, order, onLoad, onError) {
    if (this.summaries != null) {
      onLoad(this._filter(this.summaries, filter, order));
      return;
    }
    this._loadSummaries((summaries)=>{
      onLoad(this._filter(this.summaries, filter, order));
    }, onError);
  }
  getLatestLog (onLoad, onError) {
    this.getSummaries(null, null, (summaries)=>{
      if (summaries == null || summaries.length == 0) {
        onError("No logs found.");
        return;
      }
      const id = summaries[0].id;
      this.getLog(id, onLoad, onError);
    }, onError);
  }
  getLog (id, onLoad, onError) {
    fs.readFile(this._logPath(id), (err, rawData)=>{
      try {
        onLoad(JSON.parse(rawData));
      } catch (ex) {
        if (onError != null) {
          onError(ex);
        }
      }
    });
  }
  
  /* Private */
  
  _filter (summaries, filter, order) {
    // TODO implement filter & order
    return summaries;
  }
  _logDir () {
    return DATA_DIR_ROOT + "/log";
  }
  _summariesPath () {
    return this._logDir() + "/logs.json";
  }
  _logPath (id) {
    return this._logDir() + "/" + id;
  }
  
  _loadSummaries (onLoad, onError) {
    fs.readFile(this._summariesPath(), (err, rawData)=>{
      try {
        let summaries = JSON.parse(rawData);
        summaries.sort((a,b)=>{return b.end - a.end})
        this.summaries = summaries;
        onLoad(this.summaries);
      } catch (ex) {
        if (onError != null) {
          onError(ex);
        }
      }
    });
  }
}

module.exports = LogManager;