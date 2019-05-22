# dashboard

get '/users/:id' do
  redirect '/login' unless logged_in?
  @user = User.find(params[:id])
  redirect '/' unless current_user.id == @user.id
  @notifications = Notification.where(receiver_id: current_user.id)
  erb :users
end

delete '/notifications/:id' do
  notification = Notification.find(params[:id])
  notification.delete
  redirect "/users/#{current_user.id}"
end

# find_by - only finds the first one like querySelector
