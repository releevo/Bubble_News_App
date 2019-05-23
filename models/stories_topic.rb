class StoriesTopic < ActiveRecord::Base
    belongs_to :story
    belongs_to :topic
end