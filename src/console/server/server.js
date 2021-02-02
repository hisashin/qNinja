"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
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
const CLIENT_HOST_DEFAULT = "localhost";
const CLIENT_PORT_DEFAULT = "8888";

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
      let corsAllow = 'http://' + clientHost;
      if (clientPort != "80")  corsAllow += (":" + clientPort);
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
      req.on("data", (rawData)=>{
        try {
          const data = JSON.parse(rawData);
          callback(req, res, map, data);
        } catch (error) {
          // Failed to parse JSON
          let errorObj = {
            code:ErrorCode.DataError,
            message:"Malformed JSON"
          };
          this._handleError(req, res, errorObj);
        }
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
        // Empty response.
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
        const draft = em._createExperimentDraft(content);
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
    this.connections = [];
    
    this.wsServer.on('request', (request)=>{
      const connection = request.accept(null, request.origin);
      this.connections.push(connection);
      connection.on('message', (message)=>{
        const obj = JSON.parse(message.utf8Data);
        this.handleMessage(obj);
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
  }
  handleMessage (obj) {
    switch (obj.category) {
      case "experiment.pause":
        this.pause(); break;
      case "experiment.resume":
        this.resume(); break;
      case "experiment.abort":
        this.abort(); break;
      case "experiment.finish":
        this.finish(); break;
      case "experiment.runExperiment": {
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
  finish () {
    qpcr.finish(this.protocol);
  }
  abort () {
    qpcr.abort(this.protocol);
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
    const obj = {
      category:"experiment.transition",
      data:data
    };
    this._send(obj);
  }
  onProgress (data) {
    const obj = {
      category:"experiment.progress",
      data:data
    };
    this._send(obj);
  }
  onFluorescenceDataUpdate (data) {
    const obj = {
      category:"experiment.fluorescence",
      data:data
    };
    this._send(obj);
  }
  onMeltCurveDataUpdate (data) {
    const obj = {
      category:"experiment.meltCurve",
      data:data
    };
    console.log(obj)
    this._send(obj);
  }
  onFluorescenceEvent (data) {
    const obj = {
      category:"experiment.fluorescenceEvent",
      data:data
    };
    this._send(obj);
  }
  onDeviceStateChange (state) {
    const obj = {
      category:"device.transition",
      data:state
    };
    this._send(obj);
  }
  onStart (data) {
    const obj = {
      category:"experiment.start",
      data:data
    };
    this._send(obj);
    this.isRunning = false;
    
  }
  onComplete (data) {
    const obj = {
      category:"experiment.finish",
      data:data
    };
    this._send(obj);
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
    
    this.server = http.createServer();
    this.server.listen(WEBSOCKET_PORT);
    this.httpServer = new NinjaQPCRHTTPServer(this.server, clientHost, clientPort);
    this.webSocketSErver = new NinjaQPCRWebSocketServer(this.server);
    console.log("Ninja qPCR server started.");
    
  }
}
process.on('SIGINT', () => {
    console.log('Received SIGINT');
    qpcr.shutdown();
    process.exit(1);
});
new NinjaQPCRServer().init();