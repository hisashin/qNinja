//const { exec } = require("child_process");
const { exec } = require("child_process");
const callPy = () => {
  const command = "python demo.py";x
  // spawn(command, [], option);
  exec(command, (error, stdout, stderr) => {
    if (error) {
       console.error(error.message);
    }
    else if (stderr) {
      console.error(stderr);
    } else {
      console.log("demo.js output=%s", stdout);
    }
  });
};
callPy();