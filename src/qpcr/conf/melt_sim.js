const MELT_RANGES = [
  { tm:50, h:5, ratio:0.1}, // Total
  { tm:84, h:30, ratio:0.7}, // Main
  { tm:60, h:30, ratio:0.2}, // ?
];
function getMeltCurve (initial, temp, tempMin, tempMax) {
  let val = 0;
  MELT_RANGES.forEach((range)=>{
    const cont =  - range.h * (temp - range.tm) / (tempMax - tempMin);
    val += range.ratio / (1 + Math.exp(cont));
  });
  return initial * (1.0 - val);
}
function demo () {
  let temp = 25;
  while (temp < 100) {
    console.log(getMeltCurve(800, temp, 25, 100));
    temp+= 1;
  }
}
demo();
