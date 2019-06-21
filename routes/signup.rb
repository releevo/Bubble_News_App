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

  topic_ids = params[:topics_of_interest].map{|topic| Topic.find_by(name: "#{topic}").id}

  topic_ids.each do |topic_id|
    users_topic = UsersTopic.new
    users_topic.topic_id = topic_id
    users_topic.user_id = user.id
    users_topic.save
  end

  erb :login
end