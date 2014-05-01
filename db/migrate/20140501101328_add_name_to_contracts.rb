class AddNameToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :name, :string
  end
end
