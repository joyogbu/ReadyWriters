const mysql = require('mysql');
const conn = mysql.createConnection({            host: "localhost",                       user: "root",                            password: "15AGcuVuTN",
        database: "ready_writers_db"     });                                      conn.connect((err) => {                          if(err) {                                        console.log(`Error connecting: ${err}`);                                  }                                        console.log("Connected");        })
module.exports = conn;
