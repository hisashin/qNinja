"use strict";
const { exec } = require("child_process");
const fs = require('fs');
/*
  Options
  --clientHost : Allowed access origin host
  --clientPort : Allowed access origin port
*/

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const OpticsSession = require(QPCR_PATH + "session_optics.js");
const PlateControlSession = require(QPCR_PATH + "session_plate_control.js");
// const qpcr = new NinjaQPCR("hardware_dummy.json");
let qpcr = null;
const eventBus = require(QPCR_PATH + "lib/event_bus.js");
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ErrorCode = require(QPCR_PATH + "error_code");

const pm = require(QPCR_PATH + "protocol_manager");
const em = require(QPCR_PATH + "experiment_manager");

const Router = require("./router");
const Pager = require("./pager");

const http = require('http');
var URL = require('url');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = "2222";
const CLIENT_HOST_DEFAULT = "ninjaqpcr.local";
const CLIENT_PORT_DEFAULT = "8080";

const protocolPager = new Pager(
  // Defaults
  {
    offset: 0,
    limit: 2,
    order: "desc",
    sort: "modified"
  },
  // Sort functions
  {
    "modified": (a, b) =>{
      return (a.modified < b.modified) ? -1: 1;
    },
    "created": (a, b) =>{
      return (a.created < b.created) ? -1: 1;
    },
    "used": (a, b) =>{
      return (a.used < b.used) ? -1: 1;
    },
    "name": (a, b) =>{
      return (a.protocol.name < b.protocol.name) ? -1: 1;
    } 
  },
  (all, query) => {
    let array = all;
    let keyword = query.keyword;
    if (keyword != null && keyword.length > 0) {
      array = array.filter((obj)=>{ 
          return (obj.protocol.name!=null && obj.protocol.name.toLowerCase().indexOf(keyword.toLowerCase()) >= 0) 
        });
    }
    return array;
  }
);
const experimentPager = new Pager(
  // Defaults
  {
    offset: 0,
    limit: 2,
    order: "desc",
    sort: "modified"
  },
  // Sort functions
  {
    "modified": (a, b) =>{
      return (a.modified < b.modified) ? -1: 1;
    },
    "created": (a, b) =>{
      return (a.created < b.created) ? -1: 1;
    },
    "start": (a, b) =>{
      return (a.start < b.start) ? -1: 1;
    },
    "end": (a, b) =>{
      return (a.end < b.end) ? -1: 1;
    },
    "name": (a, b) =>{
      return (a.name < b.name) ? -1: 1;
    }, 
    "protocol_name": (a, b) =>{
      return (a.protocol_name < b.protocol_name) ? -1: 1;
    } 
  },
  (all, query) => {
    let array = all;
    let keyword = query.keyword;
    let status = query.status;
    if (keyword != null && keyword.length > 0) {
      array = array.filter((obj)=>{ 
          return (obj.name!=null && obj.name.toLowerCase().indexOf(keyword.toLowerCase()) >= 0)
            || (obj.protocol_name!=null && obj.protocol_name.toLowerCase().indexOf(keyword.toLowerCase()) >= 0)
        });
    }
    if (status) {
      array = array.filter((obj)=>{
        return obj.status == status;
      });
    }
    return array;
  }
);


