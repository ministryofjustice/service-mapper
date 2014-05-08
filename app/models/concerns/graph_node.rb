module GraphNode
  extend ActiveSupport::Concern

  included do
    has_many :story_stage_entries, :class_name => 'StoryStage', :as => 'to'
    has_many :story_stage_exits, :class_name => 'StoryStage', :as => 'from'
    scope :alphabetical, order("name ASC")
    has_many :comments, :as => :item
  end

  def polymorphic_id
    "#{self.class.name}_#{self.id}"
  end

  def story_stages
    (story_stage_entries + story_stage_exits).uniq
  end

  def stories
    story_stages.collect(&:story).uniq
  end

end