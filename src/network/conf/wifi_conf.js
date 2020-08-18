"use strict";
const { exec } = require("child_process");
const http = require('http');
var URL = require('url');
const fs = require('fs');

// Development env
/*
const CMD_WPA = "./wpa_passphrase";
const PATH_WPA_HEADER = "./wpa_supplicant_header.txt";
const PATH_WPA_CONF = "./wpa_supplicant.conf";
const SUDO = "";
const PORT = 8080;
*/

// RasPi
const CMD_WPA = "wpa_passphrase";
const PATH_WPA_HEADER = "./wpa_supplicant_header.txt";
const PATH_WPA_CONF = "/etc/wpa_supplicant/wpa_supplicant.conf";
const SUDO = "sudo";
const PORT = 8080;


class WifiConfServer {
  constructor () {
    
  }
  init () {
    this.server = http.createServer();
    this.server.listen(PORT);
    console.log("Start listening to port %d", PORT);
    this.server.on('request', (req, res)=>{
      const url = URL.parse(req.url).pathname;
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
      try {
        if (url == "/update") {
          this.update(req, res);
        } else {
          this.responseStatic(url, res);
          
        }
      } catch (ex) {
        console.error(ex);
      }
    });
  }
  
  responseStatic (url, res) {
      if (url == "/") {
        url = "/index.html"
      }
      fs.readFile("assets" + url, (err, rawData)=>{
        if (!err) {
          res.writeHead(200,{'Content-Type': 'text/html; charset=UTF-8'});
          res.write(rawData);
        } else {
          res.writeHead(404,{'Content-Type': 'application/json'});
          res.write("Not found.");
        }
        res.end();
      });
  }
  validate(ssid, pass) {
    let errors = [];
    if (ssid == null || ssid.length ==0) {
      errors.push("SSID is empty.");
    }
    if (pass == null || pass.length ==0) {
      errors.push("Passphrase is empty.");
    } else if (pass.length < 8 || pass.length > 63) {
      errors.push("Passphrase must be 8..63 characters");
    }
    return errors;
  }
  escape (str) {
    return str.replace(new RegExp("\"", "g"), "\\\"");
  }
  execCmd (command, callback) {
    console.log(command);
    exec(command, (error, stdout, stderr) => {
      if (error) {
        callback(error.message);
      }
      else if (stderr) {
        callback(stderr);
      } else {
        callback(null);
      }
    });
    
  }
  update (req, res) {
    req.on("data", (rawData)=>{
      const data = JSON.parse(rawData);
      console.log(data);
      // Validation
      res.writeHead(200,{'Content-Type': 'application/json'});
      const validationErrors = this.validate(data.ssid, data.pass);
      if (validationErrors.length > 0) {
        const result = {"success":false, "message":"ERROR", "errors":validationErrors};
        res.write(JSON.stringify(result));
        res.end();
      } else {
        const cmdWpa = CMD_WPA + " \"" + this.escape(data.ssid) + "\" \"" + this.escape(data.pass) + "\"";
        let result = {};
        this.execCmd(cmdWpa, (errorMessage)=>{
          if (errorMessage) {
            result.success = false;
            result.erros = [errorMessage];
            res.write(JSON.stringify(result));
            res.end();
          } else {
            const command = SUDO + " cp -f " + PATH_WPA_HEADER + " " + PATH_WPA_CONF + "; " 
              + SUDO + " " + cmdWpa + " >> " + PATH_WPA_CONF;
            this.execCmd(command, (errorMessage)=>{
              if (errorMessage) {
                result.success = false;
                result.erros = [errorMessage];
              } else {
                result.success = true;
              }
              res.write(JSON.stringify(result));
              res.end();
            });
          }
        });
      }
    });
    
  }
}
new WifiConfServer().init();