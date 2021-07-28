"use strict";

class PromiseQueue {
  constructor (tasks) {
    this.tasks = tasks;
  }
  _exec () {
    if (this.tasks.length == 0) {
      this.resolve();
      return;
    }
    const f = this.tasks.shift();
    f().then(()=>{
      this._exec();
    }, (reason)=>{
      console.log(reason);
      if (this.reject) this.reject();
    });
  }
  exec () {
    setImmediate(() => {
      this._exec();
    });
    return new Promise((resolve, reject)=>{
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}

module.exports = PromiseQueue;