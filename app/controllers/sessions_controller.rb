post '/sessions/new' do
  @user = User.authenticate(params[:user])
  session[:user_id] = @user.id
  redirect to "/users/#{@user.id}"
end

delete '/sessions' do
  session.clear
  redirect '/'
end
