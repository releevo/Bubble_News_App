# signup

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.new
  user.display_name = params[:display_name]
  user.avatar = params[:avatar]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  erb :login
end