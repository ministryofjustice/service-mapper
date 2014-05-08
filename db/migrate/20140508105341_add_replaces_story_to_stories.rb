class AddReplacesStoryToStories < ActiveRecord::Migration
  def change
    add_reference :stories, :replaces_story, index: true
  end
end
