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

  attr_accessor :payload_other
  before_save :check_payload_other
 
  def graph_json
    {:source => self.from_id, :target => self.to_id, :type => 'story_stage', :id => self.id, :url => Rails.application.routes.url_helpers.story_story_stage_path(self.story, self)}
  end

  def self.modes
    ["Email", "Web page", "Phone call", "API", "Paper form", "Face to face", "Application"]
  end

  def previous_stage
    story.story_stages.where("position = ?", self.position - 1).first
  end

  def linked_with_last_stage?
    !!previous_stage && self.from == previous_stage.to
  end

  def check_payload_other
    self.payload = self.payload_other if payload == 'other'
  end
end
