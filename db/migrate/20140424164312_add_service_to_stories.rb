class AddServiceToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :service, index: true
  end
end
