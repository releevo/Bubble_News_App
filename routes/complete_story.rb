# complete story

get '/stories/:id/edit' do
  erb :edit
end

# do not create story here, find existing story here
post '/edit' do

  # story = Story.new
  # story.title = Story.find_by(id: params[:story_id]).title
  # story.creator_id = Story.find_by(id: params[:story_id]).creator_id
  # story.save

  # topic = Topic.new
  # topic.name = params[:chosen_topics]
  # topic.user_id = current_user.id
  # topic.story_id = params[:story_id]    
  # topic.save

  article = Article.new
  article.title = params[:article_title]
  article.article_url = params[:article_url]
  article.article_description = params[:article_description]
  article.image_url = params[:article_image_url]
  article.user_id = current_user.id
  article.save

  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = params[:story_id]     
  stories_article.original_side = true
  stories_article.contributor_id = current_user.id
  stories_article.save
  
  content_type :json
  {
    redirect: true,
    redirect_url: "/stories/#{params[:story_id]}"
  }.to_json
  
end