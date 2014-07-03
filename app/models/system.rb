class System < ActiveRecord::Base
  has_many :story_stage_entries, :class_name => 'StoryStage', :foreign_key => 'to_id'
  has_many :story_stage_exits, :class_name => 'StoryStage', :foreign_key => 'to_id'
  has_many :comments, :as => :item

  scope :alphabetical, -> { order("name ASC") }

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

  def self.permitted_params
    [:owner, :owner_email, :supplier, :technology, :status, :hosting, :name, :description, :contract_id, :network, :decommissioning, :source_code_url, :technical_support_contact, :link, :type, :status]
  end

  def self.types
    ["Web service", "Cloud service", "Server", "Staff user", "Citizen user", "Software"]
  end
end
