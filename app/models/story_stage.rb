class StoryStage < ActiveRecord::Base
  belongs_to :story
  belongs_to :from, polymorphic: true
  belongs_to :to, polymorphic: true
  acts_as_list scope: :story
  scope :ordered, -> { order("position ASC") }
  def to_str
    "#{to_type}_#{to_id}"
  end
  def to_str=(val)
    self.to_type, self.to_id = val.split("_")
  end
  def from_str
    "#{from_type}_#{from_id}"
  end
  def from_str=(val)
    self.from_type, self.from_id = val.split("_")
  end
  def graph_json
    {:source => "#{self.from_type}_#{self.from_id}", :target => "#{self.to_type}_#{self.to_id}", :type => 'story_stage', :id => self.id, :url => Rails.application.routes.url_helpers.service_story_story_stage_path(self.story.service, self.story, self)}
  end
end
