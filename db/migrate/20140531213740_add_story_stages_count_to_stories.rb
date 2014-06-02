class AddStoryStagesCountToStories < ActiveRecord::Migration
  def change
    add_column :stories, :story_stages_count, :integer, :null => false, :default => 0
  end
end
