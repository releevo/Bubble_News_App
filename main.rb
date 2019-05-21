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

# signup

get '/signup' do
  erb :signup
end

# login

get '/login' do
  erb :login
end

# dashboard

get '/users/:id' do
  erb :user
end

# homepage

get '/' do
  erb :index
end

# add story

get '/new' do
  erb :new
end

# view story

get '/stories/:id' do
  erb :show
end

# complete story

get '/stories/:id/edit' do
  erb :edit
end







