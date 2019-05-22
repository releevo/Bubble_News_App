# add story

get '/new' do
  erb :new
end

post '/new' do
  story = Story.new
  story.title = params[:story_title]
  
  # story.creator_id = current_user.id
  
  story.save

  topic = Topic.new
  topic.name = params[:chosen_topics]

  # topic.user_id = current_user.id

  topic.story_id = story.id
  topic.save


  #these params need to be updated as per the URL search Alan
  article = Article.new
  article.title = params[:article_title]
  article.article_url = params[:article_url]
  article.article_description = params[:article_description]
  article.image_url = params[:article_image_url]
  
  # article.user_id = current_user.id

  article.save

  
  # stories_article = StoriesArticle.new
  # stories_article.article_id = article.id
  # stories_article.story_id = story.id
  # stories_article.original_side = true
  # stories_article.save
  
  erb :new
end