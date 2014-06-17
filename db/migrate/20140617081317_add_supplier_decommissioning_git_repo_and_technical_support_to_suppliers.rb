class AddSupplierDecommissioningGitRepoAndTechnicalSupportToSuppliers < ActiveRecord::Migration
  def change
    add_column :systems, :decommissioning, :boolean
    add_column :systems, :source_code_url, :string
    add_column :systems, :technical_support_contact, :string
    remove_column :systems, :impact_level
  end
end