class NinjaQPCRHTTPServer {
  constructor (server, clientHost, clientPort) {
    this.server = server;
    
    const router = new Router();
    this.router = router;
    
    router.addPath("/", "GET", this.root());
    router.addPath("/protocols", "GET", this.protocols());
    router.addPath("/protocols", "POST", this.protocolCreate());
    router.addPath("/protocols/{pid}", "GET", this.protocolGet());
    router.addPath("/protocols/{pid}", "PUT", this.protocolUpdate());
    router.addPath("/protocols/{pid}", "DELETE", this.protocolDelete());
    router.addPath("/protocols/validate", "PUT", this.protocolValidate());
    
    router.addPath("/experiments", "GET", this.experiments());
    router.addPath("/experiments", "POST", this.experimentCreate());
    router.addPath("/experiments/latest", "GET", this.experimentLatest());
    
    // Single experiment and fields
    router.addPath("/experiments/{eid}", "GET", this.experimentGet());
    router.addPath("/experiments/{eid}", "PUT", this.experimentUpdate());
    router.addPath("/experiments/{eid}", "DELETE", this.experimentDelete());
    router.addPath("/experiments/{eid}/protocol", "GET", this.experimentProtocolGet());
    router.addPath("/experiments/{eid}/protocol", "PUT", this.experimentProtocolUpdate());
    router.addPath("/experiments/{eid}/protocol", "DELETE", this.experimentProtocolDelete());
    router.addPath("/experiments/{eid}/info", "GET", this.experimentInfoGet());
    router.addPath("/experiments/{eid}/info", "PUT", this.experimentInfoUpdate());
    router.addPath("/experiments/{eid}/config", "GET", this.experimentConfigGet());
    router.addPath("/experiments/{eid}/config", "PUT", this.experimentConfigUpdate());
    router.addPath("/experiments/{eid}/log", "GET", this.experimentLogGet());
    router.addPath("/experiments/{eid}/log/temp", "GET", this.experimentLogTempGet());
    router.addPath("/experiments/{eid}/log/qpcr", "GET", this.experimentLogQpcrGet());
    router.addPath("/experiments/{eid}/log/melt_curve", "GET", this.experimentLogMeltCurveGet());
    router.addPath("/experiments/{eid}/log/temp.csv", "GET", this.experimentLogTempCsvGet());
    router.addPath("/experiments/{eid}/log/qpcr.csv", "GET", this.experimentLogQpcrCsvGet());
    router.addPath("/experiments/{eid}/log/melt_curve.csv", "GET", this.experimentLogMeltCurveCsvGet());
    
    router.addPath("/experiments/{eid}/analysis_config", "GET", this.experimentAnalysisConfigGet());
    router.addPath("/experiments/{eid}/analysis_config", "PUT", this.experimentAnalysisConfigUpdate());
    router.addPath("/experiments/{eid}/analysis", "GET", this.experimentAnalysisGet());
    router.addPath("/experiments/{eid}/analysis/baseline", "GET", this.experimentAnalysisBaselineGet());
    router.addPath("/experiments/{eid}/analysis/threshold", "GET", this.experimentAnalysisThresholdGet());
    router.addPath("/experiments/{eid}/analysis/standard_curve", "GET", this.experimentAnalysisStandardCurveGet());
    
    router.addPath("/experiments/draft", "POST", this.experimentDraft());
    
    // TODO: Reconsinder paths.
    router.addPath("/device", "GET", this.device());
    router.addPath("/device/experiment", "GET", this.deviceExperiment());
    router.addPath("/device/experiment/protocol", "GET", this.deviceExperimentProtocol());
    router.addPath("/device/experiment/progress", "GET", this.deviceProgress());
    router.addPath("/device/experiment/baseline", "GET", this.deviceBaseline()); // To deprecate
    router.addPath("/device/experiment/melt_curve", "GET", this.deviceMeltCurve()); // To deprecate
    
    router.add404(this.error404);
    router.start();
    
    this.server.on('request', (req, res)=>{
      // CORS
      let corsAllow = null;
      const origin = req.headers.origin;
      const HOST_REGEX = new RegExp("http:\\\/\\\/localhost(:[0-9]+)?");
      if (origin && HOST_REGEX.test(origin)) {
        corsAllow = origin;
      } else {
        corsAllow = 'http://' + clientHost;
        if (clientPort != "80")  corsAllow += (":" + clientPort);
      }
      res.setHeader('Access-Control-Allow-Origin', corsAllow);
      res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
      if (req.method == "OPTIONS") {
        // Handle preflight request.
        res.end();
        return;
      }
      try {
        router.route(req, res);
      } catch (ex) {
        console.error(ex);
      }
    });
  }
  
  root () {
    return (req, res, map)=>{
      res.writeHead(200,{'Content-Type': 'application/json'});
      res.write(JSON.stringify(this.router.list()));
      res.end();
    }
  }
  
