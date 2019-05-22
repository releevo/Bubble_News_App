require 'pry'
require_relative 'db_config'

require_relative 'models/vote.rb'
require_relative 'models/discussion.rb'
require_relative 'models/article.rb'
require_relative 'models/user.rb'
require_relative 'models/topic.rb'
require_relative 'models/story.rb'
require_relative 'models/story_topic.rb'
require_relative 'models/story_article.rb'
require_relative 'models/notification.rb'

test_users = [
  {
    :display_name => 'Milo',
    :avatar =>'http://via.placeholder.com/100',
    :email => 'milo@test.com',
    :password => '123'
  },
  {
    :display_name => 'Roisin',
    :avatar => 'http://via.placeholder.com/100',
    :email => 'roisin@test.com',
    :password => '123'
  },
  {
    :display_name => 'Alan',
    :avatar => 'http://via.placeholder.com/100',
    :email => 'alan@test.com',
    :password => '123'
  }
]

test_users.each do |test_user|
  user = User.new
  user.display_name = test_user[:display_name]
  user.avatar = test_user[:avatar]
  user.email = test_user[:email]
  user.password = test_user[:password]
  user.save

  story = Story.new
  story.title = 'Testing Story Title'
  story.creator_id = user.id
  story.save
  article = Article.new
  article.title = 'Testing story original article'
  article.article_url = 'https://www.theguardian.com/business/2019/may/22/fed-up-queensland-premier-calls-for-adani-coalmine-approvals-timeline-this-week'
  article.article_description = 'Annastacia Palaszczuk says state ‘needs some certainty’ about timing of outstanding approvals'
  article.image_url = 'https://i.guim.co.uk/img/media/fd139241e8266534df1a447c5b720d399418474f/0_27_3000_1800/master/3000.jpg?width=620&quality=45&auto=format&fit=max&dpr=2&s=57f92c28367538202df420af633a6250'
  article.user_id = user.id
  article.save
  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = story.id
  stories_article.original_side = true
  stories_article.save

  discussion = Discussion.new
  discussion.content = 'Lorem ipsum dolor sit amet, consectetur adipisicingelit, sed do eiusmod tempor incididunt ut labore et.'
  discussion.user_id = user.id
  discussion.story_id = story.id
  discussion.save
end
  