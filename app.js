const express = require('express');
//const mysql = require('mysql');
const bodyParser = require('body-parser');
const fileUpload = require('express-fileupload');
const cookieParser = require('cookie-parser');
const sessions = require('express-session');
const app = express();
const port = 80;
const path = require('path');
const postRoutes = require('./routes/posts.js');
const oneDay = 1000 * 60 * 60 * 24;
app.set('view engine', 'ejs');
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, 'statics')));
app.use(fileUpload());
//session middleware
app.use(sessions({
	secret: '15AGcuVuTN',
	saveUninitialized: true,
	cookie: {maxAge: oneDay},
	resave: false
}));
app.use(cookieParser());
app.use('/', postRoutes);
app.use('/pages', postRoutes);
app.use('/fetch_posts', postRoutes);
app.use('/about', postRoutes);
app.use('/submit_comment', postRoutes);
app.listen(port, () => {
	console.log(`server running on port ${port}`)
});
module.exports = app;
