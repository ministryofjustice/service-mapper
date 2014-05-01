class AddOwnerEmailToServices < ActiveRecord::Migration
  def change
    add_column :services, :owner_email, :string
  end
end
