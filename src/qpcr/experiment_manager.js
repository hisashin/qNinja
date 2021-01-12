"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const OpticsAnalysis = require("./optics_analysis");
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

class ExperimentManager {
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
  getLatestExperiment (onLoad, onError) {
    this.getSummaries(null, null, (summaries)=>{
      if (summaries == null || summaries.length == 0) {
        onError("No logs found.");
        return;
      }
      const id = summaries[0].id;
      this.getExperiment(id, onLoad, onError);
    }, onError);
  }
  getExperiment (id, onLoad, onError) {
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
  getAnalyzedExperimentLog (id, onLoad, onError) {
    this.getExperiment(id, (log)=>{
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
  
  generateExperimentSummary (experiment) {
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
      "id":experiment.id,
      "start":experiment.start,
      "end":experiment.end,
      "result_type":1,
      "protocol_name":experiment.protocol.name
    };
  }
  
  /* Save log */
  saveExperiment (experiment, onSuccess, onError) {
    const dateStr = new Date().getTime();
    experiment.modified = dateStr;
    experiment.created = dateStr;
    console.log("ExperimentManager.saveExperiment 1");
    this.getSummaries (null, null, (summaries)=>{
      console.log("ExperimentManager.saveExperiment 2 summaries.length=%d", summaries);
      summaries.push(this.generateExperimentSummary(experiment));
      this._saveSummaries(summaries, ()=>{
        const path = this._logPath(experiment.id);
        console.log("ExperimentManager.saveExperiment path=%s", path);
        fs.writeFile(path, JSON.stringify(experiment), (err)=>{
          if (err) {
            console.log(err);
            onError(err);
          } else if (onSuccess) {
            onSuccess();
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
  _experimentDir () {
    return DATA_DIR_ROOT + "/experiment";
  }
  _summariesPath () {
    return this._experimentDir() + "/summaries.json";
  }
  _logPath (id) {
    return this._experimentDir() + "/" + id;
  }
  
  _loadSummaries (onLoad, onError) {
    fs.readFile(this._summariesPath(), (err, rawData)=>{
      try {
        console.log(this._summariesPath())
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
    console.log("ExperimentManager._saveSummaries path=%s", path);
    console.log(summaries);
    if (summaries == null) {
      console.error("Summaries is undefined!");
      return;
    }
    fs.writeFile(path, JSON.stringify(summaries), (err)=>{
      console.log("ExperimentManager._saveSummaries success");
      if (err != null) {
        console.log(err);
        onError(onError);
      } else {
        onSave();
      }
    });
    
    
  }
}

module.exports = ExperimentManager;