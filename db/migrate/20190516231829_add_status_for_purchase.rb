class AddStatusForPurchase < ActiveRecord::Migration[5.2]
  def change
  	add_column :purchases, :status, :string
  end
end
