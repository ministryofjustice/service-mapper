class RemoveComments < ActiveRecord::Migration
  def change
    drop_table "comments" do |t|
      t.integer  "item_id"
      t.string   "item_type"
      t.integer  "user_id"
      t.text     "comment"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
