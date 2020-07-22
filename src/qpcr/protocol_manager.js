"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const DATA_DIR_ROOT = "/Users/maripo/git/Ninja-qPCR/src/qpcr/user_data"; // TODO: use user's home dir

class ProtocolManager {
  constructor () {
    this.items = null;
  }
  /* API */
  getProtocols (onLoad, onError) {
    if (this.items != null) {
      if (onLoad) {
        onLoad(this.items);
      }
      return;
    }
    this._loadProtocols((items)=>{
      if (onLoad) {
        onLoad(this.items);
      }
    }, onError);
  }
  // TODO
  insert () {
    
  }
  update (content, onUpdate /* (content)=>{} */, onError) {
    const dateStr = new Date().getTime();
    content.modified = dateStr;
    const filePath = this._protocolDir() + "/" + content.id;
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
            if (onUpdate) {
              onUpdate(content);
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
        (items)=>{
          if (onDelete) {
            onDelete();
          }
        },
        onError
      );
      
    });
  }
  duplicate (id, onSuccess/* (id, content)=>{}*/, onError) {
    this._getProtocol(id, (fromItem)=>{
      if (fromItem == null) {
        if (onError) {
          onError("Protocol not found id:" + id);
        }
        return;
      }
      const toItem = this._createProtocol();
      toItem.protocol = fromItem.protocol;
      toItem.protocol.name = "Copy of " + fromItem.protocol.name;
      this.update(toItem, onSuccess, onError);
    }, onError);
  }
  
  getProtocol (id, callback, onError) {
    console.log("getProtocol %s", id)
    this._getProtocol (id, callback, onError);
  }
  
  /* Private */
  _createProtocol () {
    const now = new Date().getTime();
    return {
      id: uuidv4(),
      created:now,
      modified:now,
      protocol:{}
    }
  }
  
  _getProtocol (id, callback, onError) {
    this.getProtocols(
      (items)=>{
        for (let i=0; i<items.length; i++) {
          if (items[i].id == id) {
            console.log(items[i].id);
            callback(items[i]);
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
  /* Load all items async */
  _loadProtocols (onLoad, onError) {
    console.log("Loading items from %s", this._protocolDir());
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
                  contents.push(JSON.parse(rawData));
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
        this.items = contents;
        if (onLoad) {
          onLoad(this.items);
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