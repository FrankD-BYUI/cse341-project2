const connectionString = process.env.DATABASE_URL;
const {Pool} = require('pg');
const pool = new Pool({connectionString: connectionString});

// Returns a list of all authors
function queryAllAuthors(callback){
  const text = "SELECT author_id, author_name, author_dob, author_dod, author_birthcountry FROM authors";
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

// returns a list of authors with a name matching the search term
function queryAuthorsByName(searchTerm, callback) {
  // "||" is the string concatination thign for postgresql
  const text = "SELECT author_id, author_name, author_dob, author_dod, author_birthcountry FROM authors WHERE author_name ILIKE '%' || $1 || '%'";
  const values = [searchTerm];

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

// returns an author with specified ID
function queryAuthorById(id, callback) {
  // "||" is the string concatination thign for postgresql
  const text = "SELECT author_id, author_name, author_dob, author_dod, author_birthcountry FROM authors WHERE author_id = $1";
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



module.exports = {
  queryAuthorsByName: queryAuthorsByName,
  queryAllAuthors: queryAllAuthors,
  queryAuthorById: queryAuthorById
};