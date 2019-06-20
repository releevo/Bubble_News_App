class Topic < ActiveRecord::Base
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :story, class_name: 'Story', foreign_key: 'story_id'
    # belongs_to :story_title, class_name: 'StoriesArticle', foreign_key: 'story_id'  
    # belongs_to :story_vote, class_name: 'Vote', foreign_key: 'story_id'

    has_many :stories_topics
    has_many :stories, through: :stories_topics

    def story_with_most_votes
			story_votes = stories.map { |story|
				story_articles = story.stories_articles
				{
						story: story,
						votes: story_articles.first.article.vote_count + story_articles.last.article.vote_count
				}
			}.sort_by { |story|
				story[:votes]
			}
			story_votes.empty? ? false  : story_votes.last[:story]
    end

    def story_most_votes_articles
				if self.stories_topics == []
					"Error: there are no stories for this topic." # error handling code goes here
				else 
					self.story_with_most_votes.stories_articles
				end
    end

		def story_most_votes_article
			if self.stories_topics == []
				"Error: there are no stories for this topic." # error handling code goes here
			else
				self.story_with_most_votes.stories_articles.first.article
			end
    end

end
