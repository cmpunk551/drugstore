class RenameColumnInPurchaseMedicine < ActiveRecord::Migration[5.2]
  def change
  	remove_column :purchase_medicines, :order
  	add_reference :purchase_medicines, :purchases, foreign_key: true
  end
end
