
// load the things we need
var express = require('express');
var app = express();
var path = require('path');
var session = require('express-session');
var bodyParser = require('body-parser');

var port = process.env.PORT || 3000;

app.use(express.static('public'));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public'))); // Public mappens adgang
app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 5 * 60 * 1000 } // 5 minutter
}));

// set the view engine to ejs
app.set('port', port);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

require('./routes/allroutes')(app);

require('./routes/login')(app);
require('./routes/admin')(app);

app.listen(port);
console.log('3000 is the magic port');
