"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const OpticsAnalysis = require("./optics_analysis");
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

const DEFAULT_CONF = {
  series_list: [],
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
const DEFAULT_STATUS = {
  status:"ready"
  
};
const DEFAULT_INFO = {};
const DEFAULT_ANALYSIS_CONFIG = {};
const DEFAULT_ANALYSIS = {};
class ExperimentManager {
  constructor () {
    this.summaries = null;
    this.id = Math.random();
  }
  _createExperimentDraft (option) {
    const timestamp = new Date().getTime();
    let experiment = {
      protocol_id: (option.protocol) ? option.protocol.id : null,
      protocol: option.protocol, // nullable
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
      config: (option.config)? option.config : DEFAULT_CONF,
      info: (option.info)? option.info : DEFAULT_INFO,
      analysis: (option.analysis)? option.analysis : DEFAULT_ANALYSIS,
      analysis_config: (option.analysis_config)? option.analysis_config : DEFAULT_ANALYSIS_CONFIG,
      status: (option.status)? option.status : DEFAULT_STATUS
    };
    if (!experiment.info.name) {
      experiment.info.name = this._generateDefaultName(experiment);
    }
    experiment.created = timestamp;
    experiment.modified = timestamp;
    return experiment;
  }
  _generateDefaultName (experiment) {
    let dateStr = new Date().toLocaleString();
    if (experiment.protocol && experiment.protocol.name) {
      return experiment.protocol.name + " " + dateStr;
    } else {
      return "Experiment " + dateStr;
    }
  }
  /* API */
  _generateExperimentId () {
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
    const experiment = this._createExperimentDraft(options);
    experiment.id = this._generateExperimentId();
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
    const timestamp = new Date().getTime();
    experiment.modified = timestamp;
    const filePath = this._experimentDir() + "/" + experiment.id;
    console.log("ExperimentManager.update");
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
        this._updateSummaries(experiment, ()=>{
          if (callback) {
            callback(experiment);
          }
        }, onError);
      }
    });
  }
  analyze (experiment, callback, onError) {
    // TODO analyze
    console.log("ExperimentManager.analyze");
    const analysis = new OpticsAnalysis(experiment);
    try {
      const result = analysis.analyze();
      experiment.analysis = result;
      
    } catch (e) {
      console.log(e);
      if (onError) {
        onError({
          code: ErrorCode.DataError,
          message:e.message
        });
      }
      return;
    }
    this.update(experiment, callback, onError);
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
      // Update
      let found = false;
      for (let i=0; i<summaries.length; i++) {
        let summary = summaries[i];
        if (summary.id == experiment.id) {
          console.log("Replace summary. index=%d", i);
          summaries[i] = this._generateExperimentSummary(experiment);
          found = true;
          break;  
        }
      }
      if (!found) {
        console.log("Adding new item to summaries.");
        summaries.push(this._generateExperimentSummary(experiment));
      }
      console.log("ExperimentManager._updateSummaries summaries.length=%d", summaries.length);
      this._saveSummaries(summaries, onSuccess, onError);
    }, onError);
  }
  
  _generateExperimentSummary (experiment) {
    return {
      "id":experiment.id,
      "start":experiment.status.start,
      "end":experiment.status.end,
      "name":experiment.info.name,
      "protocol_name":experiment.protocol.name,
      "created":experiment.created,
      "modified":experiment.modified,
      "status":experiment.status.status
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
        console.log(this._summariesPath());
        
        fs.readdir(this._experimentDir(), (err, allFiles) => {
            let summaries = JSON.parse(rawData);
            summaries.sort((a,b)=>{return b.modified - a.modified})
            this.summaries = summaries.filter(
              (summary)=>{ 
                if (allFiles.indexOf(summary.id) < 0) {
                  console.warn("Inconsistency found insummaries.json %s", summary.id);
                  return false;
                }
                return true;
              }
            );
            onLoad(this.summaries);
          });
      } catch (ex) {
        if (onError != null) {
          onError(ex);
        }
      }
    });
  }
  _saveSummaries (summaries, onSave, onError) {
    const path = this._summariesPath();
    if (summaries == null) {
      return;
    }
    fs.writeFile(path, JSON.stringify(summaries), (err)=>{
      this.summaries = summaries;
      if (err != null) {
        console.log(err);
        onError(onError);
      } else {
        onSave();
      }
    });
    
    
  }
}
const instance = new ExperimentManager();
module.exports = instance;