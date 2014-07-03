class RemoveContracts < ActiveRecord::Migration
  def change
    drop_table "contracts" do |t|
      t.integer  "annual_cost"
      t.date     "start_date"
      t.date     "expiry_date"
      t.boolean  "renewable"
      t.string   "supplier"
      t.string   "owner"
      t.string   "owner_email"
      t.text     "desc"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name"
    end
    remove_column :systems, :contract_id, :integer
  end
end
