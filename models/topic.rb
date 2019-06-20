class Topic < ActiveRecord::Base
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :story, class_name: 'Story', foreign_key: 'story_id'
<<<<<<< a395efdeebd0d00fe1a86f75c9228ceaf3d5a9ef
    # belongs_to :story_title, class_name: 'StoriesArticle', foreign_key: 'story_id'  
    # belongs_to :story_vote, class_name: 'Vote', foreign_key: 'story_id'

    has_many :stories_topics
    has_many :stories, through: :stories_topics

    def story_with_most_votes
        story_votes = stories.map { |story|
            {
                story: story,
                votes: story.vote_count
            }
        }.sort_by { |story|
            story[:votes]
        }
        story_votes.empty? ? false  : story_votes.last[:story]
    end

end

# false
# {title: "no story"}
=======
end
>>>>>>> updated users_topic model with relationships
