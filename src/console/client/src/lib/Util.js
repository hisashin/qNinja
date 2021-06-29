"use strict";
const host = location.href.replace(new RegExp("http\\\:\\\/\\\/([^:/]*).*"),"$1");
const API_PORT = "2222";
const API_ENDPOINT = "http://" + host + ":" + API_PORT + "/";
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
  },
  defaultPalette:[
  "#f07575",
  "#f09e75",
  "#f0c775",
  "#f0f075",
  "#c7f075",
  "#9ef075",
  "#75f075",
  "#75f09e",
  "#75f0c7",
  "#75f0f0",
  "#75c7f0",
  "#759ef0",
  "#7575f0",
  "#9e75f0",
  "#c775f0",
  "#f075f0",
  "#f075c7",
  "#f0759e"
  ]
}

module.exports = Util;