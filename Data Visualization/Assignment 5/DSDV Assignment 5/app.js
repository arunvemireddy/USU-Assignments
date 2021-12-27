const express = require('express');
const app = express();
const port = 3000;
const dataVis = require('./dataVis');
const arunRoute = require('./arunRouter');

app.use('/dataVis', dataVis);
// TODO: Add your own router
app.use('/vemireddy', arunRoute);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));