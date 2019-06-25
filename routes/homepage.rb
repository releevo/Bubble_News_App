# homepage

get '/' do
  @topics = Topic.all
  erb :index
end

get '/api' do
  topic = Topic.find(params[:topic_id])
  topic_stories = []
  topic_stories_ids = topic.stories_topics
  topic_stories_ids.each do |topic| 
    topic_stories << Story.find(topic.story_id)
  end
  topic_stories_articles = []
  topic_stories.each do |story|
    topic_stories_articles << story.stories_articles.first.article
  end
  content_type :json
  {
    topic: topic,
    topic_stories: topic_stories,
    topic_stories_articles: topic_stories_articles
  }.to_json
end


# article description
# article