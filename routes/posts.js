const express = require('express');
const conn = require('../database.js');
const router = express.Router();
router.get('/', (req, res) => {
        const sql = "SELECT *, author_firstname FROM posts INNER JOIN authors ON posts.author_id = authors.author_id";
        conn.query(sql, (err, rows) => {
                if (err) {
                        throw err;
                }
        res.render('index', { postData: rows });
        });
});
router.get('/pages/:postid/:authorid', (req, res) => {
	const sql = `SELECT *, author_firstname FROM posts INNER JOIN authors ON posts.author_id = authors.author_id WHERE post_id = ${req.params.postid}`
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		//console.log(data);
		res.render('page', { postdata: data, auth_id: req.params.authorid });
	});
});
router.get('/fetch_posts/:authorid', (req, res) => {
	const sql = `SELECT *, author_bio FROM posts INNER JOIN authors ON posts.author_id = authors.author_id WHERE authors.author_id = ${req.params.authorid}`;
	conn.query(sql, (err, data) => {
		if(err) {
			throw err;
		}
		res.send(data);
	});
});
router.get('/about/:authorid', (req, res) => {
	const sql = `SELECT * FROM authors WHERE author_id = ${req.params.authorid}`;
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		res.send(data);
	});
});
module.exports = router;
