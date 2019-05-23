# dashboard
require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

get '/users/:id' do
  redirect '/login' unless logged_in?
  @user = User.find(params[:id])
  redirect '/' unless current_user.id == @user.id
  @notifications = Notification.where(receiver_id: current_user.id)
  erb :users
end

delete '/api/notifications/:id' do
  notification = Notification.find(params[:id])
  notification.delete
end