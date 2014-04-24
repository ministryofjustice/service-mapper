class AddNameAndDescriptionToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :name, :string
    add_column :systems, :description, :text
  end
end
