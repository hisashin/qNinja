"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ProtocolManager = require(QPCR_PATH + "protocol_manager");
const ErrorCode = require(QPCR_PATH + "error_code");
const LogManager = require(QPCR_PATH + "log_manager");

const pm = new ProtocolManager();
const lm = new LogManager();

const Router = require("./router");

const http = require('http');
var URL = require('url');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = "2222";
const CLIENT_HOST_DEFAULT = "localhost";
const CLIENT_PORT_DEFAULT = "8888";

class Pager {
  constructor (defaults, sortFunc, filterFunc) {
    this.defaults  = defaults;
    this.sortFunc = sortFunc;
    this.filterFunc = filterFunc;
  }
  _createPagination (all, query) {
    let limit = this._parseInt(query.limit, this.defaults.limit);
    if (limit <= 0) {
      // Zero or negative
      limit = this.defaults.limit;
    }
    let offset = this.defaults.offset; // Items to skip
    let page = 0;
    if (query.page) {
      // pages to skip
      page = this._parseInt(query.page, page);
      if (page < 0) page = 0;
      offset = limit * page;
    } else {
      offset = this._parseInt(query.offset, this.defaults.offset);
      if (offset < 0) offset = 0;
      page = Math.floor(offset / limit);
    }
    let list = all.slice(offset, offset + limit);
    let pages = Math.ceil(all.length/limit);
    const obj = {
      paging: {
        offset: offset,
        limit: limit,
        page: page,
        size: list.length, // Included item
        total: all.length, // Total items
        pages: pages
      },
      data: list
    };
    return obj;  
  }
  _parseInt (expression, defaultValue) {
    if (typeof(expression) != "string") {
      return defaultValue;
    }
    const intValue = parseInt(expression);
    if (isNaN(intValue)) return defaultValue;
    return intValue;
  }
  _filter (all, query) {
    if (this.filterFunc) {
      return (this.filterFunc(all, query));
    }
    return all;
  }
  _sort(all, query) {
    let sortFunction = this.sortFunc[query.sort];
    if (sortFunction == null) {
      sortFunction = this.sortFunc[this.defaults.sort];
    }
    let isAsc = "asc" == query.order;
    return all.sort(
      (_a, _b)=>{
        let a = (isAsc)? _a:_b;
        let b = (isAsc)? _b:_a;
        return sortFunction(a, b);
      }
    );
  }
  getPagination (all, query) {
    let filtered = this._filter(all, query);
    let sorted = this._sort(filtered, query);
    return this._createPagination(sorted, query);
    
  }
}
const protocolPager = new Pager(
  // Defaults
  {
    offset: 0,
    limit: 2,
    order: "desc",
    sort: "updated"
  },
  // Sort functions
  {
    "updated": (a, b) =>{
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
const logPager = new Pager(
  // Defaults
  {
    offset: 0,
    limit: 2,
    order: "desc",
    sort: "updated"
  },
  // Sort functions
  {
    "updated": (a, b) =>{
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
  // Filter func
  null
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
    router.addPath("/logs", "GET", this.logs());
    router.addPath("/logs/latest", "GET", this.logLatest());
    router.addPath("/logs/{lid}", "GET", this.logGet());
    
    // TODO: Reconsinder paths.
    router.addPath("/device", "GET", this.device());
    router.addPath("/device/experiment", "GET", this.deviceExperiment());
    router.addPath("/device/experiment/protocol", "GET", this.deviceProtocol());
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
      const obj = {
        protocol: qpcr.getProtocol(),
        conf: qpcr.getExperimentConf()
      };
      res.write(JSON.stringify(obj));
      res.end();
    };
  }
  
  deviceProtocol () {
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
  
  /* Protocols */
  _handlePmError (req, res, pmErr) {
    let errorCode = 500;
    let obj = {message:pmErr.message};
    if (pmErr.code == ErrorCode.NotFound) {
      errorCode = 404;
    }
    if (pmErr.code == ErrorCode.DataError) {
      errorCode = 400;
    }
    if (pmErr.code == ErrorCode.BadRequest) {
      errorCode = 500;
    }
    if (pmErr.code == ErrorCode.InvalidData) {
      errorCode = 422;
      obj.data = pmErr.data;
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
        // all.forEach((obj)=>{delete(obj.protocol.stages);delete(obj.protocol.lid_temp)});
        const obj = protocolPager.getPagination(all, query);
        res.write(JSON.stringify(obj));
        res.end();
      },
      (pmErr)=>{
        this._handlePmError(req, res, pmErr);
      });
    };
  }
  
  protocolCreate () {
    return (req, res, map)=>{
      req.on("data", (rawData)=>{
        console.log("protocolCreate received data.");
        const protocol = JSON.parse(rawData); // Protocol body
        pm.create(protocol, (item)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(item));
          res.end();
        }, (pmErr)=>{
          this._handlePmError(req, res, pmErr);
        });
      });
    }
  }
  
  protocolUpdate () {
    return (req, res, map)=>{
      req.on("data", (rawData)=>{
        console.log("protocolUpdate received data.");
        const content = JSON.parse(rawData);
        pm.update(content, (item)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(item));
          res.end();
        }, (pmErr)=>{
          this._handlePmError(req, res, pmErr);
        });
      });
    }
  }
  
  protocolValidate () {
    return (req, res, map)=>{
      req.on("data", (rawData)=>{
        console.log("protocolValidate received data.");
        const protocol = JSON.parse(rawData); // Protocol body
        console.log("name=%s", protocol.name);
        pm.validate(protocol, (result)=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write(JSON.stringify(result));
          res.end();
        }, (pmErr)=>{
          this._handlePmError(req, res, pmErr);
        });
      });
    }
  }
  
  protocolGet () {
    return (req, res, map)=>{
      pm.getProtocol(map.pid, (item)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(item));
        res.end();
      },
      (pmErr)=>{
        this._handlePmError(req, res, pmErr);
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
        this._handlePmError(req, res, pmErr);
      });
    };
    
  }
  
  // TODO 
  logs () {
    return (req, res, map)=>{
      lm.getSummaries({}, {}, (summaries)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(summaries));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
  
  logLatest () {
    return (req, res, map)=>{
      lm.getLatestLog((log)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(log));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
  logGet () {
    return (req, res, map)=>{
      lm.getAnalyzedLog(map.lid, (log)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(log));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
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
      case "experiment.start":
        this.start(); break;
      case "experiment.pause":
        this.pause(); break;
      case "experiment.resume":
        this.resume(); break;
      case "experiment.abort":
        this.abort(); break;
      case "experiment.finish":
        this.finish(); break;
      case "experiment.registerProtocol": {
        console.log("Protocol updated.");
        this.protocol = obj.data;
        console.log(this.protocol);
        break;
      }
      default:
        break;
    }
  }
  start (experimentConf) {
    qpcr.start(this.protocol, experimentConf);
    this.isRunning = true;
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