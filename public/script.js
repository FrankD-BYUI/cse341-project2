let loggedIn = false;
let user = {};

$(document).ready(function () {
  renderHome();
})

// Add listener to search button
$("#searchForm").submit(function (event) {
  event.preventDefault();
  renderSearch($("#q").val());
})

// prep #content-div for new content
function clearContent() {
  $("#content-div").empty();
  $("#content-div").append("<h1>Loading...</h1>");
  $("#content-div").removeClass();
}

// render the Home View
function renderHome() {
  clearContent();
  $("#content-div").addClass("books-content");
  $.get("./book/count", function (bookCount) {
    $.get("./author/count", function (authorCount) {
      $("#content-div").empty();
      $("#content-div").append("<div id='home-head'></div>");

      $("#home-head").append("<h1>Welcome to the Library</h1>");
      $("#home-head").append("<p>We have " + bookCount.result[0].count + " books on file from " +
        authorCount.result[0].count + " authors!</p>");

      let $newDiv = $("<div></div>")
      if (!loggedIn) {
        $newDiv.append("<h2>Please <a href='javascript:renderLogin()'>log in</a> to create a reading list.</h2>")
      } else {
        $newDiv.append("<h2>Thank you for logging in.</h2>")
      }
      $("#content-div").append($newDiv);
    })
  })
}

// render the books view
function renderBooks() {
  clearContent();
  $("#content-div").addClass("books-content");
  $.get("./book", function (data) {
    $("#content-div").empty();
    for (i = 0; i < 8; i++) {
      let $newDiv = $("<div class = 'card'></div>");
      $newDiv.append("<h2><a href='javascript:renderBook(" + data.result[i].book_id + ")'>" + data.result[i].book_title + "</h2>");
      $newDiv.append("<span>By: <a href='javascript:renderAuthor(" + data.result[i].author_id + ")'>" + data.result[i].author_name + "</a></span>");
      $newDiv.append("<span> | </span>");
      $newDiv.append("<span>Rating: " + data.result[i].book_rating + "</span>");
      $newDiv.append("<span> | </span>");
      $newDiv.append("<span>Published: " + data.result[i].book_pubdate + "</span>");
      $newDiv.append("<p>" + data.result[i].book_description.slice(0, 115) + "... </p>");
      $("#content-div").append($newDiv);
    }
  })
}

// render the authors view
function renderAuthors() {
  clearContent();
  $("#content-div").addClass("authors-content");
  $.get("./author", function (data) {
    $("#content-div").empty();
    for (i = 0; i < 15; i++) {
      let $newDiv = $("<div class = 'card'></div>");
      $newDiv.append("<h2><a href='javascript:renderAuthor(" + data.result[i].author_id + ")'>" + data.result[i].author_name + "</a><h2>");
      $("#content-div").append($newDiv);
    }
  })
}

// render the books view
function renderBook(bookId) {
  clearContent();
  $("#content-div").addClass("book-content");
  $.get(`./book/id/${bookId}`, function (data) {
    $("#content-div").empty();
    $("#content-div").append("<h1>" + data.result[0].book_title + "</h1>");
    $("#content-div").append("<p>Rating: " + data.result[0].book_rating + "</p>");
    $("#content-div").append("<p>Author: <a href='javascript:renderAuthor(" + data.result[0].author_id + ")'>" + data.result[0].author_name + "</a><h2>");
    $("#content-div").append("<p>Published: " + data.result[0].book_pubdate + "</p>");
    $("#content-div").append("<p>" + data.result[0].book_description + "</p>");
  })
}

// render the view for a specific author
function renderAuthor(authorId) {
  clearContent();
  $("#content-div").addClass("author-content");
  $.get(`./author/id/${authorId}`, function (data) {
    $.get(`./book/authorid/${authorId}`, function (books) {
      $("#content-div").empty();
      $("#content-div").append("<h1>" + data.result[0].author_name + "</h1>");
      $("#content-div").append("<p>Date of birth: " + data.result[0].author_dob + "</p>");
      if (data.result[0].author_dod) {
        $("#content-div").append("<p>Date of death: " + data.result[0].author_dod + "</p>");
      }
      $("#content-div").append("<p>Country: " + data.result[0].author_birthcountry + "</p>");
      $("#content-div").append("<br>");
      $("#content-div").append("<h2>Books by this author:</h2>");
      for (i = 0; i < books.result.length; i++) {
        let $newDiv = $("<div class = 'card'></div>");
        $newDiv.append("<h2><a href='javascript:renderBook(" + books.result[i].book_id + ")'>" + books.result[i].book_title + "</h2>");
        $newDiv.append("<span>Rating: " + books.result[i].book_rating + "</span>");
        $newDiv.append("<span> | </span>");
        $newDiv.append("<span>Published: " + books.result[i].book_pubdate + "</span>");
        $("#content-div").append($newDiv);
      }
    })
  })
}

