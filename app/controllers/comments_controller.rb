get '/questions/:commentable_id/comments' do
  @question = Question.find(params[:commentable_id])
  @all_comments = @question.comments
  erb :'comments/index'
end
