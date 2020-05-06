'use strict';
const ExperimentCtrl = require('../lib/ExperimentCtrl.js');

module.exports = {
	update_experiment: update_experiment,
  delete_experiment: delete_experiment,
};

// Handler for the crt_updt action - Update or create an experiment.
async function update_experiment(messageObj) {
  try{
    if(logger) logger.info('update_experiment controller called - messageObj: ' + JSON.stringify(messageObj));
    ExperimentCtrl.start();
    const data = {
      code : 200,
      message : 'Started experiment'
    }
    return data;
	}catch(e){
    let msg = 'update_experiment: ' + e.stack;
		if(logger) logger.error(msg);
    return {code : 500, message : msg};
	}
}

// Stop an experiment.
async function delete_experiment(messageObj) {
  try{
    if(logger) logger.info('delete_experiment controller called');
    ExperimentCtrl.stop();
    const data = {
      code : 200,
      message : 'Stopped experiment'
    }
    return data;
  }catch(e){
    let msg = 'update_experiment: ' + e.stack;
    if(logger) logger.error(msg);
    return {code : 500, message : msg};
  }
}
