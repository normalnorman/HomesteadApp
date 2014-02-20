var port = (process.env.VCAP_APP_PORT || 3000);
var host = (process.env.VCAP_APP_HOST || 'localhost');
var http = require('http');

http.createServer(function(req,res) {
     res.writeHead(200,{'Content-Type' : 'text/plain'});
     res.end('Hello from Mobile App Services application!');
}).listen(port,host);