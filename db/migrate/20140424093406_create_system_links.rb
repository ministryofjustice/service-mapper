class CreateSystemLinks < ActiveRecord::Migration
  def change
    create_table :system_links do |t|
      t.references :system_a, index: true
      t.references :system_b, index: true
      t.string :status
      t.string :envelope
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
