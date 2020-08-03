"use strict";
const API_ENDPOINT = "http://localhost:2222/";
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
  requestData (path, data, method, onSuccess, onError) {
    const xmlhttp = new XMLHttpRequest();
    const url = API_ENDPOINT + path;
    console.log("AppState._requestData %s %s", method, url);
    xmlhttp.onreadystatechange = ()=>{
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        console.log("AppState._requestData Success %s", url);
        try {
          onSuccess(JSON.parse(xmlhttp.responseText));
        } catch (e) {
          if (onError != null) {
            onError(e);
          }
        }
      }
    };
    xmlhttp.open(method, url, true);
    if (data == null) {
      xmlhttp.send();
    } else if (typeof(data)=='string') {
      xmlhttp.send(data);
    } else {
      xmlhttp.send(JSON.stringify(data));
    }
  }
}

module.exports = Util;