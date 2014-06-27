class RenameServicesToGroup < ActiveRecord::Migration
  def up
    remove_column :services, "transaction_volume"
    remove_column :services, "owner_email"
    remove_column :services, "description"
    remove_column :services, "owner"
    remove_column :services, "status"
    rename_table :services, :groups
  end
  def down
    rename_table :groups, :services
    create_column :services, "status", :string
    create_column :services, "owner", :string
    create_column :services, "description", :string
    create_column :services, "owner_email", :string
    create_column :services, "transaction_volume", :integer   
  end
end
