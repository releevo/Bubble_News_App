# view story

get '/stories/:id' do
  @story = Story.find(params[:id])
  @story_creator = User.find(@story.creator_id)
  story_articles = @story.stories_articles
  @article_original = story_articles.first.article
  @article_perspective = story_articles.last.article
  @perspective_user = User.find(@article_perspective.user_id)
  @discussions = Discussion.where(story_id: @story.id)
  erb :show
end

post '/discussions' do
  @discussion = Discussion.new
  @discussion.user_id = current_user.id
  @discussion.content = params[:content]
  @discussion.story_id = params[:story_id]
  @discussion.save
  redirect "/stories/#{@discussion.story_id}"
end