class AddLinkToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :link, :string
  end
end
