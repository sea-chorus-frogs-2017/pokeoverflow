
get '/questions/:commentable_id/comments/new' do
  @question_id = params[:commentable_id]
  erb :'comments/new'
end

# The resource is comment hence COMMENTS CONTROLLER
post '/questions/:commentable_id/comments' do
  new_comment = Comment.create!(content: params['content'],
    commentable_id: params[:commentable_id],
    user_id: session[:user_id],
    commentable_type: "Question")
  new_comment.content
end

# Todo: determine restful routing for comments
get '/answers/:answer_id/comments/new' do
  @answer_id = params[:answer_id]
  erb :'comments/new', layout: false
end

post '/answers/:answer_id/comments' do
  @user = User.find(session[:user_id])
  # p params
  @new_comment = Comment.create!(
    content: params[:content],
    user_id: @user.id,
    commentable_id: params[:answer_id],
    commentable_type: "Answer"
    )
  erb :'/comments/show', layout: false
end