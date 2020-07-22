# Ninja qPCR Console

## Server

```
node ws_server.js
```

The server runs on localhost:2222.

The server app has WebSocket and REST interfaces. 

While the WebSocket API provides real-time device monitor and controller functionalities, the REST API is intended to manage protocols and logs. 
Exceptionally, paths beginning with "/device" return information about ongoing experiments so that a browser can show the progress just after joining it.

### REST API:


* /protocols : Get list of protocols
* /protocols/{protocol_id} : Get single protocol
* /protocols/{protocol_id}/update : Update protocol
* /logs : Get list of experiment logs
* /logs/latest : Get latest log
* /logs/{log_id} : Get single log
* /device : Get device status
* /device/protocol : Get current protocol (Empty if the device is idle)
* /device/progress : Get progress of current protocol
* /device/baseline" : Get fluorescence baseline & threshold values

### WebSocket API:

#### Client to server commands
```
{
  category: <String>,
  data: <Object>
}
```

Categories

* experiment.start :  Start an experiment
* experiment.pause : Pause an ongoing experiment
* experiment.resume : Resume an paused experiment
* experiment.abort : Abort an ongoing or paused experiment
* experiment.finish : Finish the experiment. This command is accepted only when the device is at "Final hold" state after an experiment. By this command, the device stop heat units and become "Idle" again.
* experiment.registerProtocol : Register a protocol for the next experiment.

#### Server to client

```
{
  category: <String>,
  data: <Object>
}
```
* experiment.transition : Experiment-level status changes such as stages, cycles and steps.
* experiment.progress : Current progress including temperatures, stages and steps. The latest data can also be obtained by /device/progress of the REST API.
* experiment.fluorescence : Results of fluorescence measurements.
* experiment.fluorescenceEvent : Significant events related to fluorescence measurements, such as 
  * Start and end of continuous measurement
  * Notification of baseline and threshold determination.
* experiment.start
* experiment.finish
* device.transition : Notify device-level (not experiment-level) status change
* (TODO) device.error : Notify device-level errors

Each category corresponds to event handlers of NinjaQPCR class:

| Category | Function |
| ---- | --- |
| experiment.transition | onThermalTransition |
| experiment.progress | onProgress |
| experiment.fluorescence | onFluorescenceDataUpdate |
| experiment.fluorescenceEvent | onFluorescenceEvent |
| experiment.start | onStart |
| experiment.finish | onComplete |
| device.transition | onDeviceStateChange |
| device.error | onError |

For details of data format, see [the document of NinjaQPCR class](../qpcr/API_ninjaqpcr.md).


# Client

The client is implemented as a Vue.js app.

Run (and hot reload):
```
npm run serve
```
By default, the app runs on
- Local:   http://localhost:8080 
- Network: http://192.168.1.15:8080

Build for production:
```
npm run build
```

Static files (HTML, css and js) are saved to "dist" directory.
