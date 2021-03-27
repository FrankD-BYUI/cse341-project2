const connectionString = process.env.DATABASE_URL;
const {
  Pool
} = require('pg');
const pool = new Pool({
  connectionString: connectionString,
  ssl: {
    rejectUnauthorized: false
  }
});

function queryBooks(searchTerm, callback) {
  const text = "SELECT book_id, book_title, to_char(book_pubdate, 'Mon DD, YYYY') AS book_pubdate, book_description, book_rating, books.author_id, author_name FROM books JOIN authors ON books.author_id = authors.author_id WHERE book_title ILIKE '%' || $1 || '%' OR book_description ILIKE '%' || $1 || '%' OR author_name ILIKE '%' || $1 || '%'";
  const values = [searchTerm];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  });
}

function queryBookById(id, callback) {
  const text = "SELECT book_id, book_title, to_char(book_pubdate, 'Mon DD, YYYY') AS book_pubdate, book_description, book_rating, books.author_id, author_name FROM books JOIN authors ON books.author_id = authors.author_id WHERE book_id = $1";
  const values = [id];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  })
}

function queryAllBooks(callback) {
  const text = "SELECT book_id, book_title, to_char(book_pubdate, 'Mon DD, YYYY') AS book_pubdate, book_description, book_rating, books.author_id, author_name FROM books JOIN authors ON books.author_id = authors.author_id ORDER BY book_rating";
  
  pool.query(text, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  })
}

function queryBooksByAuthorId(authorId, callback) {
  const text = "SELECT book_id, book_title, to_char(book_pubdate, 'Mon DD, YYYY') AS book_pubdate, book_description, book_rating, books.author_id, author_name FROM books JOIN authors ON books.author_id = authors.author_id WHERE books.author_id = $1";
  const values = [authorId];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  })
}

function queryBookCount(callback) {
  const text = "SELECT COUNT(*) AS count from books"
  
  pool.query(text, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  })
}

module.exports = {
  queryBooks: queryBooks,
  queryBookById: queryBookById,
  queryAllBooks: queryAllBooks,
  queryBooksByAuthorId: queryBooksByAuthorId,
  queryBookCount: queryBookCount
}