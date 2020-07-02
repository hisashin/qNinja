"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

class ProtocolManager {
  constructor () {
    this.protocols = null;
  }
  /* API */
  getProtocols (onLoad, onError) {
    if (this.protocols != null) {
      if (onLoad) {
        onLoad(this.protocols);
      }
      return;
    }
    this._loadProtocols((protocols)=>{
      if (onLoad) {
        onLoad(this.protocols);
      }
      
    }, onError);
  }
  
  save (content, id, onsSave /* (content, id)=>{} */, onError) {
    const dateStr = new Date().getTime();
    content.modified = dateStr;
    if (id == null) {
      id = uuidv4();
      console.log("Creating protocol. UUID:%s", id);
      content.created = dateStr;
    } else {
      console.log("Updating protocol. UUID:%s", id);
    }
    const filePath = this._protocolDir() + "/" + id;
    console.log("Writing the protocol to %s", filePath);
    fs.writeFile(filePath, JSON.stringify(content), (err)=>{
      if (err) {
        console.log(err);
        if (onError) {
          onError(err);
        }
      } else {
        // Reload
        this._loadProtocols(
          ()=>{
            if (onsSave) {
              onsSave(id, content);
            }
          },
          (err)=>{
            if (onError) {
              onError(err);
            }
          }
        );
      }
    });
  }
  delete (id, onDelete, onError) {
    const filePath = this._protocolDir() + "/" + id;
    fs.unlink(filePath, (err) => {
      if (err) {
        console.error(err);
        if (onError) {
          onError(err);
        }
        return
      }
      // Reload
      this._loadProtocols(
        (protocols)=>{
          if (onDelete) {
            onDelete();
          }
        },
        onError
      );
      
    });
  }
  duplicate (id, onSuccess/* (id, content)=>{}*/, onError) {
    this._getProtocol(id, (fromProtocol)=>{
      if (fromProtocol == null) {
        if (onError) {
          onError("Protocol not found id:" + id);
        }
        return;
      }
      const now = new Date();
      const toProtocol = JSON.parse(JSON.stringify(fromProtocol));
      toProtocol.name = "Copy of " + fromProtocol.name;
      this.save(toProtocol, null, onSuccess, onError);
    }, onError);
  }
  _getProtocol (id, callback, onError) {
    this.getProtocols(
      (protocols)=>{
        for (let i=0; i<protocols.length; i++) {
          if (protocols[i].id == id) {
            callback(protocols[i].content);
            return;
          }
        }
        callback(null);
      },
      onError
    );
  }
  
  /* Private */
  _protocolDir ( ) {
    return DATA_DIR_ROOT + "/protocol";
  }
  _logDir ( ) {
    return DATA_DIR_ROOT + "/protocol";
  }
  /* Load all protocols async */
  _loadProtocols (onLoad, onError) {
    console.log("Loading protocols from %s", this._protocolDir());
    fs.readdir(this._protocolDir(), (err, allFiles) => {
      if (err) {
        throw err;
      }
      let tasks = [];
      let contents = [];
      allFiles.forEach((file)=>{
        const path = this._protocolDir() + "/" + file;
        const task = new Promise(
          (resolve, reject)=>{
            fs.readFile(path, (err, rawData)=>{
              if (err == null) {
                try {
                  contents.push({id:file, content:JSON.parse(rawData)});
                  resolve();
                } catch (ex) {
                  reject(ex);
                }
              } else {
                reject(err);
              }
            });
          }
        );
        tasks.push(task)
      });
      Promise.all(tasks).then(()=>{
        this.protocols = contents;
        if (onLoad) {
          onLoad(this.protocols);
        }
      }).catch((err)=>{
        console.log(err);
        if (onError) {
          onError(err);
        }
      });
    });
  }
}

module.exports = ProtocolManager;