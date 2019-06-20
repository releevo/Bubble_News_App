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
  
  params[:chosen_topics].each do |chosen_topic_id|
    stories_topic = StoriesTopic.new
    stories_topic.topic_id = chosen_topic_id
    stories_topic.story_id = story.id
    stories_topic.save
  end

  #these params need to be updated as per the URL search Alan
  article = Article.new
  article.title = params[:article_title]
  article.article_url = params[:article_url]
  article.article_description = params[:article_description]
  article.image_url = params[:article_image_url]
  article.user_id = current_user.id
  article.original_side = true
  article.save

  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = story.id
  # stories_article.contributor_id = current_user.id
  stories_article.save

  # get all user ids with a connection
  # limit 10
  # pluck user_id
  # each

  params[:chosen_topics].each do |chosen_topic_to_contact|
    if params[:chosen_topics].length >1
      users_to_notify = UsersTopic.where.not(user_id: current_user.id).where(topic_id: chosen_topic_to_contact).limit(5).pluck(:user_id)
    else 
      users_to_notify = UsersTopic.where.not(user_id: current_user.id).where(topic_id: chosen_topic_to_contact).limit(10).pluck(:user_id)
    end
    users_to_notify.each do |user_id|
      notification = Notification.new
      notification.sender_id = current_user.id
      notification.receiver_id = user_id
      notification.story_id = story.id
      notification.notification_type = "invite"
      notification.seen = false
      notification.time_created = Time.now
      notification.save
    end
  end

  # erb :index
  # redirect "/stories/#{story.id}"
  content_type :json
  {
    redirect: true,
    redirect_url: "/stories/#{story.id}"
  }.to_json

end