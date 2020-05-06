'use strict';

module.exports = {
	get_thermal_cycler_status: get_thermal_cycler_status,
};

// Handler for the retrieve action - Update or create an thermal_cycler_status.
async function get_thermal_cycler_status(messageObj) {
  try{
    if(logger) logger.info('update_thermal_cycler_status controller called - messageObj: ' + JSON.stringify(messageObj));
    const data = {
      code : 200,
      message : 'Here is the thermal_cycler_status'
    }
    return data;
	}catch(e){
    let msg = 'get_thermal_cycler_status: ' + e.stack;
		if(logger) logger.error(msg);
    return {code : 500, message : msg};
	}
}
