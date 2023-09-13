const express = require('express');
const app = express()
const port = 3000
const path = require('path')
app.use(express.static('statics'));
app.get('/', (req, res) => {
	res.sendFile(path.join(__dirname, '/index.html'));
});
app.listen(port, () => {
	console.log(`server running on port ${port}`)
});
