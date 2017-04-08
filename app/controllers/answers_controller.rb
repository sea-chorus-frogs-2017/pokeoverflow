post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  answer = Answer.create(content: params[:submission],
                user_id: session[:user_id],
                question_id: params[:question_id])
  erb :'/questions/_answer', layout: false, :locals => {:question => @question, :answer => answer}
end
