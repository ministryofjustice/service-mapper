class MergeSystemsAndPeople < ActiveRecord::Migration
  def up
    drop_table :people
    add_column :systems, :role, :string
    add_column :systems, :location, :string
    add_column :systems, :type, :string
    remove_column :story_stages, :from_type
    remove_column :story_stages, :to_type
  end
  def down
    add_column :story_stages, :to_type, :string
    add_column :story_stages, :from_type, :string
    remove_column :systems, :type
    remove_column :systems, :location
    remove_column :systems, :role
    create_table "people", force: true do |t|
      t.string   "name"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "role"
      t.string   "location"
    end
  end
end
