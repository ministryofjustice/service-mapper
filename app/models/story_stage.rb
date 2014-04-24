class StoryStage < ActiveRecord::Base
  belongs_to :story
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
  acts_as_list scope: :story
end
