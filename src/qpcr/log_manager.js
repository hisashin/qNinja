"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const OpticsAnalysis = require("./optics_analysis");
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

class LogManager {
  constructor () {
    this.summaries = null;
  }
  /* API */
  generateExperimentId () {
    return uuidv4();
  }
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
  getAnalyzedLog (id, onLoad, onError) {
    this.getLog(id, (log)=>{
      const analysis = new OpticsAnalysis(log);
      try {
        analysis.calcBaseline();
        analysis.calcCt();
        analysis.calcMeltCurve();
        log.baselines = analysis.getBaselines();
        log.thresholds = analysis.getThresholds();
        log.ct = analysis.getCt();
        log.melt_curve = analysis.getMeltCurve();
      } catch (e) {
        console.log(e);
      }
      onLoad(log);
    },
    onError);
  }
  
  generateExperimentSummary (experimentLog) {
    /*
      {
        "id":"037B8ACD-C29E-47FA-A59F-8CDFA3B1D0C8",
        "start": 1593661111711,
        "end": 1593661111711,
        "result_type":1,
        "protocol_name":"DemoProtocol B"
      }
      */
    return {
      "id":experimentLog.id,
      "start":experimentLog.start,
      "end":experimentLog.end,
      "result_type":1,
      "protocol_name":experimentLog.protocol.name
    };
  }
  
  /* Save log */
  saveExperimentLog (experimentLog, onSuccess, onError) {
    console.log("LogManager.saveExperimentLog 1");
    this.getSummaries (null, null, (summaries)=>{
      console.log("LogManager.saveExperimentLog 2 summaries.length=%d", summaries);
      summaries.push(this.generateExperimentSummary(experimentLog));
      this._saveSummaries(summaries, ()=>{
        console.log("LogManager.saveExperimentLog 3");
        const path = this._logPath(experimentLog.id);
        console.log("LogManager.saveExperimentLog path=%s", path);
        fs.writeFile(path, JSON.stringify(experimentLog), (err)=>{
          console.log("LogManager.saveExperimentLog 4");
          if (err) {
            console.log(err);
          }
        });
      }, onError);
    }, onError) ;
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
  _saveSummaries (summaries, onSave, onError) {
    const path = this._summariesPath();
    console.log("LogManager._saveSummaries path=%s", path);
    console.log(summaries);
    if (summaries == null) {
      console.error("Summaries is undefined!");
      return;
    }
    fs.writeFile(path, JSON.stringify(summaries), (err)=>{
      console.log("LogManager._saveSummaries success");
      if (err != null) {
        console.log(err);
        onError(onError);
      } else {
        onSave();
      }
    });
    
    
  }
}

module.exports = LogManager;