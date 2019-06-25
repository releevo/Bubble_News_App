# complete story

get '/stories/:id/edit' do
  if params[:notice]
    notice = Notification.find(params[:notice])
    if current_user.id == notice.receiver_id
      notice.seen = true
      notice.save
    end
    erb :edit
  else
    erb :edit
  end
end

# do not create story here, find existing story here
post '/edit' do

  params[:chosen_topics].each do |chosen_topic_id|
    stories_topic = StoriesTopic.new
    stories_topic.topic_id = chosen_topic_id
    stories_topic.story_id = params[:story_id]
    stories_topic.save
  end

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
  stories_article.save
  
  content_type :json
  {
    redirect: true,
    redirect_url: "/stories/#{params[:story_id]}"
  }.to_json
  
end