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
});
