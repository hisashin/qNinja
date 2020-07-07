"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const hardwareConf = require(QPCR_PATH + "conf/dummy_hardware_conf");
const qpcr = new NinjaQPCR(hardwareConf);
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ProtocolManager = require(QPCR_PATH + "protocol_manager");
const LogManager = require(QPCR_PATH + "log_manager");
const pm = new ProtocolManager();
const lm = new LogManager();
const Router = require("./router");

const http = require('http');
var URL = require('url');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = 2222;

class NinjaQPCRHTTPServer {
  constructor (server) {
    this.server = server;
    
    const router = new Router();
    this.router = router;
    
    router.addPath("/", this.root());
    router.addPath("/protocols", this.protocols());
    router.addPath("/protocols/{pid}", this.protocolGet());
    router.addPath("/protocols/{pid}/update", this.protocolUpdate());
    router.addPath("/logs", this.logs());
    router.addPath("/logs/latest", this.logLatest());
    router.addPath("/logs/{lid}", this.logGet());
    
    router.add404(this.error404);
    this.server.on('request', (req, res)=>{
      // CORS
      res.setHeader('Access-Control-Allow-Origin', '*');
      router.route(req, res);
    });
  }
  root () {
    return (req, res, map)=>{
      res.writeHead(200,{'Content-Type': 'application/json'});
      res.write(JSON.stringify(this.router.list()));
      res.end();
    }
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
            this.error500(err);
            
          });
        }
      });
    }
  }
  logs () {
    return (req, res, map)=>{
      lm.getSummaries({}, {}, (summaries)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(summaries));
        res.end();
      },
      (err)=>{
        this.error500(err);
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
        this.error500(err);
      });
    };
  }
  logGet () {
    return (req, res, map)=>{
      lm.getLog(map.lid, (log)=>{
        res.writeHead(200,{'Content-Type': 'application/json'});
        res.write(JSON.stringify(log));
        res.end();
      },
      (err)=>{
        this.error500(err);
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
        this.error500(err);
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
        this.error500(err);
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
    res.write(message);
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
    this.connection = null;
    this.wsServer.on('request', (request)=>{
        this.connection = request.accept(null, request.origin);
        let count = 0;
        this.connection.on('message', (message)=>{
          const obj = JSON.parse(message.utf8Data);
          this.handleMessage(obj);
        });
        this.connection.on('close', (reasonCode, description)=>{
            console.log('Disconnected.');
        });
    });
    this.protocol = defaultProtocol;
  }
  handleMessage (obj) {
    switch (obj.category) {
      case "experiment.start":
        this.start();
        break;
      case "experiment.pause":
        this.pause(); break;
      case "experiment.resume":
        this.resume(); break;
      case "experiment.abort":
        this.abort(); break;
      case "experiment.finish":
        this.finish(); break;
      case "experiment.setProtocol": {
        console.log("Protocol updated.");
        this.protocol = obj.data;
        console.log(this.protocol);
        break;
      }
      default:
        break;
    }
  }
  start () {
    qpcr.start(this.protocol);
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
  onThermalTransition (data) {
    const obj = {
      category:"experiment.transition",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
  }
  onThermalDataUpdate (data) {
    const obj = {
      category:"experiment.thermal",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
  }
  onFluorescenceDataUpdate (data) {
    const obj = {
      category:"experiment.fluorescence",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
  }
  onDeviceStateChange (state) {
    const obj = {
      category:"device.transition",
      data:state
    };
    this.connection.sendUTF(JSON.stringify(obj));
    console.log("ws_server onDeviceStateChange" + state);
  }
  onStart (data) {
    const obj = {
      category:"experiment.start",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
    this.isRunning = false;
    
  }
  onComplete (data) {
    const obj = {
      category:"experiment.finish",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
    this.isRunning = false;
  }
}
class NinjaQPCRServer {
  constructor  () {
  }
  init () {
    this.server = http.createServer();
    this.server.listen(WEBSOCKET_PORT);
    this.httpServer = new NinjaQPCRHTTPServer(this.server);
    this.webSocketSErver = new NinjaQPCRWebSocketServer(this.server);
    
  }
}
new NinjaQPCRServer().init();