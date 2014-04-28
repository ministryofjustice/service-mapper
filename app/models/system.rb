class System < ActiveRecord::Base
  include GraphNode
  has_many :system_links

  def graph_json
    {:id => "System_#{self.id}", :name => self.name, :type => 'system', :url => Rails.application.routes.url_helpers.system_path(self)}
  end
end
