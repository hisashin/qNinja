const ws = new WebSocket('ws://localhost:2222/');
ws.onopen = function() {
    console.log('WebSocket Client Connected');
};
ws.onmessage = function(e) {
  console.log("Received: '" + e.data + "'");
  const obj = JSON.parse(e.data);
  console.log(obj.category)
  switch (obj.category) {
    case "experiment.transition":
      document.getElementById("messageTransition").innerHTML = 
        JSON.stringify(obj.data);
      break;
    case "experiment.thermal":
      document.getElementById("messageThermal").innerHTML =
        JSON.stringify(obj.data);
      break;
    case "experiment.fluorescence":
      document.getElementById("messageFluorescence").innerHTML =
        JSON.stringify(obj.data);
      break;
    case "experiment.finish":
      break;
    default:
      break;
  }
};

const startExperiment = ()=>{
  const obj = {
    "category":"experiment.start"
  };
  ws.send(JSON.stringify(obj));
};
const stopExperiment = ()=>{
  const obj = {
    "category":"experiment.stop"
  };
  ws.send(JSON.stringify(obj));
};