"use strict";
const API_ENDPOINT = "http://localhost:2222/";
const API_PORT = "2222";
const Util = {
  humanTime: (timeSec)=>{
    let tokens = [];
    const day = Math.floor(timeSec / (60 * 60 * 24));
    if (day > 0) {
      tokens.push(day + "d");
    }
    timeSec -= day * (60 * 60 * 24);
    const hour = Math.floor(timeSec / (60 * 60));
    if (hour > 0) {
      tokens.push(hour + "h");
    }
    timeSec -= hour * (60 * 60)
    const min = Math.floor(timeSec / 60);
    if (min > 0) {
      tokens.push(min + "m");
    }
    timeSec -= min * 60;
    const sec = Math.floor(timeSec);
    tokens.push(sec + "s");
    return tokens.join(" ");
  },
  apiEndpoint () {
    return "http://" + location.hostname + ":" + API_PORT + "/";
  },
  requestData (path, data, method, onSuccess, onError) {
    const xmlhttp = new XMLHttpRequest();
    const url = Util.apiEndpoint() + path;
    console.log("AppState._requestData %s %s", method, url);
    xmlhttp.onreadystatechange = ()=>{
      if (xmlhttp.readyState == 4) {
        if (xmlhttp.status == 200) {
          try {
            if (onSuccess) {
              onSuccess(JSON.parse(xmlhttp.responseText));
            }
          } catch (e) {
            console.error(e);
            if (onError) {
              onError({exception:e});
            }
          }
        } else {
          let response = {};
          if (xmlhttp.responseText) {
            try {
              response = JSON.parse(xmlhttp.responseText);
            } catch (e) {
              console.error(e);
              console.warn("Unable to parse response.");
            }
          }
          if (onError) {
            onError({status:xmlhttp.status, content:response});
          }
        }
      }
    };
    try {
      xmlhttp.open(method, url, true);
      if (data == null) {
        xmlhttp.send();
      } else if (typeof(data)=='string') {
        xmlhttp.send(data);
      } else {
        xmlhttp.send(JSON.stringify(data));
      }
    } catch (ex) {
      console.error(ex);
      onError({exception:e});
    }
  }
}

module.exports = Util;