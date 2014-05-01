class SwitchRoleAndAndName < ActiveRecord::Migration
  def change
    rename_column :people, :role, :name
    add_column :people, :role, :string
  end
end
