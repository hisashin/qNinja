console.log("index.js");

function requestData (path, data, method, onSuccess, onError) {
  const xmlhttp = new XMLHttpRequest();
  const url = path;
  console.log("AppState._requestData %s %s", method, url);
  xmlhttp.onreadystatechange = ()=>{
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
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

document.getElementById("submit").addEventListener("click", ()=>{
  console.log("submit");
  let ssid = document.getElementById("ssid").value;
  let pass = document.getElementById("pass").value;
  console.log("ssid=%s, pass=%s", ssid, pass);
  const data = {
    ssid:ssid,
    pass:pass
  };
  const ul = document.getElementById("errors");
  ul.innerHTML = "";
  requestData("/update", data, "POST", (responseData)=>{
    console.log(responseData);
    if (responseData.success) {
      alert("Success.");
    } else {
      if (responseData.errors) {
        responseData.errors.forEach((err, i) => {
          const li = document.createElement("li");
          li.innerHTML = err;
          ul.appendChild(li);
        });
        
      }
    }
  }, ()=>{
    alert("Error");
  });
});