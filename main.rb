require 'sinatra'
require 'sinatra/reloader' if settings.development?
require 'pry'
require_relative 'db_config'

require_relative 'models/user'

require_relative 'routes/add_story'
require_relative 'routes/complete_story'
require_relative 'routes/dashboard'
require_relative 'routes/homepage'
require_relative 'routes/login'
require_relative 'routes/signup'
require_relative 'routes/view_story'

require_relative 'models/vote'
require_relative 'models/comment'
require_relative 'models/article'
require_relative 'models/topic'
require_relative 'models/story'
require_relative 'models/stories_topic'
require_relative 'models/stories_article'
require_relative 'models/notification'
require_relative 'models/users_topic'

enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

end

# Create Session

post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    # you are good
    session[:user_id] = user.id
    redirect '/'
  else
    # stay there
    erb :login
  end
end

# Delete Session

delete "/session" do
  session[:user_id] = nil
  redirect '/login'
end
