require 'pry'
require_relative '../db_config'

require_relative '../models/vote.rb'
require_relative '../models/discussion.rb'
require_relative '../models/article.rb'
require_relative '../models/user.rb'
require_relative '../models/topic.rb'
require_relative '../models/story.rb'
require_relative '../models/stories_topic.rb'
require_relative '../models/stories_article.rb'
require_relative '../models/notification.rb'

# set up built-in topics

test_topics = ['Politics', 'Economy', 'Environment', 'Science', 'Culture', 'Sport', 'Society', 'Entertainment']

test_topics.each do |test_topic|
  topic = Topic.new
  topic.name = test_topic
  topic.save
end