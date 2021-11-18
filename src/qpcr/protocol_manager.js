"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const DATA_DIR_ROOT = process.env.NINJAQPCR_USER_DATA || "/home/pi/ninjaqpcr/user_data";
const ErrorCode = require("./error_code");
const validator = require("./protocol_validator");

class ProtocolManager {
  constructor () {
    this.items = null;
    this.validator = validator;
  }
  /* API */
  // Returns all protocols
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
  
  // Returns single protocol
  getProtocol (id, callback, onError) {
    this._getProtocol (id, callback, onError);
  }
  // Insert new protocol
  create (protocol, onSuccess, onError) {
    // Assign ID
    const errors = this.validator.validate(protocol);
    if (errors.length > 0) {
      onError({code:ErrorCode.InvalidData, message:"Invalid data.", data:errors});
      return;
    }
    const item = this._createProtocol();
    item.protocol = protocol;
    item.created = new Date().getTime();
    this.update(item, onSuccess, onError);
  }
  // Update existing protocol
  update (content, onUpdate /* (content)=>{} */, onError) {
    const timestamp = new Date().getTime();
    content.modified = timestamp;
    const filePath = this._protocolDir() + "/" + content.id;
    const errors = this.validator.validate(content.protocol);
    if (errors.length > 0) {
      onError({code:ErrorCode.InvalidData, message:"Invalid data.", data:errors});
      return;
    }
    
    fs.writeFile(filePath, JSON.stringify(content), (err)=>{
      if (err) {
        // File system error
        console.log(err);
        if (onError) {
          onError({
            code: ErrorCode.DataError,
            message:err.message
          });
        }
      } else {
        // Reload
        this._loadProtocols(
          ()=>{
            if (onUpdate) {
              // Updated protocol file
              onUpdate(content);
            }
          },
          onError
        );
      }
    });
  }
  delete (id, onDelete, onError) {
    const filePath = this._protocolDir() + "/" + id;
    this._getProtocol(id, ()=>{
      fs.unlink(filePath, (err) => {
        if (err) {
          console.error(err);
          if (onError) {
            onError({
              code:ErrorCode.DataError,
              message: "Database error."
            });
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
    }, onError);
  }
  
  validate (protocol, onSuccess, onError) {
    const errors = this.validator.validate(protocol);
    onSuccess(errors);
  }
  // Not supported by server.js
  duplicate (id, onSuccess/* (id, content)=>{}*/, onError) {
    this._getProtocol(id, (fromItem)=>{
      const toItem = this._createProtocol();
      toItem.protocol = fromItem.protocol;
      toItem.protocol.name = "Copy of " + fromItem.protocol.name;
      this.update(toItem, onSuccess, onError);
    }, onError);
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
  
  // onError is called if no protocol found.
  _getProtocol (id, callback, onError) {
    if (id == null || id.length == 0) {
      onError({
        code: ErrorCode.BadRequest,
        message: "Protocol ID not specified."
      });
      return;
    }
    this.getProtocols(
      (items)=>{
        for (let i=0; i<items.length; i++) {
          if (items[i].id == id) {
            console.log(items[i].id);
            // Item found.
            callback(items[i]);
            return;
          }
        }
        // Not found
        if (onError) {
          onError({
            code: ErrorCode.NotFound,
            message:"Protocol not found"
          });
          
        }
      },
      onError // Other error
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
          onError({
            code:ErrorCode.DataError,
            message:err.message
          });
        }
      });
    });
  }
}
const instance = new ProtocolManager();

module.exports = instance;