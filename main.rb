require 'sinatra'
require 'sinatra/reloader' if settings.development?
require 'pry'
require_relative 'db_config'

require_relative 'routes/add_story.rb'
require_relative 'routes/complete_story.rb'
require_relative 'routes/dashboard.rb'
require_relative 'routes/homepage.rb'
require_relative 'routes/login.rb'
require_relative 'routes/signup.rb'
require_relative 'routes/view_story.rb'

require_relative 'models/vote.rb'
require_relative 'models/discussion.rb'
require_relative 'models/article.rb'
require_relative 'models/user.rb'
require_relative 'models/topic.rb'
require_relative 'models/story.rb'
require_relative 'models/story_topic.rb'
require_relative 'models/story_article.rb'
require_relative 'models/notification.rb'

enable :sessions

helpers do

  def current_user
  end

  def logged_in?
    !!current_user
  end

end
