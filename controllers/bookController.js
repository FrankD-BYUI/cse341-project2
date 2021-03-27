const bookModel = require('../models/bookModel.js');

function searchBooks(req, res) {
  bookModel.queryBooks(decodeURIComponent(req.params.q), (result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getBookById(req, res) {
  bookModel.queryBookById(req.params.id, (result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getAllBooks(req, res) {
  bookModel.queryAllBooks((result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getBooksByAuthorId(req, res) {
  bookModel.queryBooksByAuthorId(req.params.id, (result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getBookCount(req, res) {
  bookModel.queryBookCount((result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

module.exports = {
  searchBooks: searchBooks,
  getBookById: getBookById,
  getAllBooks: getAllBooks,
  getBooksByAuthorId: getBooksByAuthorId,
  getBookCount: getBookCount
}