const express = require('express');
const path = require('path');
const PORT = process.env.PORT || 5000;
const connectionString = process.env.DATABASE_URL;
const fs = require('fs');
//const {Client} = require('pg');
//const getAuthor = require('./author_model');
process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

// const { Client } = require('pg');
// const client = new Client();
// client.connect();
// client.query("SELECT * from authors where author_name LIKE '%Gaiman%'", (err, res) => {
//   console.log(err ? err.stack : res.rows);
//   client.end();
// });

express()
  .use(express.static(path.join(__dirname, 'public')))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => {
    res.render('pages/home')
    // console.log("Received a request for /");
    // res.write("This is the root");
    // res.end();
  })
  .get('/test', (req, res) => {
    res.render('pages/tester')
  })
  .get('/authorsearch', (req, res) => {
    const searchTerm = req.query.q;
    res.write("this feature isn't working yet.");
    res.end();
  })
  .listen(PORT, () => console.log(`Listening on ${ PORT }`));