  device () {
    return (req, res, map)=>{
      // Device state and experiment status
      res.writeHead(200,{'Content-Type': 'application/json'});
      const obj = qpcr.getDeviceState();
      obj.config = qpcr.getConfig();
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  deviceExperiment () {
    return (req, res, map)=>{
      // Device state and experiment status
      res.writeHead(200,{'Content-Type': 'application/json'});
      console.log("ExperimentLog=");
      console.log(qpcr.experimentLog);
      res.write(JSON.stringify(qpcr.experimentLog));
      res.end();
    };
  }
  
  deviceExperimentProtocol () {
    return (req, res, map)=>{
      // Device state and experiment status
      res.writeHead(200,{'Content-Type': 'application/json'});
      const obj = qpcr.getProtocol();
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  deviceProgress () {
    return (req, res, map)=>{
      res.writeHead(200,{'Content-Type': 'application/json'});
      const obj = qpcr.getProgress();
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  deviceBaseline () {
    return (req, res, map)=>{
      res.writeHead(200,{'Content-Type': 'application/json'});
      const obj = qpcr.getBaseline();
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  deviceMeltCurve () {
    return (req, res, map)=>{
      res.writeHead(200,{'Content-Type': 'application/json'});
      console.log("server.deviceMeltCurve");
      const obj = qpcr.getMeltCurve();
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  /* 
    Handle errors
    - Response with error code
    - Add error message or error detail object
   */
  _handleError (req, res, err) {
    let errorCode = 500;
    let obj = {message:err.message};
    if (err.code == ErrorCode.NotFound) {
      errorCode = 404;
    }
    if (err.code == ErrorCode.DataError) {
      errorCode = 400;
    }
    if (err.code == ErrorCode.BadRequest) {
      errorCode = 500;
    }
    if (err.code == ErrorCode.InvalidData) {
      errorCode = 422;
      obj.data = err.data;
    }
    res.writeHead(errorCode, {'Content-Type': 'application/json'});
    res.write(JSON.stringify(obj));
    res.end();
  }
  protocols () {
    return (req, res, map)=>{
      pm.getProtocols((all)=>{
        const query = URL.parse(req.url, true).query;
        res.writeHead(200, {'Content-Type': 'application/json'});
        const obj = protocolPager.getPagination(all, query);
        res.write(JSON.stringify(obj));
        res.end();
      },
      (pmErr)=>{
        this._handleError(req, res, pmErr);
      });
    };
  }
  
  // with request body
  _getRequestContentHandler (callback) {
    return (req, res, map)=>{
      let chunk = "";
      let data = null;
      req.on("data", (rawData)=>{
        chunk += rawData.toString()
      });
      req.on("end", ()=>{
        try {
          data = JSON.parse(chunk);
        } catch (error) {
          // Failed to parse JSON
          console.error(error);
          console.error("Raw data=")
          console.error(rawData.toString());
          let errorObj = {
            code:ErrorCode.DataError,
            message:"Malformed JSON"
          };
          this._handleError(req, res, errorObj);
          return;
        }
        callback(req, res, map, data);
      });
    }
  }
  protocolCreate () {
    return this._getRequestContentHandler(
      (req, res, map, data, error)=>{
        pm.create(data, (item)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(item));
          res.end();
        }, (pmErr)=>{
          this._handleError(req, res, pmErr);
        });
        
      }
    );
  }
  protocolUpdate () {
    return this._getRequestContentHandler(
      (req, res, map, content)=>{
        if (map.pid != content.id) {
          const err = {
            code: 400,
            message: "Protocol ID does not match."
          };
          this._handleError(req, res, err);
          return;
        }
        pm.update(content, (item)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(item));
          res.end();
        }, (pmErr)=>{
          this._handleError(req, res, pmErr);
        });
      }
    );
  }
  
  protocolValidate () {
    return this._getRequestContentHandler(
      (req, res, map, protocol)=>{
        pm.validate(protocol, (result)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(result));
          res.end();
        }, (pmErr)=>{
          this._handleError(req, res, pmErr);
        });
      }
    );
  }
  
  protocolGet () {
    return (req, res, map)=>{
      pm.getProtocol(map.pid, (item)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(item));
        res.end();
      },
      (pmErr)=>{
        this._handleError(req, res, pmErr);
      });
    };
  }
  
  protocolDelete () {
    return (req, res, map)=>{
      pm.delete(map.pid, ()=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify({}));
        // Empty response.
        res.end();
      },
      (pmErr)=>{
        this._handleError(req, res, pmErr);
      });
    };
    
  }
  
