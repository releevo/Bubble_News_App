class Notification < ActiveRecord::Base
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :sender_story, class_name: 'Story', foreign_key: 'story_id'
    # belongs_to :sender_article, class_name: 'Article', foreign_key: 'article_id'
    # belongs_to :sender_article_one, class_name: 'StoriesArticle', foreign_key: 'story_id'

    def article_title
      story_article_record = StoriesArticle.where(story_id: self.story_id)
      initial_article = Article.find(story_article_record[0].article_id)
      article_title = initial_article.title
      return article_title
    end

end

# Vote.where(story_id: self.id).count

# doesnt equal the the same column name it equals the foreign key (id in the first column) therefore the above doesnt work.  Need to get the uniq id use where instead of traversing the tables. I have the user id and the story id to get to the article title.  If you do it on user it could be a different article that is linked to them. Do a where to get the info from that table.