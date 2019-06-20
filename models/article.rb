class Article < ActiveRecord::Base
  has_many :stories_articles

  def vote_count
    Vote.where(article_id: self.id).count
  end
  
end