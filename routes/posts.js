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
module.exports = router;
