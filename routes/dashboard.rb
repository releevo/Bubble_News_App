# dashboard

get '/users/:id' do
  # redirect '/login' unless logged_in?
  @notifications = Notification.where(receiver_id: 1)
  erb :users
end

delete '/notifications/:id' do
  notification = Notification.find(params[:id])
  notification.delete
  redirect '/users'
end

#Need to add current_user.id

# session[:user_id]
# find_by - only finds the first one like querySelector