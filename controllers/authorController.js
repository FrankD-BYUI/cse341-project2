const authorModel = require('../models/authorModel.js');

function getAuthorsList(req, res) {
  authorModel.queryAuthorsByName(req.params.q, (result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getAuthor(req, res) {
  authorModel.queryAuthorById(req.params.id, (result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

function getAllAuthors(req, res) {
  authorModel.queryAllAuthors((result) => {
    res.json({
      result: result
    });
    res.end();
  });
}

module.exports = {
  getAuthorsList: getAuthorsList,
  getAuthor: getAuthor,
  getAllAuthors: getAllAuthors
};