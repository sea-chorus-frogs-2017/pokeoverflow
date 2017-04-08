get 'questions/commentabl id /comment
redirect to questions / comemntable id'

get '/question/:commentable_id/comment/new' do
  Comment.create!()
end

# The resource is comment hence COMMENTS CONTROLLER
post '/questions/:id' do

end

# Todo: determine restful routing for comments
