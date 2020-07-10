class Device {
  constructor () {
    this.ws = null; // WebSocket object
    this.count = 0;
    this.connectionEventHandlers = [];
    this.deviceStateHandlers = [];
    this.transitionHandlers = [];
    this.progressHandlers = [];
    this.fluorescenceUpdateHandlers = [];
    
    this.deviceState = null;
    this.experimentProgress = null;
    this.protocol = null;
  }
  
  /* API */
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
        case "experiment.progress":
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
          this.setDeviceState(obj.data);
          break;
        default:
          console.log("Warning: unhandled category=%s", obj.category);
          break;
      }
    };
  }
  
  /* Experiment Control */
  start () {
    const obj = {
      "category":"experiment.start"
    };
    this.ws.send(JSON.stringify(obj));
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
  
  registerProtocol (protocol) {
    this.setProtocol(protocol);
    const obj = {
      "category":"experiment.registerProtocol",
      data:protocol
    };
    this.ws.send(JSON.stringify(obj));
  }
  
  setProtocol (protocol) {
    this.protocol = protocol;
    this.progressHandlers.forEach((handler)=>{
      if (handler.onUpdateProtocol) {
        handler.onUpdateProtocol(this.protocol);
      }
    });
  }
  
  getProtocol () {
    return this.protocol;
  }
  
  /* Event handler registration */
  addConnectionEventHandler (obj) {
    if (this.connectionEventHandlers.indexOf(obj) > -1) {
      console.warn("Device.addConnectionEventHandler: This object is already registered. Skip.");
      return;
    }
    this.connectionEventHandlers.push(obj);
  }
  addDeviceStateHandler (obj) {
    if (this.deviceStateHandlers.indexOf(obj) > -1) {
      console.warn("Device.addDeviceStateHandler: This object is already registered. Skip.");
      return;
    }
    this.deviceStateHandlers.push(obj);
  }
  addTransitionHandler (obj) {
    if (this.transitionHandlers.indexOf(obj) > -1) {
      console.warn("Device.addTransitionHandler: This object is already registered. Skip.");
      return;
    }
    this.transitionHandlers.push(obj);
  }
  addProgressHandler (obj) {
    if (this.progressHandlers.indexOf(obj) > -1) {
      console.warn("Device.addProgressHandler: This object is already registered. Skip.");
      return;
    }
    this.progressHandlers.push(obj);
  }
  addFluorescenceUpdateHandler (obj) {
    if (this.fluorescenceUpdateHandlers.indexOf(obj) > -1) {
      console.warn("Device.addFluorescenceUpdateHandler: This object is already registered. Skip.");
      return;
    }
    this.fluorescenceUpdateHandlers.push(obj);
  }
  
  getDeviceState () {
    return this.deviceState;
  }
  setDeviceState (deviceState) {
    this.deviceState = deviceState;
    this.deviceStateHandlers.forEach((handler)=>{
      if (handler.onDeviceStateChange) {
        handler.onDeviceStateChange(deviceState);
      }
    });
  }
}
const device = new Device();
module.exports = device;