const express = require('express');
const path = require('path');
const PORT = process.env.PORT || 5000;
const connectionString = process.env.DATABASE_URL;

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
  .listen(PORT, () => console.log(`Listening on ${ PORT }`));