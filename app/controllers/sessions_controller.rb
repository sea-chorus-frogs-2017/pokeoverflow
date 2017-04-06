post '/sessions/new' do
  returning_user = params["user"]
  session[:user_id] = returning_user.id
  redirect to "/users/#{returning_user.id}"
end
