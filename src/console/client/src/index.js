/* WebSocket Connection */
let ws = null;
const connect = ()=>{
  try {
    ws = new WebSocket('ws://localhost:2222/');
  } catch (ex) {
    return;
  }

  ws.onopen = function() {
      console.log('WebSocket Client Connected');
      connectionView.status = "Connected";
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
      case "experiment.progress":
          temperatureView.message = JSON.stringify(obj.data);
          updateTemp(obj);
        break;
      case "experiment.fluorescence":
        //document.getElementById("messageFluorescence").innerHTML =
        updateFluorescence(obj);
        break;
      case "experiment.finish":
        break;
      default:
        break;
    }
  };
};


const TUBE_COUNT = 8;
let tempWell = [];
let tempLid = [];
let fluorescence = [];
for (let i=0; i<TUBE_COUNT; i++) {
  fluorescence.push([]);
}

const connectionView = new Vue({
  el: '#connectionView',
  data: {
    status: "Disconnected"
  }
  
});
const colors = [
  "rgba(253,64,132, 1)",
  "rgba(0,164,239, 1)",
  "rgba(106,180,62, 1)",
  "rgba(232,157,65, 1)",
  "rgba(115,92,176, 1)",
];
const createDataset = (channelIndex, name, showLine)=>{
  let color = colors[channelIndex%colors.length]
  return {
    showLine: showLine,
    label: name,
    fill:false,
    borderColor: color,
    pointColor: color,
    pointStrokeColor: "#fff",
    lineTension: 0.1,
    data: [
    ]
  };
};
let startTime = new Date();
const updateTemp = (obj) => {
  temperatureView.well = obj.data.well;
  temperatureView.lid = obj.data.lid;
  let timestamp = new Date().getTime() - startTime.getTime();
  tempWell.push({t:timestamp, v:obj.data.well});
  tempLid.push({t:timestamp, v:obj.data.lid});
  temperatureChart.data.datasets[0].data = tempWell.map(
    obj =>( { "x":obj.t/1000.0, "y":obj.v })
  );
  temperatureChart.data.datasets[1].data = tempLid.map(
    obj =>( { "x":obj.t/1000.0, "y":obj.v })
  );
  temperatureChart.update();
  
};
const updateFluorescence = (obj) => {
  let timestamp = new Date().getTime() - startTime.getTime();
  tubesView.tubes = obj.data;
  for (let i=0; i<TUBE_COUNT; i++) {
    fluorescence[i].push({t:timestamp, v:obj.data[i]});
    fluorescenceChart.data.datasets[i].data = fluorescence[i].map(
      obj =>( { "x":obj.t/1000.0, "y":obj.v })
    );
    
  }
  fluorescenceChart.update();
  
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

const temperatureView = new Vue({
  el: '#progressView',
  data: {
    message:"-",
    well: "-",
    lid: "-"
  }
});

const demoFluorescence = [0.9604030140621712,0.9383281839278435,0.9116271808325259,0.8813612698451002,0.8485607523442491,0.8144114129458446,0.779982174817932,0.7458700961350746];

const tubesView = new Vue({
  el: '#tubesView',
  data: {
    tubes:demoFluorescence
  }
});
var temperatureChart = null;
const createTemperatureChart = () => {
  const ctx = document.getElementById('chartTemperature').getContext('2d');
  var data = {
    datasets: [
      /* createDataset() */
    ]
  };
  let options = {
  };
  temperatureChart = new Chart(ctx, {
    type: 'scatter',
    data: data,
    options: {
      animation: false,
      scales: {
          xAxes: [{
              ticks: {
                  min: 0,
                  max:200
              }
          }],
          yAxes: [{
              ticks: {
                  min: 20,
                  max: 100.0
              }
          }]
      }
    }
  });
  temperatureChart.data.datasets[0] = createDataset(0, "Well", true);
  temperatureChart.data.datasets[1] = createDataset(1, "Lid", true);
};
createTemperatureChart();

var fluorescenceChart = null;
const createFluorescenceChart = () => {
  const ctx = document.getElementById('chartFluorescence').getContext('2d');
  var data = {
    datasets: [
      /* createDataset() */
    ]
  };
  let options = {
  };
  fluorescenceChart = new Chart(ctx, {
    type: 'scatter',
    data: data,
    options: {
      animation: false,
      scales: {
          xAxes: [{
              ticks: {
                  min: 0,
                  max:200
              }
          }],
          yAxes: [{
              ticks: {
                  min: 0,
                  max: 1.0
              }
          }]
      }
    }
  });
  for (let i=0; i<8; i++) {
    fluorescenceChart.data.datasets[i] = createDataset(i, "Well " + i, true);
  }
};
createFluorescenceChart();
const updateChart = () => {
  if (!chart) return;
  chart.data.datasets[0].data.push({
    x: Math.random()*10,
    y: Math.random() * 50
  });
  chart.update();
};