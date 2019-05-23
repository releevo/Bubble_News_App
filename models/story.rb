class Story < ActiveRecord::Base
  has_many :stories_articles
  has_many :articles, through: :stories_articles

  def vote_count
    Vote.where(story_id: self.id).count
  end

  # def article_of_most_votes
  #   articles[:id]
  # end
  
  
end

    # articles = Article.where(story_id: story.id)
  #         article = articles.first[:article]


    #   key_article = articles.map { |article| {
    #     if article[:id] == story[:article_id]
    #       article_title: article[:title],
    #       article_description: article[:article_description]
    #     end
    #     }
    #   }
    #   # return key_article