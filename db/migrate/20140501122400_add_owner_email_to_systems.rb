class AddOwnerEmailToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :owner_email, :string
  end
end
