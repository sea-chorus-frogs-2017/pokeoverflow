get '/questions' do
  @all_questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new', layout: false
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  @all_comments = @question.comments
  @user = User.find(@question.user_id)
  @answers = Answer.where(question_id: params[:id])
  erb :'questions/show'
end

post '/questions' do
  params['question'][:user_id] = session[:user_id]
  new_question = Question.create!(params['question'])
  erb :'partials/_questiontitle', layout: false, locals: {question: new_question}
end


