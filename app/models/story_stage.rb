class StoryStage < ActiveRecord::Base
  belongs_to :story
  counter_culture :story
  belongs_to :from, :class_name => "System"
  belongs_to :to, :class_name => "System"

  accepts_nested_attributes_for :from
  accepts_nested_attributes_for :to

  acts_as_list scope: :story
  scope :ordered, -> { order("position ASC") }

  include Chronorails::ChronicAccessors
  chronic_duration_field :average_time
 
  def graph_json
    {:source => self.from_id, :target => self.to_id, :type => 'story_stage', :id => self.id, :url => Rails.application.routes.url_helpers.story_story_stage_path(self.story, self)}
  end

  def self.modes
    ["API", "Web page", "Phone call", "API", "Paper form", "Face to face", "Application"]
  end
end
