class AddContactDetailsToTransactions < ActiveRecord::Migration
  def change
    add_column :stories, :contact_email, :string
    add_column :stories, :contact_team, :string
    rename_column :stories, :owner, :contact_name
  end
end
