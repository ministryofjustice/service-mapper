class System < ActiveRecord::Base
  has_many :system_links
  has_many :story_stage_entries, :class_name => 'StoryStage', :as => 'to'
  has_many :story_stage_exits, :class_name => 'StoryStage', :as => 'from'

  scope :alphabetical, order("name ASC")

  def polymorphic_id
    "#{self.class.name}_#{self.id}"
  end

  def story_stages
    (story_stage_entries + story_stage_exits).uniq
  end

  def stories
    story_stages.collect(&:story).uniq
  end

  def graph_json
    {:id => "System_#{self.id}", :name => self.name, :type => 'system', :url => Rails.application.routes.url_helpers.system_path(self)}
  end
end
