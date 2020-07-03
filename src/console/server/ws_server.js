"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const hardwareConf = require(QPCR_PATH + "conf/dummy_hardware_conf");
const qpcr = new NinjaQPCR(hardwareConf);
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ProtocolManager = require(QPCR_PATH + "protocol_manager");
const pm = new ProtocolManager();
const Router = require("./router");

const http = require('http');
var URL = require('url');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = 2222;

class NinjaQPCRHTTPServer {
  constructor (server) {
    this.server = server;
    const router = new Router();
    
    router.addPath("/protocols", this.protocols);
    router.addPath("/protocols/{pid}", this.protocolGet);
    router.addPath("/protocols/{pid}/update", this.protocolUpdate);
    router.add404(this.error404);
    
    this.server.on('request', (req, res)=>{
      // CORS
      res.setHeader('Access-Control-Allow-Origin', '*');
      router.route(req, res);
    });
  }
  protocolUpdate (req, res, map) {
    console.log("protocolUpdate");
    req.on("data", (rawData)=>{
      console.log("protocolUpdate received data.");
      const item = JSON.parse(rawData);
      console.log("name=%s", item.protocol.name);
      console.log("id=%s", item.id);
      if (item.protocol!=null && item.protocol.name!=null && item.id!=null) {
        
        pm.update(item, ()=>{
          res.writeHead(200,{'Content-Type': 'application/json'});
          res.write("Saved");
          res.end();
        }, (err)=>{
          this.error500(err);
          
        });
      }
    });
  }
  protocolGet (req, res, map) {
    pm.getProtocol(map.pid, (item)=>{
      console.log("onLoad");
      res.writeHead(200,{'Content-Type': 'application/json'});
      res.write(JSON.stringify(item));
      res.end();
    },
    (err)=>{
      this.error500(err);
    });
    
  }
  protocols (req, res, map) {
    pm.getProtocols((protocols)=>{
      console.log("onLoad");
      res.writeHead(200,{'Content-Type': 'application/json'});
      res.write(JSON.stringify(protocols));
      res.end();
    },
    (err)=>{
      this.error500(err);
    });
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
      case "experiment.stop":
        this.stop();
        break;
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
    qpcr.setEventReceiver(this);
    qpcr.start(this.protocol);
    this.isRunning = true;
  }
  stop () {
    // TODO
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
  onStart (data) {
    const obj = {
      category:"experiment.start",
      data:data
    };
    this.connection.sendUTF(JSON.stringify(obj));
    this.isRunning = false;
    
  }
  onFinish (data) {
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