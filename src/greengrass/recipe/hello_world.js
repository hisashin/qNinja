var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello Greengrass\n');
}).listen(80, '127.0.0.1'); 
