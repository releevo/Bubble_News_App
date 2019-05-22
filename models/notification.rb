class Notification < ActiveRecord::Base
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :sender_story, class_name: 'Story', foreign_key: 'story_id'
    belongs_to :sender_article, class_name: 'Article', foreign_key: 'article_id'
end
