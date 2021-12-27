var express = require('express');
var app = express.Router();
const name ="arun";
const middlename = "kumar";
const lastname ="reddy";


app.get("/",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`GET request at /, ${name}`);
})

app.post("/",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Post request at /, ${name}`);
})

app.get("/first",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`GET request at /first, ${middlename}`);
})

app.post("/first",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Post request at /first, ${middlename}`);
})

app.put("/first",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`PUT request at /first, ${middlename}`);
})

app.delete("/first",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Delete  request at /first, ${middlename}`);
})


app.get("/second",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`GET request at /second, ${lastname}`);
})

app.post("/second",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Post request at /second, ${lastname}`);
})

app.put("/second",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`PUT request at /second, ${lastname}`);
})

app.delete("/second",function(req,res){
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Delete  request at /second, ${lastname}`);
})

module.exports = app;