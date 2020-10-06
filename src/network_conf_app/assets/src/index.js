/*
{
  networks [
    {
      ssid:
      psk:
      priority:
      scan_ssid:
    }
  ]

}
*/
class NetworkConfigurator {
  constructor () {
    this.fields = [];
    this.conf = {};
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
        console.log(JSON.stringify(responseData));
        this.clearErrors();
        if (responseData.isValid) {
          alert("Valid data");
        } else {
        }
      }, ()=>{
        alert("Error");
      });
    });
  }
  
}
var app = new Vue({
  el: '#app',
  data: {
    networks:[],
    errors:[],
    errorMessage:null
  },
  methods: {
    remove: function (id) {
      console.log(id);
      this.networks.splice(this.findNetworkIndexForId(id), 1);
    },
    findNetworkIndexForId (id) {
      for (let i=0; i<this.networks.length; i++) {
        if (id == this.networks[i].id) {
          return i;
        }
      }
      
    },
    startEditPassphrase: function (id) {
      console.log("Focus %d", id)
      const network = this.networks[this.findNetworkIndexForId(id)];
      console.log(network)
      network.passphraseUpdated = true;
      network.passphrase_dummy = false;
    },
    add: function () {
      console.log("add")
      const network = createNewNetwork();
      this.networks.push(network)
    },
    clearErrors: function () {
      this.errorMessage = null;
      this.networks.forEach((network)=>{
        network.errors = null;
      });
    },
    save:function () {
      console.log("save");
      const data = JSON.parse(JSON.stringify(this.networks));
      console.log(data);
      requestData("/update", data, "POST", (responseData)=>{
        console.log(JSON.stringify(responseData));
        this.clearErrors();
        if (responseData.isValid) {
          alert("Valid data");
        } else {
          this.errorMessage = responseData.message;
          if (responseData.errors) {
            for (let error of responseData.errors) {
              const network = this.networks[this.findNetworkIndexForId(error.id)];
              if (network == null) {
                console.log("network is null ???");
              } else {
                network.errors = error.errors;
              }
            }
          }
        }
      }, ()=>{
        alert("Error");
      });
      
    }
  }
});
function createNewNetwork () {
  return { id: maxId++, isNew: true };
}
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
let maxId = 0;
function loadConf () {
  requestData("/list", null, "get", (responseData)=>{
    console.log(responseData);
    let networks = [];
    if (responseData!=null && Array.isArray(responseData.networks)) {
      networks = responseData.networks;
    }
    for (let network of networks) {
      network.id = maxId ++;
    }
    if (networks.length == 0) {
      networks.push(createNewNetwork());
    }
    app.networks = networks;
  }, (error)=>{
    alert("Error");
    console.log(error)
  });
}

window.onload = ()=>{
  loadConf();
};