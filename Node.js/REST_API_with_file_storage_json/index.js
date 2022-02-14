const express = require('express')
const app = express()
const fs=require('fs')
app.use(express.json())
app.use(express.urlencoded({extended:true}))
const port = 8080

//asyncronus read
// get users
app.get('/user',(req, res) => {
    fs.readFile('./user/data.json','utf8',(err,data) =>{
        if(err) {
            res.status(404).send(err)
            throw "something wrong"
        }
        res.status(200).send(data)
    })
})

//get user by id
app.get('/user/:id',(req, res) => {
    console.log(req.params.id)
    fs.readFile('./user/data.json','utf8',(err,data) =>{
        if(err) {
            res.status(404).send("data not found")
            throw "something wrong"
        }
        let datais=JSON.parse(data)
        if(datais[`user${req.params.id}`]){
            res.status(200).send(datais[`user${req.params.id}`])
        }else{
            res.status(404).send("data not found")
        }
        
    })
})

// update users
app.put("/user/:id", (req, res) => {
  fs.readFile("./user/data.json","utf-8", (err, data) => {
    const datais = JSON.parse(data);
    req.body.id = req.params.id;
    datais[`user${req.params.id}`] = req.body;
    // console.log(req.body.id);
    // console.log(datais);
    fs.writeFileSync("./user/data.json", JSON.stringify(datais));
    res.status(200).send("updated succesfully");
  });
});


//add user
app.post('/user',(req,res)=>{
   fs.readFile('./user/data.json','utf-8',(err,data)=>{
        const datais=JSON.parse(data)
        if(datais[`user${req.body.id}`] !== undefined){
            res.status(404).send("data allready present in database")
        }
        else{
            datais[`user${req.body.id}`]=req.body
            console.log(req.body.id)
            console.log(datais)
            fs.writeFileSync('./user/data.json',JSON.stringify(datais))
            res.status(201).send("updated succesfully")
        }
   })
})

// delete user by id
app.delete('/user/:id',(req,res)=>{
    fs.readFile("./user/data.json","utf-8", (err, data) => {
        const datais = JSON.parse(data);
        if(datais[`user${req.params.id}`]){
            delete datais[`user${req.params.id}`]
            fs.writeFileSync("./user/data.json", JSON.stringify(datais));
            res.status(200).send("updated succesfully");
        }else{
            res.status(204).send("data not found in database")
        }
      });
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})