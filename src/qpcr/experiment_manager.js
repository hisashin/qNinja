"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const OpticsAnalysis = require("./optics_analysis");
const PromiseQueue = require("./lib/promise_queue");
const DATA_DIR_ROOT = process.env.NINJAQPCR_USER_DATA || "/home/pi/ninjaqpcr/user_data"; // TODO: use user's home dir

const NINJAQPCR_API_VERSION = "1.0";

const DEFAULT_CONF = {
  series_list: [],
  wells: [
    { id:0 },
    { id:1 },
    { id:2 },
    { id:3 },
    { id:4 },
    { id:5 },
    { id:6 },
    { id:7 },
    { id:8 },
    { id:9 },
    { id:10 },
    { id:11 },
    { id:12 },
    { id:13 },
    { id:14 },
    { id:15 },
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
  
  createExperimentDraft (option) {
    const timestamp = new Date().getTime();
    let experiment = {
      api_version: NINJAQPCR_API_VERSION,
      protocol_id: (option.protocol) ? option.protocol.id : null,
      protocol: option.protocol, // nullable
      log: {
        temp: {
          time:[],
          plate:[],
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
    let dateStr = new Date().toLocaleString([],{year: "numeric", month: "2-digit", day: "2-digit",hour: "2-digit", minute:"2-digit", "hour12":false});
    console.log("dateStr=%s", dateStr);
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
      console.log("this.summaries.length=%d", this.summaries.length);
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
    const experiment = this.createExperimentDraft(options);
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
      if (callback) {
        callback(experiment);
      }
      return;
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
  
  export (experiment, property) {
    console.log("ExperimentManager.export")
    console.log(property)
    console.log(property)
    if (property == "temp") {
      return this._exportTemp(experiment);
    }
    if (property == "qpcr") {
      return this._exportQpcr(experiment);
    }
    if (property == "melt_curve") {
      return this._exportMeltCurve(experiment);
    }
    return "Invalid key: " + property;
  }
  _exportTemp (experiment) {
    let table = [];
    // Header
    table.push(["time", "lid", "plate"]);
    if (experiment.log && experiment.log.temp) {
      const data = experiment.log.temp;
      for (let i=0; i<data.time.length; i++) {
        table.push([ data.time[i], data.lid[i], data.plate[i] ]);
      }
      
    }
    return this._toCsv(table);
  }
  _exportQpcr (experiment) {
    if (!experiment.hardware) {
      return "Hardware config is empty.";
    }
    if (!experiment.log.fluorescence || !experiment.log.fluorescence.qpcr) {
      return " No amplification data.";
    }
    let table = [];
    const chCount = experiment.hardware.channels.count;
    const wellCount = experiment.hardware.wells.count;
    
    let header = ["time","cycle"];
    for (let c=0; c<chCount; c++) {
      for (let w=0; w<wellCount; w++) {
        header.push("Ch " + (c+1) + "/" + experiment.hardware.wells.names[w]);
      }
    }
    table.push(header);
    const meltData = experiment.log.fluorescence.qpcr;
    for (let i=0; i<meltData.length; i++) {
      const data = meltData[i];
      let line = [ data.t, data.cycle];
      for (let ch=0; ch<chCount; ch++) {
        for (let well=0; well<wellCount; well++) {
          line.push(data.v[ch][well].v);
        }
      }
      table.push(line);
    }
    return this._toCsv(table);
  }
  
  _exportMeltCurve (experiment) {
    if (!experiment.hardware) {
      return "Hardware config is empty.";
    }
    if (!experiment.log.fluorescence || !experiment.log.fluorescence.melt_curve) {
      return " No melt curve data.";
    }
    let table = [];
    const chCount = experiment.hardware.channels.count;
    const wellCount = experiment.hardware.wells.count;
    
    let header = ["time","temp"];
    for (let c=0; c<chCount; c++) {
      for (let w=0; w<wellCount; w++) {
        header.push("Ch " + (c+1) + "/" + experiment.hardware.wells.names[w]);
      }
    }
    table.push(header);
    const qpcrData = experiment.log.fluorescence.melt_curve;
    for (let i=0; i<qpcrData.length; i++) {
      const data = qpcrData[i];
      let line = [ data.t, data.temp];
      for (let ch=0; ch<chCount; ch++) {
        for (let well=0; well<wellCount; well++) {
          line.push(data.v[ch][well].v);
        }
      }
      table.push(line);
    }
    return this._toCsv(table);
  }
  _toCsv (table) {
    return table.map(line=>line.join("\t")).join("\n");
  }
  
  analyze (experiment, callback, onError) {
    // TODO analyze
    console.log("ExperimentManager.analyze");
    const analysis = new OpticsAnalysis(experiment);
    try {
      experiment.analysis = analysis.analyze();
      this.update(experiment, callback, onError);
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
  }
  
  delete (id, onDelete, onError) {
    const filePath = this._experimentDir() + "/" + id;
    this.summaries = this.summaries.filter((summary)=>{ console.log("%s<=>%s", summary.id, id);return id != summary.id});
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
      this._saveSummaries(this.summaries, onDelete, onError);
    });
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
  
  _recreateSummaries(onLoad, onError) {
    const REGEX_EXPERIMENT_FILE = /[a-z0-9]{8}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{12}/;
    console.log("Read content of " + this._experimentDir());
    fs.readdir(this._experimentDir(), (err, allFiles) => {
      let queue = [];
      let summaries = [];
      console.log(allFiles)
      console.log(err)
      allFiles.filter((f)=>{
        return REGEX_EXPERIMENT_FILE.test(f);
      }).forEach((f)=>{
        const task = ()=>{
          return new Promise((resolve, reject)=>{
            this.getExperiment(f, (experiment)=>{
              summaries.push(this._generateExperimentSummary(experiment));
              resolve();
            }, ()=>{
              console.log("Reject!");
              reject();
            });
          });
        };
        queue.push(task);
      });
      new PromiseQueue(queue).exec().then(()=>{
        summaries.sort((a,b)=>{return b.modified - a.modified});
        this._saveSummaries(summaries, onLoad, onError);
      });
    });
  }
  
  _loadSummaries (onLoad, onError) {
      
    if (!fs.existsSync(this._summariesPath())) {
      // New summary file
      this.summaries = [];
      console.log("summaries.json not found. create...");
      this._recreateSummaries(onLoad, onError);
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