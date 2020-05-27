const ADG731BSUZ = require("../hardware/mux_adg731bsuz.js");


const SPI_CHANNEL = "/dev/spidev0.0";
const PIN_SYNC = 40; // Pin number
let mux = new ADG731BSUZ(SPI_CHANNEL, PIN_SYNC);
mux.initialize();

let channel = 0;
const CHANNELS_COUNT = 4;
setInterval(()=>{
  mux.selectChannel(channel);
  channel = (channel + 1) % CHANNELS_COUNT;
}, 500);