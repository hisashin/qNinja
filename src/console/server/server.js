"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const qpcr = new NinjaQPCR("hardware.json");
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ProtocolManager = require(QPCR_PATH + "protocol_manager");
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

class NinjaQPCRHTTPServer {
  constructor (server, clientHost, clientPort) {
    this.server = server;
    
    const router = new Router();
    this.router = router;
    
    router.addPath("/", "GET", this.root());
    router.addPath("/protocols", "GET", this.protocols());
    router.addPath("/protocols/{pid}", "GET", this.protocolGet());
    router.addPath("/protocols/{pid}", "PUT", this.protocolUpdate());
    router.addPath("/protocols/{pid}", "DELETE", this.protocolDelete());
    router.addPath("/logs", "GET", this.logs());
    router.addPath("/logs/latest", "GET", this.logLatest());
    router.addPath("/logs/{lid}", "GET", this.logGet());
    
    // TODO: Reconsinder paths.
    router.addPath("/device", "GET", this.device());
    router.addPath("/device/experiment", "GET", this.deviceExperiment());
    router.addPath("/device/experiment/protocol", "GET", this.deviceProtocol());
    router.addPath("/device/experiment/progress", "GET", this.deviceProgress());
    router.addPath("/device/experiment/baseline", "GET", this.deviceBaseline());
    router.addPath("/device/experiment/melt_curve", "GET", this.deviceMeltCurve());
    
    router.add404(this.error404);
    this.server.on('request', (req, res)=>{
      // CORS
      const corsAllow = 'http://' + clientHost + ":" + clientPort;
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
  
  protocolUpdate () {
    return (req, res, map)=>{
      req.on("data", (rawData)=>{
        console.log("protocolUpdate received data.");
        const item = JSON.parse(rawData);
        console.log("name=%s", item.protocol.name);
        console.log("id=%s", item.id);
        if (item.protocol!=null && item.protocol.name!=null && item.id!=null) {
          
          pm.update(item, ()=>{
            res.writeHead(200,{'Content-Type': 'application/json'});
            const obj = {success:true}
            res.write(JSON.stringify(obj));
            res.end();
          }, (err)=>{
            this.error500(req, res, err);
            
          });
        }
      });
    }
  }
  
  // TODO 
  protocolDelete () {
    return (req, res, map)=>{
      console.log("TODO protocolDelete");
      res.writeHead(200,{'Content-Type': 'application/json'});
      const obj = {};
      res.write(JSON.stringify(obj));
      res.end();
    };
    
  }
  
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
  protocolGet () {
    return (req, res, map)=>{
      pm.getProtocol(map.pid, (item)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(item));
        res.end();
      },
      (err)=>{
        this.error500(req, res, err);
      });
    };
  }
  protocols () {
    return (req, res, map)=>{
      pm.getProtocols((protocols)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(protocols));
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