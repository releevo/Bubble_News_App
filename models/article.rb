class Article < ActiveRecord::Base
  has_many :stories_articles
end