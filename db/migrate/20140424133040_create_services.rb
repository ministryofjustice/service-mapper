class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :status
      t.string :owner
      t.text :description

      t.timestamps
    end
  end
end
