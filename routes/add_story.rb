# add story

get '/new' do
  erb :new
end

post '/new' do
  story = Story.new
  story.title = params[:story_title]
  story.creator_id = current_user.id
  story.time_created = Time.now.strftime("%d/%m/%Y %H:%M")
  story.save

  topic = Topic.new
  topic.name = params[:chosen_topics]
  topic.user_id = current_user.id
  topic.story_id = story.id
  topic.save

  #these params need to be updated as per the URL search Alan
  article = Article.new
  article.title = params[:article_title]
  article.article_url = params[:article_url]
  article.article_description = params[:article_description]
  article.image_url = params[:article_image_url]
  article.user_id = current_user.id
  article.save

  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = story.id
  stories_article.original_side = true
  stories_article.contributor_id = current_user.id
  stories_article.save

  stories_topic = StoriesTopic.new
  stories_topic.topic_id = topic.id
  stories_topic.story_id = story.id
  stories_topic.save


  # get all user ids with a connection
  # limit 10
  # pluck user_id
  # each

  topic_selection = Topic.where.not(user_id: current_user.id).where(name: topic.name).limit(10).pluck(:user_id)
  topic_selection.each do |user_id|
    notification = Notification.new
    notification.sender_id = current_user.id
    notification.receiver_id = user_id
    notification.story_id = story.id
    notification.article_id = article.id
    notification.notification_type = "invite"
    notification.seen = false
    notification.time_created = Time.now
    notification.save
  end

  # erb :index
  # redirect "/stories/#{story.id}"
  content_type :json
  {
    redirect: true,
    redirect_url: "/stories/#{story.id}"
  }.to_json

end