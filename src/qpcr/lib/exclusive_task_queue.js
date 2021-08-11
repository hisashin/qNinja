"use strict";

class ExclusiveTaskQueue {
  constructor () {
    this.queue = [];
    this.taskIdMax = 0;
    this.RELEASE_TIMEOUT = 2000;
  }
  request(task) {
    const id = this.taskIdMax;
    this.queue.push({task:task, id:id});
    this.taskIdMax ++;
    if (this.queue.length == 1) {
      this._doNextTask();
    }
    return id;
  }
  release (id) {
    // Release current hold request
    if (this.queue.length > 0) {
      if (this.queue[0].id == id) {
        // Released successfully.
        this.queue.shift();
      } else {
        console.warn("ExclusiveTaskQueue.release() wrong id %d", id);
      }
    } else {
      console.error("ExclusiveTaskQueue.release() queue is empty.");
    }
    // Start next task (if exists)
    if (this.queue.length > 0) {
      this._doNextTask();
    }
  }
  _doNextTask() {
    const task = this.queue[0];
    if (task.task) {
      task.task();
      setTimeout(()=>{
          if (this.queue.length > 0 && this.queue[0].id == task.id) {
            // The task still exists after timeout.
            console.error("ExclusiveTaskQueue timeout. Task [%d] timed out.", task.id);
            this.release(task.id);
          }
        },
        this.RELEASE_TIMEOUT
      );
    } else {
      console.warn("ExclusiveTaskQueue wait task is done, but callback is null.");
      this.release();
    }
  }
}
module.exports = ExclusiveTaskQueue;