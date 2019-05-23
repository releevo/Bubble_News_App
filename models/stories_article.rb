class StoriesArticle < ActiveRecord::Base
  belongs_to :story
  belongs_to :article
  belongs_to :article_title, class_name: 'Article', foreign_key: 'article_id'
end