"use strict";

const fs = require('fs');
const { v4: uuidv4 } = require('uuid');
const DATA_DIR_ROOT = __dirname + "/user_data";
const ErrorCode = require("./error_code");
const Validator = require("./validator");

class ProtocolManager {
  constructor () {
    this.items = null;
    this.validator = new Validator(RULE_PROTOCOL);
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
  
  create (protocol, onSuccess, onError) {
    // Assign ID
    const item = this._createProtocol();
    item.protocol = protocol;
    this.update(item, onSuccess, onError);
  }
  update (content, onUpdate /* (content)=>{} */, onError) {
    const dateStr = new Date().getTime();
    content.modified = dateStr;
    const filePath = this._protocolDir() + "/" + content.id;
    
    this._getProtocol(id, ()=>{
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
    }, onError);
  }
  delete (id, onDelete, onError) {
    const filePath = this._protocolDir() + "/" + id;
    // TODO check file existence
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

const LID_TEMP_MAX = 120;
const LID_TEMP_MIN = 25;
const WELL_TEMP_MAX = 100;
const WELL_TEMP_MIN = 25;

const RULE_DATA_COLLECTION = {
  ramp_end: { type:"boolean", required:false },
  hold_end: { type:"boolean", required:false },
  ramp_continuous: { type:"boolean", required:false },
  hold_continuous: { type:"boolean", required:false },
};
const RULE_STEP = {
  label: { type:"string", required:true, min_length:1, max_length:255 },
  temp: { type:"number", required:true, min:WELL_TEMP_MIN, max:WELL_TEMP_MAX },
  duration: { type:"number", required:true, min:0, max: 24 * 60 * 60 * 1000 },
  ramp_speed: { type:"number", required:false, min:0, max:20 },
  data_collection: { type:"object", required:false, rule:RULE_DATA_COLLECTION },
  _func: ()=>{}
};
const RULE_STAGE = {
  type: { type:"number", required:false, min:1, max:4 },
  repeat: { type:"integer", required:true, min:1, max:255 },
  steps: { type:"array", required:true, min_length:1, max_length:8, rule:RULE_STEP },
  _func: ()=>{}
  
};
const RULE_PROTOCOL = {
  name: { type:"string", required:true, min_length:1, max_length:255 },
  lid_temp: { type:"number", required:false, min:LID_TEMP_MIN, max:LID_TEMP_MAX },
  final_hold_temp: { type:"number", required:false, min:WELL_TEMP_MIN, max:WELL_TEMP_MAX },
  stages: { type:"array",required:true,  min_length:1, max_length:8, rule:RULE_STAGE },
  _func: ()=>{}
};

module.exports = ProtocolManager;