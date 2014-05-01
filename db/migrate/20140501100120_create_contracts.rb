class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :annual_cost
      t.date :start_date
      t.date :expiry_date
      t.boolean :renewable
      t.string :supplier
      t.string :owner
      t.string :owner_email
      t.text :desc

      t.timestamps
    end
  end
end
