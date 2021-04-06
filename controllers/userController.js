const userModel = require('../models/userModel.js');
const bcrypt = require('bcrypt');
const saltRounds = 10;

// Register a new user
function registerUser(req, res) {
  let user_name = req.body.user_name;
  let user_password = req.body.user_password;
  let returnObj = {};

  if (!user_name || !user_password) {
    returnObj = {
      action: "register user",
      success: false,
      message: "Username and Password are required."
    };
    res.json(returnObj);
  } else {
    bcrypt.hash(user_password, saltRounds, function (err, hash) {
      userModel.createUser(user_name, hash, (result) => {
        if (result == 1) {
          returnObj = {
            action: "register user",
            success: true,
            message: ""
          };
          res.json(returnObj);
        } else {
          returnObj = {
            action: "register user",
            success: false,
            message: "Username already exists."
          };
          res.json(returnObj);
        }
      });
    });
  }
}

// log in with an existing user
function login(req, res) {
  let user_name = req.body.user_name;
  let user_password = req.body.user_password;

  //Is this what they call callback hell? RIP me.
  //query the db for provided username
  userModel.getUserByName(user_name, function (result) {
    let returnObj = {
      action: "login user",
      success: false,
      message: ""
    };

    if (result.length === 0) {
      res.json(returnObj);
    } else {
      let hash = result[0].user_password;
      let user_id = result[0].user_id;

      //if you got a result from the db, check to see if the passwords match
      if (hash) {
        bcrypt.compare(user_password, hash, function (err, result) {
          //if passwords match, return success message, add user_id to session
          if (result) {
            returnObj.success = true;
            returnObj.user = {
              user_name: user_name,
              user_id: user_id
            };
            req.session.user_id = user_id;
            res.json(returnObj);
          } else {
            res.json(returnObj);
          };
        })
      } else {
        res.json(returnObj);
      }
    }
  });
}

function logout(req, res) {
  if (req.session.user_id) {
    req.session.destroy(function (err) {
      if (!err) {
        let returnObj = {
          action: "logout user",
          success: true,
          message: ""
        };
        res.json(returnObj);
      } else {
        let returnObj = {
          action: "logout user",
          success: false,
          message: ""
        };
        res.json(returnObj);
      }
    })
  } else {
    let returnObj = {
      action: "logout user",
      success: false,
      message: "Not logged in."
    };
    res.json(returnObj);
  }
}

module.exports = {
  registerUser: registerUser,
  login: login,
  logout: logout
}