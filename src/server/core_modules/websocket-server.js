const WebSocket = require('ws');
const config = require('config');
const uuidv4 = require('uuid/v4');
const yaml = require('js-yaml');
const fs   = require('fs');

let clients = {};
let wss = new WebSocket.Server({ port: config.port });

module.exports.start = async function(a_logger) {
  try{
    // set up logging if desired.
    if(a_logger) logger = a_logger;
    // Load the swagger-ws definitions.
    let swagger = yaml.safeLoad(fs.readFileSync('./api/swagger/swagger-ws.yaml', 'utf8'));
    // Load the controllers.
    let controllers = {};
    if(logger) logger.info('Loading controllers - swagger: ' + JSON.stringify(swagger, null, ' '));
    const cwd = process.cwd();  // Current Working Directory of the main file.
    for(resource in swagger.resources){
      controller = swagger.resources[resource]['x-swagger-router-controller'];
      // The path inside require is always relative to the file containing the call to require 
      // therefore we use an absolute path because this is a module.
      controllers[resource] = require(cwd + '/api/controllers/' + controller);
    }
    if(logger) logger.info('Loaded controllers: ' + JSON.stringify(controllers, null, ' '));
    run_server(controllers, swagger);
  }catch(e){
    if(logger) logger.error(e.message);
    process.exit(1);
  }
};

function run_server(controllers, swagger){
  if(logger) logger.info('config: ' + JSON.stringify(config, null, ' '));

  // Here we send and receive messages to/from clients.
  wss.on('connection', function connection(ws, req) {
    if(logger) logger.info('connection - new connection');
    
    ws.id = uuidv4();

    ws.on('message', async function incoming(message) {
      if(logger) logger.info('connection on message incoming ' + message + ' - user role: ' + ws.userRole + ' - user id: ' + ws.userId);
      // Message validation TBD.
      messageObj = JSON.parse(message);

      if(messageObj.trans_id){
        // Save the connection for the transaction id so we can send the reply.
        if(! clients[messageObj.trans_id]){
          if(logger) logger.debug('connection - on message - set clients trans_id ' + messageObj.trans_id);
          clients[messageObj.trans_id] = ws
        }
        const resource_def = swagger.resources[messageObj.resource];
        try{
          // Call the function in the controller.
          var controller = resource_def['x-swagger-router-controller'];
          var operationId = resource_def[messageObj.action].operationId;
          controllers[controller][operationId](messageObj)
          .then(function(data){
            send_response(messageObj, data, ws);
          });
        }catch(e){
          if(logger) logger.error('Bad contoller or operation id for resource ' + messageObj.resource);     
        }
      }else{
        // Log the error.
        var err = '';
        if(! messageObj.trans_id) err += 'Missing trans_id';
        if(logger) logger.error('Could not send message ' + message + ' - ERROR: ' + err);
        send_response(messageObj, {code : 500, message : err}, ws);
      }
    });
  
    ws.on('close', async function close() {
      console.log('disconnected');
    });

    // Ping/Pong
    // Keep the connection alive by pinging every 30 seconds (browser typically close websocket after 60 seconds) 
    // and close broken connections. Set the connection latency.
    ws.isAlive = true;
    ws.on('pong', heartbeat);
    function noop() {}
    function heartbeat() {
      ws.connection_latency = (Math.floor(Date.now()) - ws.connection_ping_tstamp) / 2;
      ws.isAlive = true;
    }
    const intervalId = setInterval(function ping() {
      wss.clients.forEach(function each(ws) {
        // if (ws.isAlive === false){
        //   console.log('disconnecting', ws.userRole);
        //   return ws.terminate();
        // }
        ws.isAlive = false;
        ws.connection_ping_tstamp = Math.floor(Date.now());
        ws.ping(noop);
        // if(logger) logger.debug('ping')
      });
    }, 30000);
  });
}

module.exports.broadcast = function(resource, data) {
  console.log('broadcast', data)
  wss.clients.forEach(function each(ws) {
    var res_msg = { 
      trans_id : uuidv4(),
      action : 'CRT_UPDTD',
      resource : resource,
      response : data
    }
    console.log('== broadcast:', res_msg)
    try{
      ws.send(JSON.stringify(res_msg));
      console.log('== broadcast sent')
    }catch(e){
      if(logger) logger.error('broadcast - ' + JSON.stringify(e, null, ' '));
    }
  });
}

const send_response = (messageObj, data, ws) => {
  var res_msg = { 
    trans_id : messageObj.trans_id,
    action : get_response_action_name(messageObj.action, data),
    resource : messageObj.resource,
    response : data,
    connection_latency : ws.connection_latency,
  }
  console.log('== send_response:', res_msg)
  try{
    ws.send(JSON.stringify(res_msg));
    console.log('== send_response sent')
  }catch(e){
    if(logger) logger.error('send_response - ' + JSON.stringify(e, null, ' '));
  }
}

const get_response_action_name = (action, data) => {
  if(data.code === 200){
    switch(action){
    case 'retrieve':
      return 'RETRIEVED';
    case 'crt_updt':
      return 'CRT_UPDTD';
    case 'delete':
      return 'DELETED';
    case 'patch':
      return 'PATCHED';
    case 'flush':
      return 'FLUSHED';    
    }
  }else{
    switch(action){
    case 'retrieve':
      return 'RETRIEVE_FAIL';
    case 'crt_updt':
      return 'CRT_UPDT_FAIL';
    case 'delete':
      return 'DELETE_FAIL';
    case 'patch':
      return 'PATCH_FAIL';
    case 'flush':
      return 'FLUSH_FAIL';    
    }    
  }
  // It should never get here.
  if(logger) logger.error('get_response_action_name - found unknow action' + action);
  return null;
}
