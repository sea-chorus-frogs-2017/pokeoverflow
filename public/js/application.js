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

  $("#post-an-answer").on("submit", function(event){
    event.preventDefault();
    var content = $('textarea').val();
    var question_id = this.name // this grabs the id of the question
    $.ajax({
      url: '/questions/' + question_id + '/answers',
      method: 'POST',
      data: {submission: content}
    }).done(function(response) {
      $(".answers").append(response); // refactor to make this append a partial
    });
  });

  $("#get-comment-form").one("click", function(e){
    e.preventDefault();
    $("#new-comment-form").show();
  });

  $("#new-comment-form").on("submit", function(e){
    e.preventDefault();
    var question_id = this.name;
    var info = $(event.target).serialize();
    $.ajax({
      url: '/questions/' + question_id + '/comments',
      method: 'POST',
      data: info
    }).done(function(response){
      $('#comments-section').append('<p>' + response + ' - *new*</p>');
    });
  });

  $("#get-edit-profile-form").on("click", function(e){
    e.preventDefault();
    $("#update-profile").show();
  });

  $("#update-profile").on("submit", function(e) {
    e.preventDefault();
    var user_id = this.name;
    var info = $(event.target).serialize();
    $.ajax({
      url: '/users/' + user_id,
      method: 'POST',
      data: info
    }).done(function(response){
      $('#profile-info').replaceWith($(response).find('.profile'))
    });
  });

  $(".answers").on("click", ".upvote", function(e){
    e.preventDefault();
    var answerId = this.name;
    var questionId = $(this).find("button").attr("name")
    $(event.target).prop("disabled", true);
    $.ajax({
      url: '/questions/' + questionId + '/answers/' + answerId + '/votes',
      method: 'POST',
    }).done(function(response){
      $("div[name=" + answerId + "] strong").text(response);
    });
  });

  $(".answers").on("click", ".downvote", function(e){
    e.preventDefault();
    var answerId = this.name;
    var questionId = $(this).find("button").attr("name")
    $(event.target).prop("disabled", true);
    $.ajax({
      url: '/questions/' + questionId + '/answers/' + answerId + '/votes',
      method: 'DELETE',
    }).done(function(response){
      $("div[name=" + answerId + "] strong").text(response);
    });
  });


  $('#questions').on("click", ".up-vote", function(e){
    e.preventDefault();
    var question = $(this).parent();
    var question_id = question.attr("id");
    $(this).prop("disabled", true);
    $.ajax({
      url: '/questions/' + question_id + '/votes',
      method: 'POST',
      data: {
          voteable_id: 'question_id'
      }
    }).done(function(response){
      $(question).find('#vote-value').text(response.votes);
    });
  });

  $('#questions').on("click", ".down-vote", function(e){
    e.preventDefault();
    var question = $(this).parent();
    var question_id = question.attr("id");
    $(this).prop("disabled", true);
    $.ajax({
      url: '/questions/' + question_id + '/votes',
      method: 'DELETE',
      data: {
          voteable_id: 'question_id'
      }
    }).done(function(response){
      $(question).find('#vote-value').text(response);
    });
  });

  $("div.container").on("click", "a.new-comment-answer", function(event){
    event.preventDefault();
    var answerId = this.name
    $("#comment-form-"+answerId).toggle();
    $.ajax({
      url: '/answers/'+answerId+'/comments/new'
    }).done(function(response){
      $("#comment-form-"+answerId).html(response);
    })
  })

  $("div.container").on("click", "button.comment-form-button", function(event){
    console.log("hello!")
    var content = $("form.comment-form").serialize();
    var answerId = this.name
    $.ajax({
      url: '/answers/'+answerId+'/comments',
      type: 'post',
      data: content
    }).done(function(response){
      $("#comment-form-"+answerId).hide();
      $("div.new-comment").html(response);
    })
  })
});
