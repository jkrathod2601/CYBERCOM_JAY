const http=require("http");

const server=http.createServer((req,res)=>{
    res.end("data get");
})

server.listen(3000,()=>{
    console.log("connected successfully")
})
