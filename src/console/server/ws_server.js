"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const hardwareConf = require(QPCR_PATH + "conf/dummy_hardware_conf");
const qpcr = new NinjaQPCR(hardwareConf);
const defaultProtocol = require(QPCR_PATH + "dev_protocol");
const ProtocolManager = require(QPCR_PATH + "protocol_manager");
const pm = new ProtocolManager();

const http = require('http');
var URL = require('url');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = 2222;

class NinjwQPCRServer {
  constructor  () {
  }
  protocols (req, res) {
    pm.getProtocols((protocols)=>{
      console.log("onLoad");
      res.writeHead(200,{'Content-Type': 'application/json'});
      res.write(JSON.stringify(protocols));
      res.end();
    },
    (err)=>{
      res.writeHead(500,{'Content-Type': 'application/json'});
      res.write(err);
      res.end();
    });
    
  }
  init () {
    this.server = http.createServer();
    this.server.listen(WEBSOCKET_PORT);
    this.wsServer = new WebSocketServer({
        httpServer: this.server
    });
    const routes = {
      '/protocols': this.protocols
    };
    this.server.on('request',(req, res)=>{
        const url = URL.parse(req.url);
        const route = routes[url.pathname];
        if (route) route(req, res);
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
new NinjwQPCRServer().init();