class AddAverageTimeToStoryStages < ActiveRecord::Migration
  def change
    add_column :story_stages, :average_time, :integer
  end
end
