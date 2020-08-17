"use strict";

class ADCManager {
  constructor (adc, dataRate) {
    this.adc = adc;
    this.dataRate = dataRate;
    this.currentChannel = -1;
    this._isReaing = false;
    this.readQueue = [];
  }
  start () {
    this.adc.initialize();
    this.adc.selectDataRate(this.dataRate);
  }
  readChannelValue(channel, callback) {
    this.readQueue.push({channel:channel, callback:callback});
    this._readNext(1);
  }
  _selectChannel (channel) {
    // Write register (if needed) 
    if (this.currentChannel != channel) {
      this.adc.selectChannel(channel);
      this.currentChannel = channel;
    }
  }
  _readNext (t /* Debug param */) {
    if (this._isReading) {
      return;
    }
    const read = this.readQueue.shift();
    this._isReading = true;
    this._selectChannel(read.channel);
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