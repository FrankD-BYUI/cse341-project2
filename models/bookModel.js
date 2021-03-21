const connectionString = process.env.DATABASE_URL;
const {
  Pool
} = require('pg');
const pool = new Pool({
  connectionString: connectionString
});

function queryBooks(searchTerm, callback) {
  const text = "SELECT book_id, book_title, book_pubdate, book_description, book_rating, books.author_id FROM books JOIN authors ON books.author_id = authors.author_id WHERE book_title ILIKE '%' || $1 || '%' OR book_description ILIKE '%' || $1 || '%' OR author_name ILIKE '%' || $1 || '%'";
  const values = [searchTerm];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      // console.log("Back from DB with result:");
      // console.log(result.rows);

      callback(result.rows);
    }
  });
}

function queryBookById(id, callback) {
  const text = "SELECT book_id, book_title, book_pubdate, book_description, book_rating, author_id FROM books WHERE book_id = $1";
  const values = [id];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      // console.log("Back from DB with result:");
      // console.log(result.rows);

      callback(result.rows);
    }
  })
}

function queryAllBooks(callback) {
  const text = "SELECT book_id, book_title, book_pubdate, book_description, book_rating, author_id FROM books ORDER BY book_rating";
  pool.query(text, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      // console.log("Back from DB with result:");
      // console.log(result.rows);

      callback(result.rows);
    }
  })
}

function queryBooksByAuthorId(authorId, callback) {
  const text = "SELECT book_id, book_title, book_pubdate, book_description, book_rating, author_id FROM books WHERE author_id = $1";
  const values = [authorId];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      // console.log("Back from DB with result:");
      // console.log(result.rows);

      callback(result.rows);
    }
  })
}

module.exports = {
  queryBooks: queryBooks,
  queryBookById: queryBookById,
  queryAllBooks: queryAllBooks,
  queryBooksByAuthorId: queryBooksByAuthorId
}