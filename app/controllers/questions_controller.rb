get '/questions' do
  @all_questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new', layout: false
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  @user = User.find(@question.user_id)
  erb :'questions/show'
end

post '/questions' do
  Question.create!(params['question'])
  redirect to '/questions'
end
