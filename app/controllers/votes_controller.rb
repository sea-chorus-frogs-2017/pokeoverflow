# Displaying Votes:
  # Using the _questiontitle partial which I've gone ahead and renamed to _questioninfo
  # Vote VALUE for the question can be placed next to the question
  # (If you look at Stackoverflow it just shows the votes on the question + number of answers)

# For jQUERY & AJAX
  # Refer to Hacker news
  # Consider using .one to only allow a single click action.

# Following Hacker News Convention of voting
post '/questions/:voteable_id/vote' do
  question = Question.find(params[:voteable_id])
  question.votes.create(value:1)
end

# As far as down-voting I'm thinking we'll have to either remove or destroy a vote value?
post '/questions/:voteable_id/vote' do
  question = Question.find(params[:voteable_id])
  question.votes.destroy(value:1)
end
