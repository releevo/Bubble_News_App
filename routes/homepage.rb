# homepage

get '/' do
  @topics = Topic.all

  # @topics.each do |topic|
  #   @topic_story = topic.story_with_most_votes
  #   topic_story_articles = topic_story.stories_articles
  #   @topic_article_original = topic_story_articles.first.article
  # end

  # @politics = Topic.find(1)
  # @politics_story = @politics.story_with_most_votes
  # @politics_story_articles = @politics_story.stories_articles
  # @politics_article_original = @politics_story_articles.first.article
  erb :index
end

#Need to find the highest ranked article and display on home page. This is the sum of two votes. Use relationship.

#Need to get each topic inyp erb

#@story = story where story_id = stories article story_id

#entertainment.story.title

#loop through the topics, retrieve the stories for each topic, retrieve the count of votes for each story

# @politics = Topic.where(name: "Politics")
  # @economy = Topic.where(name: "Economy")
  # @environment = Topic.where(name: "Environment")
  # @science = Topic.where(name: "Sceince")
  # @culture = Topic.where(name: "Culture")
  # @sports = Topic.where(name: "Sport")
  # @society = Topic.where(name: "Society")
  # @entertainment = Topic.where(name: "Entertainment")


