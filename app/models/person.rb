class Person < ActiveRecord::Base
  include GraphNode
  def name
    role
  end
  def polymorphic_id
    "#{self.class.name}_#{self.id}"
  end
  def graph_json
    {:id => "Person_#{self.id}", :name => self.role, :type => 'person', :url => Rails.application.routes.url_helpers.person_path(self)}
  end
end