// render search results
function renderSearch(searchTerm) {
  //alert(searchTerm);
  clearContent();
  $("#content-div").addClass("books-content");
  $.get(`./book/search/${searchTerm}`, function (data) {
    $("#content-div").empty();
    if (data.result.length < 1) {
      $("#content-div").append("<h1>No results</h1>")
    } else {
      for (i = 0; i < 8 && i < data.result.length; i++) {
        let $newDiv = $("<div class = 'card'></div>");
        $newDiv.append("<h2><a href='javascript:renderBook(" + data.result[i].book_id + ")'>" + data.result[i].book_title + "</h2>");
        $newDiv.append("<span>By: <a href='javascript:renderAuthor(" + data.result[i].author_id + ")'>" + data.result[i].author_name + "</a></span>");
        $newDiv.append("<span> | </span>");
        $newDiv.append("<span>Rating: " + data.result[i].book_rating + "</span>");
        $newDiv.append("<span> | </span>");
        $newDiv.append("<span>Published: " + data.result[i].book_pubdate + "</span>");
        $newDiv.append("<p>" + data.result[i].book_description.slice(0, 115) + "... </p>");
        $("#content-div").append($newDiv);
      }
    }
  })
}

function renderLogin() {
  clearContent();
  $("#content-div").addClass("login-content");
  $("#content-div").empty();
  $("#content-div").append("<h1>Please log in</h1>")

  let $form = $("<form action='javascript:login();' method='POST' id='loginForm'></form>");
  $form.append("<label for='user_name'>Username: <input type='text' name='user_name' id='user_name' required></label>")
  $form.append("<label for='user_password'>Password: <input type='password' name='user_password' id='user_password' required></label>")
  $form.append("<input type='submit' value='Log in'>")
  $("#content-div").append($form);

  $("#content-div").append("<p>Don't have an account? <button id='register-btn' onclick='renderRegister()'>Register</button></p>");
  $("#content-div").append("<p id='message'></p>");
}

function renderRegister() {
  clearContent();
  $("#content-div").addClass("register-content");
  $("#content-div").empty();
  $("#content-div").append("<h1>Create an account</h1>")

  let $form = $("<form action='javascript:register();' method='POST' id='registerForm'></form>");
  $form.append("<label for='user_name'>Username: <input type='text' name='user_name' id='user_name' required></label>")
  $form.append("<label for='user_password'>Password: <input type='password' name='user_password' id='user_password' required></label>")
  $form.append("<input type='submit' value='Register'>")
  $("#content-div").append($form);

  $("#content-div").append("<p>Already have an account? <button id='register-btn' onclick='renderLogin()'>Log In</button></p>");
  $("#content-div").append("<p id='message'></p>");
}

function login() {
  let user_name = $("#user_name").val();
  let user_password = $("#user_password").val();
  let params = {
    user_name: user_name,
    user_password: user_password
  }

  $.post('./user/login', params, function (result) {
    //console.log(result);
    if (result && result.success) {
      loggedIn = true;
      user = result.user;
      $("#navLogLink").text("Log Out");
      $("#navLogLink").attr("href", "javascript:logout();")
      renderHome();
    } else {
      $("#user_password").val("");
      $("#message").text("Username or password was incorrect.")
    }
  })
}

function logout() {
  $.post('./user/logout', function (result) {
    loggedIn = false;
    user = {};
    $("#navLogLink").text("Log In");
    $("#navLogLink").attr("href", "javascript:renderLogin();")
    renderHome();
  })
}

function register() {
  let user_name = $("#user_name").val();
  let user_password = $("#user_password").val();
  let params = {
    user_name: user_name,
    user_password: user_password
  }

  $.post('./user/register', params, function (result) {
    //console.log(result);
    if (result && result.success) {
      //alert("Very nice!")
      renderLogin();
      $("#message").text("Success! Please log in.")
    } else {
      $("#user_password").val("");
      $("#message").text("Username already exists.")
    }
  })
}