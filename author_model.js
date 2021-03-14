process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
const {
  Client
} = require('pg');
const connectionString = process.env.DATABASE_URL;
const client = new Client({
  connectionString: connectionString,
  ssl: {
    rejectUnauthorized: false
  }
});
client.connect();

const getAuthor = function (searchTerm, callback) {
  const text = "SELECT * FROM authors WHERE author_name LIKE '%$1%'";
  const values = [searchTerm];

  client.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      console.log("Back from DB with result:");
      console.log(result.rows);

      //callback(result.rows);
    }
  })
};

module.exports = getAuthor;