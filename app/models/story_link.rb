class StoryLink < ActiveRecord::Base
  belongs_to :from, :class_name => "Story"
  belongs_to :to, :class_name => "Story"
end
