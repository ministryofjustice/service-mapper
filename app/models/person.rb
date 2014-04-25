class Person < ActiveRecord::Base
  has_many :story_stage_entries, :class_name => 'StoryStage', :as => 'to'
  has_many :story_stage_exits, :class_name => 'StoryStage', :as => 'from'
  scope :alphabetical, order("role ASC")
  def name
    role
  end
  def polymorphic_id
    "#{self.class.name}_#{self.id}"
  end
end
