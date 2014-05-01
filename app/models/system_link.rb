class SystemLink < ActiveRecord::Base
  belongs_to :system_a, class_name: "System"
  belongs_to :system_b, class_name: "System"

  def graph_json
    {:source => "System_#{self.system_a.id}", :target => "System_#{self.system_b.id}", :type => 'system_link', :id => self.id, :url => Rails.application.routes.url_helpers.system_link_path(self)}
  end

  def story_stages
    StoryStage.where("from_type = ? AND to_type = ? AND from_id IN (?) AND to_id IN (?)", "System", "System", [system_a_id, system_b_id], [system_a_id, system_b_id])
  end
end
