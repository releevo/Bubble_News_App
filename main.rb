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

enable :sessions

helpers do

  def current_user
  end

  def logged_in?
    !!current_user
  end

end