# add story

get '/new' do
  erb :new
end

post '/new' do
  story = Story.new
  story.title = params[:title]
  creator_id = current_user.id
  story.save
  #these params need to be updated as per the URL search Alan
  article = Article.new
  article.title = params[:title]
  article.article_url = params[:url]
  article.article_description = params[:description]
  article.image_url = params[:url]
  article.user_id = current_user.id
  article.save
  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = story.id
  stories_article.original_side = true
  stories_article.save
  erb :new
end