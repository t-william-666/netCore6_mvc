console.log("learn the node.js");

const http = require("http");
const hostname = "127.0.0.1";
const port = 3000;

const server =http.createServer((req,res)=>{
    req.statusCode=200;
    req.setHeader("Content-type","text/plain");
    req.end("hello world \n");
})

server.listen(port,hostname,()=>{
    console.log(`服务器运行在：http://${hostname}:${port}`)
})