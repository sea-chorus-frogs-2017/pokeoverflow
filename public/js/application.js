$(document).ready(function() {
  $("nav").on('click', "#reg-button", function(event){
    event.preventDefault();
    var button = this;
    $.ajax({
      url: '/users/new',
      method: 'GET'
    }).done(function(response) {
      $("#register").append(response);
      $(button).prop("disabled", true);
    });
  });

  $("nav").on('click', '#login-button', function(event){
    $('#login-form').show();
  });

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
