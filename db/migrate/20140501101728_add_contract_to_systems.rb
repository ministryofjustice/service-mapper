class AddContractToSystems < ActiveRecord::Migration
  def change
    add_reference :systems, :contract, index: true
  end
end
