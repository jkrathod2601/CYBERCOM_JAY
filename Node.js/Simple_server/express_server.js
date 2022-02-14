const express=require('express');
const app=express()


app.get('/',(req,res)=>{
    res.send("success from express")
})

app.listen(3001,()=>{
    console.log("server start on 3001")
})