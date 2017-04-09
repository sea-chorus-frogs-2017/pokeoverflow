get '/users' do
  # This is the page that displays all users
  @all_users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new', layout: false
end

post '/users' do
  @user = User.create(params[:user])
  redirect to "/"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users/:id' do
  @user = User.find(session[:user_id])
  @user.update(name: params['user']['name'], username: params['user']['username'])
  redirect to "users/#{session[:user_id]}"
end
