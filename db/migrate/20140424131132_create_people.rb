class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :role
      t.text :description

      t.timestamps
    end
  end
end
