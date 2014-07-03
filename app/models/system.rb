class System < ActiveRecord::Base
  has_many :system_links
  belongs_to :contract
  has_many :story_stage_entries, :class_name => 'StoryStage', :as => 'to'
  has_many :story_stage_exits, :class_name => 'StoryStage', :as => 'from'
  has_many :comments, :as => :item

  scope :alphabetical, order("name ASC")

  # Allows us to use type column without setting STI
  self.inheritance_column = nil

  def story_stages
    (story_stage_entries + story_stage_exits).uniq
  end

  def stories
    story_stages.collect(&:story).uniq
  end

  def graph_json
    {:id => "System_#{self.id}", :name => self.name, :type => 'system', :url => Rails.application.routes.url_helpers.system_path(self)}
  end

  def system_links
    SystemLink.where("system_a_id = ? OR system_b_id = ?", self.id, self.id)
  end
end
