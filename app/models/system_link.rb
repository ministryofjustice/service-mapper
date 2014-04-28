class SystemLink < ActiveRecord::Base
  belongs_to :system_a, class_name: "System"
  belongs_to :system_b, class_name: "System"

  def graph_json
    {:source => "System_#{self.system_a.id}", :target => "System_#{self.system_b.id}", :type => 'system_link', :id => self.id}
  end
end
