$(document).ready(function() {
  // Need to change .one to .on to allow multiple questions
  $('#get-question-form').one("click", function(event){
    event.preventDefault();
    $.ajax({
      url: 'questions/new',
      method: 'GET'
    }).done(function(response){
      $('#new-question-form').append(response);
    });
  });

  $('#new-question-form').on("submit", 'form', function(event){
    event.preventDefault();
    var info = $(event.target).serialize();
    $.ajax({
      url: '/questions',
      method: 'POST',
      data: info
    }).done(function(response){
      $('#questions ul').prepend(response);
    });
  });

});