  experiments () {
    return (req, res, map)=>{
      em.getSummaries({}, {}, (all)=>{
        const query = URL.parse(req.url, true).query;
        res.writeHead(200, {'Content-Type': 'application/json'});
        const obj = experimentPager.getPagination(all, query);
        res.write(JSON.stringify(obj));
        res.end();
      },
      (err)=>{
        console.log(err)
        this.error500(req, res, err);
      });
    };
  }
  
  experimentLatest () {
    return (req, res, map)=>{
      em.getLatestExperiment((experiment)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(experiment));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
  
  experimentGet () {
    return (req, res, map)=>{
      em.getExperiment(map.eid, (experiment)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(experiment));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
  
  _experimentExportCsv (property) {
    return (req, res, map)=>{
      em.getExperiment(map.eid, (experiment)=>{
        const csv = em.export(experiment, property);
        res.writeHead(200,{'Content-Type': 'text/csv'});
        res.write(csv);
        res.end();
      },
      (err)=>{
        console.log("experimentGet ERROR. " + err);
        console.log(err)
        this.error500(req, res, err);
      });
    }
  }
  
  experimentLogTempGet () {
    return this._experimentGetProperty("log.temp");
  }
  experimentLogQpcrGet () {
    return this._experimentGetProperty("log.fluorescence.qpcr");
  }
  experimentLogMeltCurveGet () {
    return this._experimentGetProperty("log.fluorescence.melt_curve");
  }
  experimentLogTempCsvGet () {
    return this._experimentExportCsv("temp");
  }
  experimentLogQpcrCsvGet () {
    return this._experimentExportCsv("qpcr");
  }
  experimentLogMeltCurveCsvGet () {
    return this._experimentExportCsv("melt_curve");
  }
  
  experimentCreate () {
    return this._getRequestContentHandler(
      (req, res, map, experiment)=>{
        em.create(experiment, (createdItem)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(createdItem));
          res.end();
        }, (err)=>{
          this._handleError(req, res, err);
        });
      }
    );
  }
  experimentUpdate () { 
    return this._getRequestContentHandler(
      (req, res, map, content)=>{
        if (map.eid != content.id) {
          const err = {
            code: 400,
            message: "Experiment ID does not match."
          };
          this._handleError(req, res, err);
          return;
        }
        em.update(content, (updatedItem)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(updatedItem));
          res.end();
        }, (err)=>{
          this._handleError(req, res, err);
        });
      }
    );
  }
  experimentDelete () {
    return (req, res, map)=>{
      em.delete(map.eid, ()=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify({}));
        res.end();
      },
      (err)=>{
        this._handleError(req, res, err);
      });
    };
    
  }
  experimentDraft () {
    return this._getRequestContentHandler(
      (req, res, map, content)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        const draft = em.createExperimentDraft(content);
        draft.hardware = qpcr.getConfig();
        res.write(JSON.stringify(draft));
        res.end();
      }
    );
  }
  // Return partial
  _experimentGetProperty (key) {
    return (req, res, map)=>{
      const path = key.split(".");
      em.getExperiment(map.eid, (experiment)=>{
        console.log("experimentGet OK. " + key);
        res.writeHead(200,{'Content-Type': 'application/json'});
        let obj = experiment;
        for (let pathElement of path) {
          obj = obj[pathElement];
          if (!obj) obj = {}
        }
        res.write(JSON.stringify(obj));
        res.end();
      },
      (err)=>{
        console.log("experimentGet ERROR. " + err);
        console.log(err)
        this.error500(req, res, err);
      });
    };
  }
  // TODO validator
  _experimentUpdateProperty (key) {
    return this._getRequestContentHandler(
      (req, res, map, propertyValue)=>{
        const path = key.split(".");
        em.getExperiment(map.eid, (experiment)=>{
          console.log("Experiment Found. Updating %s of experiment %s.", key, experiment.id);
          let lastKey = path.pop();
          let obj = experiment;
          for (let pathElement of path) {
            if (!obj[pathElement]) {
              obj[pathElement] = {};
            }
            obj = obj[pathElement];
          }
          obj[lastKey] = propertyValue;
          if (key == "analysis_config") {
            em.analyze(experiment, (updatedItem)=>{
              res.writeHead(200,{'Content-Type': 'application/json'});
              res.write(JSON.stringify(updatedItem));
              res.end();
            }, (err)=>{
              this._handleError(req, res, err);
            });
          } else {
            em.update(experiment, (updatedItem)=>{
              res.writeHead(200,{'Content-Type': 'application/json'});
              res.write(JSON.stringify(updatedItem));
              res.end();
            }, (err)=>{
              this._handleError(req, res, err);
            });
            
          }
        },
        (err)=>{
          console.log("experimentGet ERROR. " + err);
          console.log(err)
          this.error500(req, res, err);
        });
      }
    );
  }
  
  experimentProtocolGet () { return this._experimentGetProperty("protocol"); }
  experimentProtocolUpdate () { return this._experimentUpdateProperty("protocol"); }
  experimentProtocolDelete () { /* TODO */ }
  experimentInfoGet () { return this._experimentGetProperty("info"); }
  experimentInfoUpdate () { return this._experimentUpdateProperty("info"); }
  experimentConfigGet () { return this._experimentGetProperty("config"); }
  experimentConfigUpdate () { return this._experimentUpdateProperty("config"); }
  experimentAnalysisConfigGet () { return this._experimentGetProperty("analysis_config"); }
  experimentAnalysisConfigUpdate () { return this._experimentUpdateProperty("analysis_config"); }
  experimentLogGet () { return this._experimentGetProperty("log"); }
  experimentAnalysisGet () { return this._experimentGetProperty("analysis"); }
  experimentAnalysisBaselineGet () { return this._experimentGetProperty("analysis.baseline"); }
  experimentAnalysisThresholdGet () { return this._experimentGetProperty("analysis.baseline"); }
  experimentAnalysisStandardCurveGet () { return this._experimentGetProperty("analysis.baseline"); }
  
  error404 (req, res) {
    res.writeHead(404,{'Content-Type': 'application/json'});
    res.write("Not found.");
    res.end();
  }
  error500 (req, res, message) {
    res.writeHead(500,{'Content-Type': 'application/json'});
    res.write(JSON.stringify(message));
    res.end();
  }
}

