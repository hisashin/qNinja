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
    
  }
}

module.exports = Util;