require 'pry'
require_relative 'db_config'

require_relative 'models/vote.rb'
require_relative 'models/discussion.rb'
require_relative 'models/article.rb'
require_relative 'models/user.rb'
require_relative 'models/topic.rb'
require_relative 'models/story.rb'
require_relative 'models/stories_topic.rb'
require_relative 'models/stories_article.rb'
require_relative 'models/notification.rb'

# set up built-in topics

# test_topics = ['Politics', 'Economy', 'Environment', 'Science', 'Culture', 'Sport', 'Society', 'Entertainment']

# test_topics.each do |test_topic|
#   topic = Topic.new
#   topic.name = test_topic
#   topic.save
# end

# set up users

test_users = [
  {
    :display_name => 'Milo',
    :avatar =>'https://via.placeholder.com/100',
    :email => 'milo@test.com',
    :password => '123',
    :article => {
      :url => 'https://sportslens.com/manchester-united-are-better-than-chelsea/789/',
      :image_url => 'https://sportslens.com/wp-content/uploads/2018/11/psg-napoli-live-stream.jpg',
      :description => 'Manchester United and PSG will lock horns in the Champions League round of 16 next month and in March, and an exciting clash is anticipated given the huge improvements the Red Devils have undergone since interim boss Ole Gunnar Solskjærs arrived.',
      :topic_id => 1
    }
  },
  {
    :display_name => 'Roisin',
    :avatar => 'https://via.placeholder.com/100',
    :email => 'roisin@test.com',
    :password => '123',
    :article => {
      :url => 'http://time.com/5158732/rock-climbing-workout/',
      :image_url => 'https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwij1arf_LLiAhVLbn0KHWdPD_0QjRx6BAgBEAU&url=https%3A%2F%2Fmedium.com%2Fpeak-wellbeing%2Fhow-to-keep-motivated-when-you-think-youre-not-any-good-500ace81644e&psig=AOvVaw06KRz0Zj_0GR0TxK1-PAz-&ust=1558746321316682',
      :description => 'The muscles in your hips and torso strain to hold your lower half against the wall. You arch backward and extend one hand up to clasp the next hold—your thighs and calves burning with the effort of holding you steady and in balance. A moment later, when the tips of your fingers have secured their grip, there’s a wholesale shift in the muscles you call on to maintain your safe purchase on the climbing wall.',
      :topic_id => 6
    }
  },
  {
    :display_name => 'Alan',
    :avatar => 'https://via.placeholder.com/100',
    :email => 'alan@test.com',
    :password => '123',
    :article => {
      :url => 'https://www.theverge.com/2019/5/23/18637836/trump-huawei-ban-explanation-trade-deal-national-security-risk',
      :image_url => 'https://cdn.vox-cdn.com/thumbor/sUzkbv8TRGdJ6gZQx9PYLa8o608=/0x0:5581x3721/1520x1013/filters:focal(2345x1415:3237x2307):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63889825/1151264135.jpg.0.jpg',
      :description => 'Manchester United and PSG will lock horns in the Champions League round of 16 next month and in March, and an exciting clash is anticipated given the huge improvements the Red Devils have undergone since interim boss Ole Gunnar Solskjærs arrived.',
      :topic_id => 6
    }
  }
]

test_users.each do |test_user|
  user = User.new
  user.display_name = test_user[:display_name]
  user.avatar = test_user[:avatar]
  user.email = test_user[:email]
  user.password = test_user[:password]
  user.save
end

users = User.all
users.each_with_index do |user, index|
  test_users.each do |test_user|
    # User creates a story
    story = Story.new
    story.title = 'Something about One of the Topics'
    story.creator_id = user.id
    story.time_created = Time.now
    story.save
    stories_topics = StoriesTopic.new
    stories_topics.topic_id = test_user[:topic_id]
    stories_topics.story_id = story.id
    topic = Topic.new
    topic.story_id = story.id
    topic.name = 'Topic'
    topic.user_id = user.id
    topic.save
    # User adds an article
    article = Article.new
    article.user_id = user.id
    article.title = test_user[:article_url]
    article.article_url = test_user[:article][:url]
    article.article_description = test_user[:article][:description]
    article.image_url = test_user[:article][:image_url]
    article.save
    stories_article = StoriesArticle.new
    stories_article.article_id = article.id
    stories_article.story_id = story.id
    stories_article.original_side = true
    stories_article.save
    # User votes for their article
    vote = Vote.new
    vote.user_id = user.id
    vote.article_id = article.id
    vote.story_id = story.id
    vote.save
    # User sends a notification to next user
    notification = Notification.new
    notification.time_created = Time.now
    notification.story_id = story.id
    notification.article_id = article.id
    notification.sender_id = user.id
    if user != users.last
      notification.receiver_id = user.id + 1
    else
      notification.receiver_id = users.first.id
    end
    notification.seen = false
  end
end








  