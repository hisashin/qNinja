// Generate normally distributed random by Box–Muller transform
const BoxMuller = ()=>{
  let x = 0;
  let y = 0;
  while (x == 0) {
    x = Math.random();
  }
  while (y == 0) {
     y = Math.random();
  }
  return Math.sqrt(-2.0 * Math.log(x)) * Math.cos(2.0 * Math.PI * y);
};
/*
for (let i=0; i<2000; i++) {
  console.log(boxMuller());
}
*/

module.exports = BoxMuller;