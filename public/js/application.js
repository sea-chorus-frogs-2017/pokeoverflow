$(document).ready(function() {
  $('#get-question-form').on("click", function(event){
    event.preventDefault();
    $.ajax({
      url: 'questions/new',
      method: 'GET'
    }).done(function(response){
      // alert("HELLOOOO");
      // console.log(response);
      $('#new-question-form').append(response);
    })
  });


});
