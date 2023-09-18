const express = require('express');
//const mysql = require('mysql');
const app = express();
const port = 3000;
const path = require('path');
const postRoutes = require('./routes/posts.js');
/*const conn = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "15AGcuVuTN",
	database: "ready_writers_db"
});
conn.connect((err) => {
	if(err) {
		console.log(`Error connecting: ${err}`);
	}
	console.log("Connected");
})*/
app.set('view engine', 'ejs');
//app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'statics')));
/*app.get('/', (req, res) => {
	const sql = "SELECT * FROM posts";
	conn.query(sql, (err, rows) => {
		if (err) {
			throw err;
		}
	res.render('index', { postData: rows });
	});
});*/
app.use('/', postRoutes);
app.use('/pages', postRoutes);
app.use('/fetch_posts', postRoutes);
app.listen(port, () => {
	console.log(`server running on port ${port}`)
});
module.exports = app;
