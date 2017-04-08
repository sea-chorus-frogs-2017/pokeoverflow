post '/questions/:question_id/answers' do
  Answer.create(content: params[:submission],
                user_id: session[:user_id],
                question_id: params[:question_id])
  params[:submission]
end
