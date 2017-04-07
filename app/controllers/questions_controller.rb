get '/questions' do
  @all_questions = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @user = User.find(@question.user_id)
  erb :'questions/show'
end

