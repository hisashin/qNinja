
function createNewNetwork () {
  return { id: maxId++, isNew: true, passphraseUpdated: false };
}
function requestData (path, data, method, onSuccess, onError) {
  const xmlhttp = new XMLHttpRequest();
  const url = path;
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
    let networks = [];
    if (responseData != null && responseData.country != null) {
      app.country = responseData.country;
    }
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
var COUNTRY_OPTIONS = [];
function initCountries () {
  let sel = document.getElementById("country");
  for (let country of COUNTRIES) {
    const option = document.createElement("option");
    option.value = country[0];
    option.innerHTML = country[1] + " (" + country[0] + ")";
    sel.appendChild(option);
  }
}
window.onload = ()=>{
  initCountries();
  initApp();
  loadConf();
};
let app = null;
let isKiosk = false;
function initApp() {
  isKiosk = location.href.indexOf("?kiosk=true") > 0;
  if (isKiosk) {
    VirtualKeyboard.initKeyboard();
  }
  app = new Vue({
    el: '#app',
    data: {
      networks:[],
      errorMessages:null,
      saved:false,
      changed:0,
      country:"",
      countries:COUNTRIES,
      isKiosk:isKiosk
    },
    methods: {
      remove: function (id) {
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
        const network = this.networks[this.findNetworkIndexForId(id)];
        network.passphraseUpdated = true;
        network.passphrase_dummy = "....";
        network.version ++;
      },
      add: function () {
        const network = createNewNetwork();
        this.networks.push(network)
      },
      clearErrors: function () {
        this.errorMessage = null;
        this.networks.forEach((network)=>{
          network.errors = null;
        });
      },
      reboot: function () {
        requestData("/reboot", null, "GET", (responseData)=>{
          if (responseData.success) {
            document.getElementById("app").style.display = "none";
            document.getElementById("rebooting").style.display = "block";
          }
        });
      },
      shutdown: function () {
        requestData("/shutdown", {}, "POST", (responseData)=>{});
      },
      save:function () {
        const dataObj = {
          country: this.country,
          networks: this.networks
        };
        const data = JSON.parse(JSON.stringify(dataObj));
        console.log(data)
        requestData("/update", data, "POST", (responseData)=>{
          console.log(responseData);
          this.clearErrors();
          if (responseData.isValid) {
            this.saved = true;
            this.errorMessages = null;
          } else {
            this.errorMessages = responseData.messages;
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
}