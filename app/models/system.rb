class System < ActiveRecord::Base
  has_many :system_links
  has_many :story_stage_entries, :class_name => 'StoryStage', :as => 'to'
  has_many :story_stage_exits, :class_name => 'StoryStage', :as => 'from'

  scope :alphabetical, order("name ASC")

  def polymorphic_id
    "#{self.class.name}_#{self.id}"
  end
end
