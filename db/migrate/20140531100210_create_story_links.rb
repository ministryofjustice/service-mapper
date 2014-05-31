class CreateStoryLinks < ActiveRecord::Migration
  def change
    create_table :story_links do |t|
      t.references :from, index: true
      t.references :to, index: true

      t.timestamps
    end
  end
end
