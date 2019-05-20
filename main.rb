require 'sinatra'
require 'sinatra/reloader' if settings.development?
require 'pry'
require_relative 'db_config'

enable :sessions

helpers do

  def current_user
  end

  def logged_in?
    !!current_user
  end

end


get '/' do
  erb :index
end