class NinjaQPCRWebSocketServer {
  constructor (server) {
    qpcr.setEventReceiver(this);
    this.server = server;
    this.wsServer = new WebSocketServer({
        httpServer: this.server
    });
    eventBus.subscribe("", (topic, data)=>{
      const obj = {
        topic:topic,
        data:data
      };
      this._send(obj);
    });
    this.connections = [];
    
    this.wsServer.on('request', (request)=>{
      const connection = request.accept(null, request.origin);
      this.connections.push(connection);
      connection.on('message', (message)=>{
        const obj = JSON.parse(message.utf8Data);
        this.handleMessage(obj);
        eventBus.publish(obj.topic, obj.data);
      });
      connection.on('close', (reasonCode, description)=>{
        console.log('Disconnected.');
        const index = this.connections.indexOf(connection);
        if (index > -1) {
          this.connections.splice(index, 1);
        }
      });
    });
    this.protocol = defaultProtocol;
    
    // Ping server
    eventBus.subscribe("ping", (topic, data) => {
      console.log("Ping received.");
      eventBus.publish("pong", {});
    });
    // Device control server
    eventBus.subscribe("device.command", (topic, data)=>{
      console.log("Device command received! %s", topic);
      if (topic == "device.command.runOptics") {
        // TODO check device availability
        const session = new OpticsSession();
        qpcr.setSession(session);
        // TODO receive command
        session.start();
      }
      if (topic == "device.command.runPlateControl") {
        // TODO check device availability
        const session = new PlateControlSession();
        qpcr.setSession(session);
        // TODO receive command
        session.start();
      }
    });
    qpcr.startMonitoringTemperature ((data)=>{
      eventBus.publish("device.update.temperature", data);
    }, 3000);
  }
  handleMessage (obj) {
    switch (obj.topic) {
      case "experiment.command.pause":
        this.pause(); break;
      case "experiment.command.resume":
        this.resume(); break;
      case "experiment.command.finishAutoPause":
        this.finishAutoPause(); break;
      case "experiment.command.cancel":
        this.cancel(); break;
      case "experiment.command.finish":
        this.finish(); break;
      case "experiment.command.runExperiment": {
        const experimentId = obj.data.id;
        console.log("Run experiment. %s", experimentId);
        this.start(experimentId);
        break;
      }
      default:
        break;
    }
  }
  start (experimentId) {
    em.getExperiment(experimentId, (experiment)=>{
      this.protocol = experiment.protocol;
      qpcr.start(experiment);
      this.isRunning = true;
    });
  }
  pause () {
    qpcr.pause(this.protocol);
  }
  resume () {
    qpcr.resume(this.protocol);
  }
  finishAutoPause () {
    qpcr.finishAutoPause();
  }
  finish () {
    qpcr.finish(this.protocol);
  }
  cancel () {
    qpcr.cancel(this.protocol);
  }
  
