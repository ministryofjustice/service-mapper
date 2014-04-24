class CreateStoryStages < ActiveRecord::Migration
  def change
    create_table :story_stages do |t|
      t.references :story, index: true
      t.references :from, polymorphic: true, index: true
      t.references :to, polymorphic: true, index: true
      t.integer :position
      t.string :payload
      t.text :description

      t.timestamps
    end
  end
end
