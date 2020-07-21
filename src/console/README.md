# Ninja qPCR Console

## Server

```
node ws_server.js
```

The server runs on localhost:2222.

The server app has WebSocket and REST interfaces. 

While the WebSocket API provides real-time device monitor and controller functionalities, the REST API is intended to manage protocols and logs. 
Exceptionally, paths beginning with "/device" return information about ongoing experiments so that a browser can show the progress just after joining it.

## REST API:


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

WebSocket API:

Client to server
```
{
  category: <String>,
  data: <Object>
}
```

Categories

Server to client


## Client

The client is implemented as a Vue.js app.

```
npm run serve
```

```
App running at:
- Local:   http://localhost:8080 
- Network: http://192.168.1.15:8080

Note that the development build is not optimized.
To create a production build, run npm run build.
```

Then access http://localhost:8080 by a web browser.