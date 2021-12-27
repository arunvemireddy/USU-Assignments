var express = require('express');
var router = express.Router();
const name ="arun";

router.get('/', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send('Hello Data Vis!')
});

router.post('/', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send('Got a POST request')
});

router.get('/grade', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Got a GET request at /grade, ${name}`)
});

router.post('/grade', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Got a POST request at /grade, ${name}`)
});

router.put('/grade', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Got a PUT request at /grade, ${name}`)
});
router.delete('/grade', function (req, res) {
    res.status(200);
    res.append('Context-Type','text/html');
    res.send(`Got a DELETE request at /grade, ${name}`)
});

module.exports = router;