  /* NinjaQPCR Event Handling */
  _send (data) {
    this.connections.forEach((connection)=>{
      try {
        connection.sendUTF(JSON.stringify(data));
      } catch (e) {
        console.error(e);
      }
    });
  }
  onThermalTransition (data) {
    eventBus.publish("experiment.update.transition", data);
  }
  onAutoPause (data) {
    eventBus.publish("experiment.update.autoPause", data);
  }
  onProgress (data) {
    eventBus.publish("experiment.update.progress", data);
  }
  onFluorescenceDataUpdate (data) {
    eventBus.publish("experiment.update.fluorescence", data);
  }
  onMeltCurveDataUpdate (data) {
    eventBus.publish("experiment.update.meltCurve", data);
  }
  onFluorescenceEvent (data) {
    eventBus.publish("experiment.update.fluorescenceEvent", data);
  }
  onDeviceStateChange (data) {
    eventBus.publish("experiment.update.transition", data);
  }
  onStart (data) {
    eventBus.publish("experiment.update.start", data);
    this.isRunning = false;
  }
  onComplete (data) {
    eventBus.publish("experiment.update.finish", data);
    this.isRunning = false;
  }
}
class NinjaQPCRServer {
  constructor  () {
  }
  getArgMap () {
    let name = null;
    let map = {};
    process.argv.forEach((str)=>{
      if (str.indexOf("--")==0) {
        name = str.replace("--","");
        map[name] = "";
      } else {
       if (name != null) {
         map[name] = str;
       }
        name = null;
      }
    });
    return map;
  }
  init () {
    // Commandline options
    const options = this.getArgMap();
    console.log(JSON.stringify(options));
    
    const clientHost = (options.clientHost) ? options.clientHost:CLIENT_HOST_DEFAULT;
    const clientPort = (options.clientPort) ? options.clientPort:CLIENT_PORT_DEFAULT;
    const hardwareFile = (options.dummyHardware) ? "hardware_dummy.json" : "hardware.json";
    console.log("hardwareFile=%s", hardwareFile);
    
    qpcr = new NinjaQPCR(hardwareFile);
    
    this.server = http.createServer();
    this.server.listen(WEBSOCKET_PORT);
    this.httpServer = new NinjaQPCRHTTPServer(this.server, clientHost, clientPort);
    this.webSocketSErver = new NinjaQPCRWebSocketServer(this.server);
    console.log("Ninja qPCR server started.");
    if (qpcr.shutdownSwitch) {
      qpcr.shutdownSwitch.addShutdownHandler(()=>{
        /*
        console.log("shutdown pin became low.");
        eventBus.publish("device.update.shutdown", {});
        qpcr.shutdown();
        exec('sudo shutdown -h -t 5', (error, stdout, stderr) => {
          console.log("Error", error);
          console.log("Stdout", stdout);
          console.log("Stderr", stderr);
        });
        process.exit(0);
        */
      });
    }
  }
}
function handleSignal(signal) {
  console.log("Received signal : %s", signal);
  eventBus.publish("device.update.shutdown", {});
  qpcr.shutdown();
  process.exit(0);
}

new NinjaQPCRServer().init();
process.on('SIGINT', handleSignal);
