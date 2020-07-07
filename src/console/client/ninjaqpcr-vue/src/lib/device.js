class Device {
  constructor () {
    this.ws = null; // WebSocket object
    this.count = 0;
    this.connectionEventHandlers = [];
    this.deviceStateHandlers = [];
    this.transitionHandlers = [];
    this.progressHandlers = [];
    this.fluorescenceUpdateHandlers = [];
  }
  connect () {
    try {
      console.log("Connecting...");
      this.ws = new WebSocket('ws://localhost:2222/');
    } catch (ex) {
      return;
    }
    this.ws.onopen = () => {
      console.log('WebSocket Client Connected');
      this.connectionEventHandlers.forEach((handler)=>{
        if (handler.onOpen != null) {
          handler.onOpen();
        } else {
          console.warn("connectionEventHandlers onOpen is not defined.");
        }
      });
      // connectionView.status = "Connected";
    };
    this.ws.onmessage = (e) => {
      const obj = JSON.parse(e.data);
      switch (obj.category) {
        case "experiment.transition":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onTransition) {
              handler.onTransition(obj.data);
            }
          });
          break;
        case "experiment.thermal":
          this.progressHandlers.forEach((handler)=>{
            if (handler.onProgress) {
              handler.onProgress(obj.data);
            }
          });
          break;
        case "experiment.fluorescence":
          this.fluorescenceUpdateHandlers.forEach((handler)=>{
            if (handler.onFluorescenceUpdate) {
              handler.onFluorescenceUpdate(obj.data);
            }
          });
          break;
        case "experiment.start":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onStart) {

              console.log(obj)
              handler.onStart(obj.data);
            }
          });
          break;
        case "experiment.finish":
          this.transitionHandlers.forEach((handler)=>{
            if (handler.onComplete) {
              handler.onComplete(obj.data);
            }
          });
          break;
        case "device.transition":
          this.deviceStateHandlers.forEach((handler)=>{
            if (handler.onDeviceStateChange) {
              handler.onDeviceStateChange(obj.data);
            }
          });
          break;
        default:
          console.log("Warning: unhandled category=%s", obj.category);
          break;
      }
    };
  }
  pause () {
    const obj = {
      "category":"experiment.pause"
    };
    this.ws.send(JSON.stringify(obj));
  }
  resume () {
    const obj = {
      "category":"experiment.resume"
    };
    this.ws.send(JSON.stringify(obj));
  }
  abort () {
    const obj = {
      "category":"experiment.abort"
    };
    this.ws.send(JSON.stringify(obj));
  }
  resume () {
    const obj = {
      "category":"experiment.resume"
    };
    this.ws.send(JSON.stringify(obj));
  }
  start () {
    const obj = {
      "category":"experiment.start"
    };
    this.ws.send(JSON.stringify(obj));
  }
  setProtocol (protocol) {
    const obj = {
      "category":"experiment.setProtocol",
      data:protocol
    };
    this.ws.send(JSON.stringify(obj));
  }
  addConnectionEventHandler (obj) {
    this.connectionEventHandlers.push(obj);
  }
  addDeviceStateHandler (obj) {
    this.deviceStateHandlers.push(obj);
  }
  addTransitionHandler (obj) {
    this.transitionHandlers.push(obj);
  }
  addProgressHandler (obj) {
    this.progressHandlers.push(obj);
  }
  addFluorescenceUpdateHandler (obj) {
    this.fluorescenceUpdateHandlers.push(obj);
  }
}
const device = new Device();
module.exports = device;