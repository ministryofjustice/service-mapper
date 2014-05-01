class System < ActiveRecord::Base
  include GraphNode
  has_many :system_links
  belongs_to :contract
  scope :alphabetical, order("name ASC")

  def graph_json
    {:id => "System_#{self.id}", :name => self.name, :type => 'system', :url => Rails.application.routes.url_helpers.system_path(self)}
  end

  def system_links
    SystemLink.where("system_a_id = ? OR system_b_id = ?", self.id, self.id)
  end
end
