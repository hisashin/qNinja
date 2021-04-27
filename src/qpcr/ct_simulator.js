const CONFIG = {
  "series_list": [
    {
      "label": "Demo",
      "type": "standard",
      "start_quantity": 1,
      "factor": 10,
      "count": 5,
      "wells": [
        0,
        1,
        2,
        3,
        4
      ]
    }
  ],
  "wells": [
    {
      "id": 0,
      "label": "Std A",
      "quantity": 0.1,
      "is_in_series": true,
      "name": "A1",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 1,
      "series_quantity": 1
    },
    {
      "id": 1,
      "label": "Std B",
      "quantity": 0.2,
      "is_in_series": true,
      "name": "A2",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 2,
      "series_quantity": 2
    },
    {
      "id": 2,
      "label": "Std C",
      "quantity": 0.3,
      "is_in_series": true,
      "name": "A3",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 4,
      "series_quantity": 4
    },
    {
      "id": 3,
      "label": "Std D",
      "quantity": 0.4,
      "is_in_series": true,
      "name": "A4",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 8,
      "series_quantity": 8
    },
    {
      "id": 4,
      "label": "Std E",
      "quantity": 0.5,
      "is_in_series": true,
      "name": "A5",
      "series_id": 0,
      "series_type": "standard",
      "series_factor": 16,
      "series_quantity": 16
    },
    {
      "id": 5,
      "label": "Sample F",
      "quantity": "",
      "is_in_series": false,
      "name": "A6",
      "type": "unknown"
    },
    {
      "id": 6,
      "label": "Sample G",
      "quantity": "",
      "is_in_series": false,
      "name": "A7",
      "type": "unknown"
    },
    {
      "id": 7,
      "label": "Sample H",
      "quantity": "",
      "is_in_series": false,
      "name": "A8",
      "type": "unknown"
    },
    {
      "id": 8,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B1"
    },
    {
      "id": 9,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B2"
    },
    {
      "id": 10,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B3"
    },
    {
      "id": 11,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B4"
    },
    {
      "id": 12,
      "label": "",
      "type": "negative_control",
      "is_in_series": false,
      "name": "B5"
    },
    {
      "id": 13,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B6"
    },
    {
      "id": 14,
      "label": "",
      "type": "empty",
      "is_in_series": false,
      "name": "B7"
    },
    {
      "id": 15,
      "label": "",
      "type": "unknown",
      "is_in_series": false,
      "name": "B8"
    }
  ]
};

function simulateCts (config, efficiency) {
  const wellConfig = JSON.parse(JSON.stringify(config));
  function randomQuantity () {
    return Math.pow(10, Math.random() * 5);
  }
  // Simulate Cq
  wellConfig.series_list.forEach ((series)=>{
    if (!series.start_quantity) {
      series.start_quantity = randomQuantity();
    }
    for (let i=0; i<series.count; i++) {
      let quantity = Math.pow(series.factor, i) * series.start_quantity;
      // console.log(quantity);
      wellConfig.wells[series.wells[i]].quantity = quantity;
    }
  });
  wellConfig.wells.forEach ((well)=>{
    if (well.is_in_series) {
      return;
    }
    if (well.type == "unknown" || well.type == "positive_control" ) {
      well.quantity = randomQuantity();
    } else {
      well.quantity = 0;
    }
  });
  const quantities = wellConfig.wells.map(well=>well.quantity);
  // Calc nice threshold value
  const logMinQuantity = Math.log10(Math.min.apply(null, quantities.filter(v=>v>0)));
  const logMaxQuantity = Math.log10(Math.max.apply(null, quantities.filter(v=>v>0)));
  
  const centerQuantity = Math.pow(10, (logMinQuantity + logMaxQuantity) / 2);
  const centerCt = 25 + 5 * Math.random();
  /*
  const centerQuantity = Math.pow(10, logMinQuantity + Math.random()*(logMaxQuantity-logMinQuantity));
  const centerCt = 28;
  */
  const cts = quantities.map((quantity)=>{
    if (quantity==0) return Number.MAX_VALUE; // Never reaches the threshold.
    return centerCt - Math.log(quantity/centerQuantity)/Math.log(1+efficiency);
  });
  return cts;
};

const efficiency = 1; // 0.9 to 1.1
const cts = simulateCts(CONFIG, efficiency);
console.log(cts);
module.exports = simulateCts;