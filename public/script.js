$(document).ready(function() {
  renderHome();
})

function renderHome() {
  //alert("renderHome");
  $("#content-div").empty();
  $("#content-div").append("<h2>Loading...</h2>");
  $("#content-div").removeClass();
  $("#content-div").addClass("home-content");
  $.get("./book", function(data) {
    console.log(data);
    $("#content-div").empty();
    for (i=0; i<8; i++) {
      let $newDiv = $("<div class = 'book-card'></div>");
      $newDiv.append("<h2>" + data.result[i].book_title + "</h2>");
      $newDiv.append("<span>By: " + data.result[i].author_id + "</span>");
      $newDiv.append("<span> | </span>");
      $newDiv.append("<span>Rating: " + data.result[i].book_rating + "</span>");
      $newDiv.append("<span> | </span>");
      $newDiv.append("<span>Published: " + data.result[i].book_pubdate + "</span>");
      $newDiv.append("<p>" + data.result[i].book_description.slice(0, 100) + "... </p>");
      $("#content-div").append($newDiv);
    }
  })

}
