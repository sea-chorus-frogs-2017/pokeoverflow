require 'sinatra/json'
# Displaying Votes:
  # Using the _questiontitle partial which I've gone ahead and renamed to _questioninfo
  # Vote VALUE for the question can be placed next to the question
  # (If you look at Stackoverflow it just shows the votes on the question + number of answers)

# For jQUERY & AJAX
  # Refer to Hacker news
  # Consider using .one to only allow a single click action.

# Following Hacker News Convention of voting
post '/questions/:voteable_id/votes' do
  question_id = Question.find(params[:voteable_id])
  if session[:user_id]
    question_id.votes.create( value: 1, 
                              voteable_id: question_id, 
                              voteable_type: "Question",
                              user_id: session[:user_id])
  end
  question = {
    question_id: question_id,
    votes: question_id.points
  }
  if request.xhr?
    json question
  else
    redirect '/questions'
  end
end

# As far as down-voting I'm thinking we'll have to either remove or destroy a vote value?
delete '/questions/:voteable_id/votes' do
  question = Question.find(params[:voteable_id])
  # need to destroy a vote in the question's votes array
end
