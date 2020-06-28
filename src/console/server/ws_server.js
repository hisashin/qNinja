"use strict";

const QPCR_PATH = "../../qpcr/";
const NinjaQPCR = require(QPCR_PATH + "ninjaqpcr");
const hardwareConf = require(QPCR_PATH + "conf/dummy_hardware_conf");
const qpcr = new NinjaQPCR(hardwareConf);
const protocol = require(QPCR_PATH + "dev_protocol");

const http = require('http');
const WebSocketServer = require('websocket').server;

const WEBSOCKET_PORT = 2222;

class NinjaQPCRServerExample {
  constructor  () {
  }
  init () {
    this.server = http.createServer();
    this.server.listen(WEBSOCKET_PORT);
    this.wsServer = new WebSocketServer({
        httpServer: this.server
    });
    this.connection = null;
    this.wsServer.on('request', (request)=>{
        this.connection = request.accept(null, request.origin);
        let count = 0;
        this.connection.on('message', (message)=>{
          console.log('Incoming message:', message.utf8Data);
          this.connection.sendUTF('Connected');
          this.start();
        });
        this.connection.on('close', (reasonCode, description)=>{
            console.log('Disconnected.');
        });
        this.start();
    });
  }
  start () {
    qpcr.setEventReceiver(this);
    qpcr.start(protocol);
    this.isRunning = true;
  }
  onThermalTransition (data) {
    console.log(data);
  }
  onThermalDataUpdate (data) {
    this.connection.sendUTF(JSON.stringify(data));
    // console.log("TEMP_DEMO\t%f\t%f", data.well, data.lid);
  }
  onFluorescenceDataUpdate (data) {
    console.log(data);
  }
  onFinish () {
    this.isRunning = false;
  }
}
new NinjaQPCRServerExample().init();