# dashboard

get '/users/:id' do
  redirect '/login' unless logged_in?
  @notifications = Notification.find_by(recevier_id: session[:user_id])
  erb :users
end