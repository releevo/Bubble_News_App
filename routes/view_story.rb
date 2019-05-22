# view story

get '/stories/:id' do
  @story = Story.find(params[:id])
  story_articles = @story.stories_articles
  @article_original = story_articles.first.article
  @article_perspective = story_article.last.article
  erb :show
end