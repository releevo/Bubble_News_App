class Story < ActiveRecord::Base
  has_many :stories_articles
  has_many :stories, through: :stories_articles

  def vote_count
    Vote.where(story_id: self.id).count
  end
end
