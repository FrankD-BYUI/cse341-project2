const express = require('express');
const path = require('path');
const session = require('express-session');
require('dotenv').config();
const PORT = process.env.PORT;
const authorController = require('./controllers/authorController.js');
const bookController = require('./controllers/bookController.js');
const userController = require('./controllers/userController.js');

express()
  .use(express.static(path.join(__dirname, 'public')))
  .use(express.urlencoded({
    extended: true
  }))
  .use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true
  }))
  .set('views', path.join(__dirname, 'views'))
  .set('view engine', 'ejs')
  .get('/', (req, res) => {
    res.render('home');
  })
  .get('/author/search/:q', authorController.getAuthorsList)
  .get('/author/id/:id', authorController.getAuthor)
  .get('/author/count', authorController.getAuthorCount)
  .get('/author', authorController.getAllAuthors)
  .get('/book/search/:q', bookController.searchBooks)
  .get('/book/id/:id', bookController.getBookById)
  .get('/book/authorid/:id', bookController.getBooksByAuthorId)
  .get('/book/count', bookController.getBookCount)
  .get('/book', bookController.getAllBooks)
  .post('/user/register', userController.registerUser)
  .post('/user/login', userController.login)
  .post('/user/logout', userController.logout)
  .listen(PORT, () => console.log(`Listening on ${ PORT }`));