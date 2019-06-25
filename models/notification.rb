class Notification < ActiveRecord::Base
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :sender_story, class_name: 'Story', foreign_key: 'story_id'

    def article_title
      story_article_record = StoriesArticle.where(story_id: self.story_id)
      initial_article = Article.find(story_article_record[0].article_id)
      article_title = initial_article.title
      return article_title
    end

end
