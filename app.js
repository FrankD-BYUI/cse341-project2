const express = require('express');
const path = require('path');
require('dotenv').config();
const PORT = process.env.PORT;
const authorController = require('./controllers/authorController.js');
const bookController = require('./controllers/bookController.js');

const connectionString = process.env.DATABASE_URL;
const {
  Pool
} = require('pg');
const getAuthor = require('./models/authorModel.js');
const pool = new Pool({
  connectionString: connectionString
});

express()
  .use(express.static(path.join(__dirname, 'public')))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => {
    res.render('home');
  })
  .get('/author/search/:q', authorController.getAuthorsList)
  .get('/author/id/:id', authorController.getAuthor)
  .get('/author', authorController.getAllAuthors)
  .get('/book/search/:q', bookController.searchBooks)
  .get('/book/id/:id', bookController.getBookById)
  .get('/book/authorid/:id', bookController.getBooksByAuthorId)
  .get('/book', bookController.getAllBooks)
  .listen(PORT, () => console.log(`Listening on ${ PORT }`));