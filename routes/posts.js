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
		res.render('page', { postdata: data, auth_id: req.params.authorid, p_id: req.params.postid });
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
router.post('/submit_comment', (req, res) => {
	const body = req.body;
	console.log(body)
	res.send(body)
	/*const postid = req.body.postid;
	const name = req.body.comment_name;
	const email = req.body.comment_email;
	const message = req.body.comment_msg
	const sql = `INSERT INTO comments (comment_post_id, comment_name, comment_email, comment_body) VALUES("${postid}", "${name}", "${email}", "${message}")`;
	conn.query(sql, (err, result) => {
		if (err){
			throw err;
		}

		res.json({feedback: "Comments added"});
	});*/
});
router.get('/comments/:postid', (req, res) => {
	const sql = `SELECT * FROM comments WHERE comment_post_id = ${req.params.postid}`
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		res.send(data);
	});
});
module.exports = router;
