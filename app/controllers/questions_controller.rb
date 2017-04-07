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
  new_question = Question.create!(params['question'])
  erb :'partials/_questiontitle', layout: false, locals: {question: new_question}
end

