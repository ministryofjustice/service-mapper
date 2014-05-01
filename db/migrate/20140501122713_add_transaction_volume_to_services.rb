class AddTransactionVolumeToServices < ActiveRecord::Migration
  def change
    add_column :services, :transaction_volume, :integer
  end
end
