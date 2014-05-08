class AddNetworkToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :network, :string
  end
end
