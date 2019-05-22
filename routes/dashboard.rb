# dashboard

get '/users/:id' do
  redirect '/login' unless logged_in?
  redirect '/' unless current_user.id == 
  @notifications = Notification.where(receiver_id: current_user.id)
  erb :users
end

delete '/notifications/:id' do
  notification = Notification.find(params[:id])
  notification.delete
  redirect "/users/#{current_user.id}"
end

# find_by - only finds the first one like querySelector

redirect '/profiles' unless current_user.id == @profile.id
