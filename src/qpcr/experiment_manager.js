"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const OpticsAnalysis = require("./optics_analysis");
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

const DEFAULT_CONF = {
};
const DEFAULT_STATUS = {
  status:"ready"
  
};
/*
const experimentConf = 
{
  name: "Example Name",
  wells: [
    { id:0, label:"Sample A", quantity:0.1 },
    { id:1, label:"Sample B", quantity:0.2 },
    { id:2, label:"Sample C", quantity:0.3 },
    { id:3, label:"Sample D", quantity:0.4 },
    { id:4, label:"Sample E", quantity:0.5 },
    { id:5, label:"Sample F", quantity:0.6 },
    { id:6, label:"Sample G", quantity:0.7 },
    { id:7, label:"Sample H", quantity:0.8 }
  ]
};
*/
class ExperimentManager {
  constructor () {
    this.summaries = null;
  }
  /* API */
  _createExperiment (option) {
    const timestamp = new Date().getTime();
    let experiment = {
      protocol_id: option.protocol.id,
      protocol: option.protocol,
      log: {
        temp: {
          time:[],
          well:[],
          lid:[]
        },
        events: [
          // transition
        ],
        baseline:[], 
        fluorescence: {
          baseline: [],
          qpcr: [],
          melt_curve: []
        }
      },
      conf: (option.conf)? option.conf : DEFAULT_CONF,
      status: (option.status)? option.status : DEFAULT_STATUS
    };
    experiment.created = timestamp;
    return experiment;
  }
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
  // Returns single experiment
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
  // Insert new experiment
  create (options, callback, onError) {
    const experiment = this._createExperiment(options);
    experiment.id = this.generateExperimentId();
    const filePath = this._experimentDir() + "/" + experiment.id;
    fs.writeFile(filePath, JSON.stringify(experiment), (err)=>{
      if (err) {
        // File system error
        console.log(err);
        if (onError) {
          onError({
            code: ErrorCode.DataError,
            message:err.message
          });
        }
      } else {
        this._updateSummaries(experiment, ()=>{
          callback(experiment);
        }, onError);
      }
    });
  }
  update (experiment, callback, onError) {
    if (!experiment.id) {
      console.log("This object is not managed as a database item.");
      return callback(Experiment);
    }
    const filePath = this._experimentDir() + "/" + experiment.id;
    fs.writeFile(filePath, JSON.stringify(experiment), (err)=>{
      if (err) {
        // File system error
        console.log(err);
        if (onError) {
          onError({
            code: ErrorCode.DataError,
            message:err.message
          });
        }
      } else {
        // Add to summary
        this._updateSummaries(experiment, callback, onError);
      }
    });
  }
  
  delete (id, onDelete, onError) {
    const filePath = this._experimentDir() + "/" + id;
    this.summaries = this.summaries.filter((summary)=>{ id != summary.id});
    this._saveSummaries(summaries, ()=>{
      fs.unlink(filePath, (err) => {
        if (err) {
          console.error(err);
          if (onError) {
            onError({
              code:ErrorCode.DataError,
              message: "Database error."
            });
          }
          return
        }
        if (onDelete) {
          onDelete();
        }
      });
    }, onError);
  }
  
  _updateSummaries (experiment, onSuccess, onError) {
    this.getSummaries (null, null, (summaries)=>{
      console.log("ExperimentManager.saveExperiment summaries.length=%d", summaries);
      // Update
      let found = false;
      for (let i=0; i<summaries.length; i++) {
        let summary = summaries[i];
        if (summary.id == experiment.id) {
          console.log("Replace summary. index=%d", i);
          summaries[i] = this.generateExperimentSummary(experiment);
          found = true;
          break;  
        }
      }
      if (!found) {
        console.log("Adding new item to summaries.");
        summaries.push(this.generateExperimentSummary(experiment));
      }
      console.log("ExperimentManager.saveExperiment summaries.length=%d", summaries);
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
    }, onError);
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
      "start":experiment.status.start,
      "end":experiment.status.end,
      "result_type":1,
      "protocol_name":experiment.protocol.name
    };
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
    if (!fs.existsSync(this._summariesPath())) {
      // New summary file
      this.summaries = [];
      onLoad(this.summaries);
      return;
    }
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