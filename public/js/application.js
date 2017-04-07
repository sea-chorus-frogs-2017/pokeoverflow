$(document).ready(function() {
  $("nav").on('click', "#register", function(event){
    event.preventDefault();
    var button = this;
    $.ajax({
      url: '/users/new',
      method: 'GET'
    }).done(function(response) {
      $("nav").append(response);
      // $(button).prop("disabled", true);
      $(button).toggle();
    });
  });
});
