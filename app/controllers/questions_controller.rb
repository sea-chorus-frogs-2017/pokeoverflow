get '/questions' do
  @all_questions = Question.all
  erb :'questions/index'
end
