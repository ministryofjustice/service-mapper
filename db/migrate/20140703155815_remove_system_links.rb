class RemoveSystemLinks < ActiveRecord::Migration
  def change
    drop_table "system_links" do |t|
      t.integer  "system_a_id"
      t.integer  "system_b_id"
      t.string   "status"
      t.string   "envelope"
      t.string   "name"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
