get '/users' do
  # This is the page that displays all users
  @all_users = User.all
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new', layout: false
end

post '/users' do
  User.create(params[:user])
  redirect to '/users'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
