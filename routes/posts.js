// required modules
const express = require('express');
const conn = require('../database.js');
//create a router instance
const router = express.Router();
//define route for the index page
router.get('/', (req, res) => {
        const sql = "SELECT *, author_firstname FROM posts INNER JOIN authors ON posts.author_id = authors.author_id WHERE posts.published = 1";
	//execute the query
        conn.query(sql, (err, rows) => {
                if (err) {
                        throw err;
                }
        res.render('index', { postData: rows });
        });
});
//define route to get a page clicked on in the index page based on it id and author id
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
//get all the posts by the same authour
router.get('/fetch_posts/:authorid', (req, res) => {
	const sql = `SELECT *, author_bio FROM posts INNER JOIN authors ON posts.author_id = authors.author_id WHERE authors.author_id = ${req.params.authorid} AND posts.published = 1`;
	conn.query(sql, (err, data) => {
		if(err) {
			throw err;
		}
		res.send(data);
	});
});
//get author bio
router.get('/about/:authorid', (req, res) => {
	const sql = `SELECT * FROM authors WHERE author_id = ${req.params.authorid}`;
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		res.send(data);
	});
});
//submit comments on a post
router.post('/submit_comment', (req, res) => {
	const postid = req.body.postid;
	const name = req.body.comment_name;
	const email = req.body.comment_email;
	const message = req.body.comment_msg
	const sql = `INSERT INTO comments (comment_post_id, comment_name, comment_email, comment_body) VALUES("${postid}", "${name}", "${email}", "${message}")`;
	conn.query(sql, (err, result) => {
		if (err){
			throw err;
		}

		res.send("Comments added");
	});
});
//load available comments for a post when the page loads
router.get('/fetch_comments/:postid', (req, res) => {
	const sql = `SELECT * FROM comments WHERE comment_post_id = ${req.params.postid}`
	conn.query(sql, (err, data) => {
		if (err) {
			throw err;
		}
		res.send(data);
	});
});
//define route for the registration page for new user
router.get('/register', (req, res) => {
	res.render('register')
});
//define route for the user dashboard adter login
router.get('/dashboard', (req, res) => {
	if (req.session.userid) {
		const user = req.session.userid;
		const author = req.session.authorid;
		const thumbnail = req.session.authorimage;
		res.render('dashboard', { userName: user, userId: author, userImage: thumbnail });
	} else {
		res.redirect('/');
	}
});
//define route for the user login page
router.get('/login', (req, res) => {
	res.render('login')
});
//process new user registration
router.post('/register_user', (req, res) => {
	const lastname = req.body.user_lastname;
	const firstname = req.body.user_firstname;
	const email = req.body.user_email;
	const pass = req.body.password;
	const field = req.body.user_category;
	const info = req.body.user_bio;
	if (lastname == "" || firstname == "" || email == "" || pass == "" || field == "" || info == "") {
		return res.send("All fields are required");
	}
	//const img = req.body.bio_image;
	if(!req.files) {
		return res.send('no files selected');
	}
	else {
		const img = req.files.bio_image;
		const img_name = img.name;
		if (img.mimetype !== "image/jpeg" && img.mimetype !== "image/jpg" && img.mimetype !== "image/png") {
			return res.send('image format not supported');
		}
		else {
                        img.mv('statics/images/uploads/author_images/'+img.name, function(err) {
				if (err){
					console.log(err);
					return;
				}
			});
			const sql = `INSERT INTO authors (author_lastname, author_firstname, author_email, author_password, author_field, author_bio, author_image) VALUES("${lastname}", "${firstname}", "${email}", "${pass}", "${field}", "${info}", "${img_name}")`;
			conn.query(sql, (err, data) => {
				if (err) {
					throw err;
				}
				res.send('User added successfully');
			});
		}
	}
});
//process user login and redirect to dashboard
router.post('/login_user', (req, res) => {
	let session;
	const email = req.body.login_email;
	const pass = req.body.login_password;
	if (email == "" || pass == "") {
		return res.send("Please provide login login details");
	}
	const sql = `SELECT * FROM authors WHERE author_email = '${email}' AND author_password = '${pass}'`;
	conn.query(sql, (err, data) => {
		if (err) {
			throw err
		}
		if (data.length < 1) {
			res.redirect('register');
		}
		else {
			username = data[0].author_lastname;
			session = req.session;
			session.userid = username;
			session.authorid = data[0].author_id;
			session.authorimage = data[0].author_image;
			console.log(session)
			res.redirect('dashboard');
		}
	});
});
//logout user
router.get('/logout', (req, res) => {
	req.session.destroy();
	res.redirect('/');
});
//add posts
router.post('/add_post', (req, res) => {
	const id = req.body.post_author_id;
	const title = req.body.post_title;
	//const intro = req.body.post_intro;
	const cat = req.body.post_cat;
	const body = req.body.editor;
	const intro = body.split('.', 1)[0];
	if (title == "" || cat == "" || body == "") {
		return res.send('All fields are required');
	}
	if(!req.files) {
		//return res.send(title)
		return res.send('no files selected');
	}
	else {
		const img = req.files.post_image;
		const img_name = img.name;
		if (img.mimetype !== "image/jpeg" && img.mimetype !== "image/jpg" && img.mimetype !== "image/png") {
			return res.send('image format not supported');
		}
		else {
			img.mv('statics/images/uploads/post_images/'+img.name, function(err) {
				if(err) {
					console.log(err);
					return;
					//return res.send(err);
				}
				let sql;
				if (req.body.submit === 'Publish') {
					sql = `INSERT INTO posts (author_id, post_title, post_intro, post_category, post_image, post_text, published) VALUES("${id}", "${title}", "${intro}", "${cat}", "${img_name}", "${body}", 1)`;
				} else {
					sql = `INSERT INTO posts (author_id, post_title, post_intro, post_category, post_image, post_text) VALUES("${id}", "${title}", "${intro}", "${cat}", "${img_name}", "${body}")`;
				}
				conn.query(sql, (err, data) => {
					if (err) throw err
					return res.send('post added successfully');
				});
			});
		}
		//return res.send('post added');
	}
	//return res.send('files submited');
});
router.get('/saved_posts', (req, res) => {
	const id = req.session.authorid;
	const sql = `SELECT * FROM posts WHERE author_id = "${id}" AND published = 0`;
	conn.query(sql, (err, data) => {
		if (err) throw err;
		res.send(data);
	});
});
module.exports = router;
