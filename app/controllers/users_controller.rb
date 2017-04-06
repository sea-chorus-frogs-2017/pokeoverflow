get '/users' do
  # This is the page that displays all users
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  User.create(params[:user])
  redirect to '/users'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
