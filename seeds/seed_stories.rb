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

5.times do
  story = Story.new
  story.title = "test story title"
  story.creator_id = 1
  story.time_created = Time.now.strftime("%d/%m/%Y %H:%M")
  story.save

  article = Article.new
  article.title = "Nam interdum odio at tortor pharetra, vitae imperdiet mauris sagittis."
  article.article_url = "https://www.google.com"
  article.article_description = "Praesent varius, ligula nec scelerisque iaculis, dui massa elementum velit, ut sodales lorem lacus in eros. Nulla tempus accumsan massa, non hendrerit turpis rutrum ut. In efficitur, sem ut fermentum consectetur, mi enim finibus ex, sit amet tincidunt neque lectus at ex."
  article.image_url = "https://via.placeholder.com/600"
  article.user_id = 1
  article.original_side = true
  article.save
  
  stories_article = StoriesArticle.new
  stories_article.article_id = article.id
  stories_article.story_id = story.id
  stories_article.save
end