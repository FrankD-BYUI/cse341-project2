$(document).ready(function () {
  renderHome();
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
      $("#content-div").append("<div id='home-head'><h1>Welcome to the Library</h1><p>We have " +
        bookCount.result[0].count + " books on file from " + authorCount.result[0].count +
        " authors!</p></div><div><h2>Please <a href='javascript:renderLogin()'>log in</a> to create a reading list.</h2></div>")
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

$("#searchForm").submit(function (event) {
  event.preventDefault();
  renderSearch($("#q").val());
})

function renderSearch(searchTerm) {
  //alert(searchTerm);
  clearContent();
  $("#content-div").addClass("books-content");
  $.get(`./book/search/${searchTerm}`, function (data) {
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

function renderLogin() {

}

function renderLogout() {

}

function renderRegister() {

}