# view story

# require 'readability'
require 'open-uri'

def readability(url)
  source = open(url).read
  read = Readability::Document.new(source)
  result = {
    :title => read.title,
    :author => read.author,
    :content => read.content,
    :images => read.images,
  }
  return result
end

get '/stories/:id' do
  @story = Story.find(params[:id])
  @story_creator = User.find(@story.creator_id).display_name
  story_articles = @story.stories_articles
  @article_original = story_articles.first.article
  @article_original_title = readability(@article_original.article_url)[:title]
  @article_original_author = readability(@article_original.article_url)[:author]
  @article_original_content = readability(@article_original.article_url)[:content]
  @article_perspective = story_articles.last.article
  @article_perspective_content = readability(@article_perspective.article_url)[:content]
  @votes_original = Vote.where(article_id: @article_original.id).count
  @votes_perspective = Vote.where(article_id: @article_perspective.id).count
  @perspective_user = User.find(@article_perspective.user_id)
  @discussions = Discussion.where(story_id: @story.id)
  erb :show
end

post '/api/votes' do
  if logged_in?
    vote = Vote.new
    vote.article_id = params[:article_Id]
    # vote.story_id = params[:story_id]
    vote.user_id = current_user.id
    vote.save
    content_type :json
    { 
      vote_count: Vote.where(article_id: vote.article_id).count 
    }.to_json
  end
end

post '/discussions' do
  @discussion = Discussion.new
  @discussion.time_created = Time.now
  @discussion.user_id = current_user.id
  @discussion.content = params[:content]
  @discussion.story_id = params[:story_id]
  @discussion.save
  redirect "/stories/#{@discussion.story_id}"
end