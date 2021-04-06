// Set up DB pool
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

function createUser(user_name, user_password, callback) {
  const text = "INSERT INTO users (user_name, user_password) VALUES ($1, $2)"
  const values = [user_name, user_password];

  pool.query(text, values, function (err, result) {
    if (err) {
      //console.log(err.stack);
      callback('0');
    } else {
      callback(result.rowCount);
    }
  })

}

function getUserById(user_id, callback) {

}

function getUserByName(user_name, callback) {
  const text = "SELECT user_id, user_name, user_password, user_joindate FROM users where user_name = $1";
  const values = [user_name];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      callback(result.rows);
    }
  })
}

//check to see if a username exists
function userExists(user_name, callback) {
  const text = "SELECT COUNT(*) FROM users WHERE user_name = $1";
  const values = [user_name];

  pool.query(text, values, function (err, result) {
    if (err) {
      console.log(err.stack);
    } else {
      if (result.rows.count == 1) {
        callback(true);
      } else {
        callback(false);
      }
    }
  })
}

module.exports = {
  createUser: createUser,
  getUserById: getUserById,
  getUserByName: getUserByName,
  userExists: userExists
}