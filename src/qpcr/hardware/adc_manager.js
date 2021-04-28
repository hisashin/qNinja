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
    this._readNext(1);
  }
  readDiffChannelValue(pChannel, nChannel, callback) {
    this.readQueue.push({diff:true, pChannel:pChannel, nChannel:nChannel, callback:callback});
    this._readNext(1);
  }
  _selectChannel (readConf) {
    if (readConf.diff) {
      this.adc.selectDiff(readConf.pChannel, readConf.nChannel);
    } else {
      this.adc.selectChannel(readConf.channel);
    }
  }
  _readNext (t /* Debug param */) {
    if (this._isReading) {
      return;
    }
    const read = this.readQueue.shift();
    this._isReading = true;
    this._selectChannel(read);
    this.adc.sync();
    const timeoutMsec = 1 + 1000/this.dataRate;
    setTimeout(()=>{
      this.adc.readConversionData((val)=>{
        this._isReading = false;
        if (this.readQueue.length > 0) {
          this._readNext(2);
        }
        read.callback(val);
      });
    }, timeoutMsec);
  }
}
module.exports = ADCManager;