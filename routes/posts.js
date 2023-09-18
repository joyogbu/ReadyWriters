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
router.get('/pages/:postid', (req, res) => {
	const sql = `SELECT *, author_firstname FROM posts INNER JOIN authors ON posts.author_id = authors.author_id WHERE post_id = ${req.params.postid}`
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		//console.log(data);
		res.render('page', { postdata: data });
	});
});
router.get('/fetch_posts', (req, res) => {
	const sql = `SELECT *, author_bio FROM posts INNER JOIN authors ON posts.author_id = authors.author_id`;
	conn.query(sql, (err, data) => {
		if(err) {
			throw err;
		}
		res.send(data);
	});
});
module.exports = router;
