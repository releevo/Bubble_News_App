# homepage

get '/' do
  @topics = Topic.all
  erb :index
end


