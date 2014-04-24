class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :owner
      t.string :supplier
      t.text :technology
      t.string :status
      t.string :hosting
      t.string :impact_level

      t.timestamps
    end
  end
end
