"use strict";

class ADCManager {
  constructor (adc, dataRate) {
    this.adc = adc;
    this.dataRate = dataRate;
    this._isReaing = false;
    this.readQueue = [];
    this.started = false;
  }
  start () {
    if (this.started) {
      console.warn("ADCManager is already started");
      return;
    }
    this.started = true;
    this.adc.initialize();
    this.adc.selectDataRate(this.dataRate);
  }
  readChannelValue(channel, callback) {
    this.readQueue.push({channel:channel, callback:callback});
    this._readNext();
  }
  readDiffChannelValue(pChannel, nChannel, callback, errorHandler) {
    try {
      this.readQueue.push({diff:true, pChannel:pChannel, nChannel:nChannel, callback:callback});
      this._readNext();
    } catch (e) {
      if (errorHandler) {
        errorHandler(e)
      }
    }
  }
  _selectChannel (readConf) {
    if (readConf.diff) {
      this.adc.selectDiff(readConf.pChannel, readConf.nChannel);
    } else {
      this.adc.selectChannel(readConf.channel);
    }
  }
  _readNext (t) {
    if (this._isReading) {
      return;
    }
    const read = this.readQueue.shift();
    this._isReading = true;
    try {
      this._selectChannel(read);
    }  catch (e) {
        console.log(e);
    }
    this.adc.sync();
    const timeoutMsec = 2 + 1000/this.dataRate;
    setTimeout(()=>{
      this.adc.readConversionData((val, raw)=>{
        this._isReading = false;
        if (this.readQueue.length > 0) {
          this._readNext();
        }
        read.callback(val, raw);
      });
    }, timeoutMsec);
  }
}
module.exports = ADCManager;