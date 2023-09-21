const express = require('express');
const conn = require('../database.js')
const router = express.Router();
router.get('/', (req, res) =>
