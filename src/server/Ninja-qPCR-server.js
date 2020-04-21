'use strict';
/*
 'use strict' is not required but helpful for turning syntactical errors into true errors in the program flow
 https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode
*/

const websocket_server = require(__dirname + '/core_modules/websocket-server.js');
const logger = require(__dirname + '/api/lib/logger.js')(module);

websocket_server.start(logger);
