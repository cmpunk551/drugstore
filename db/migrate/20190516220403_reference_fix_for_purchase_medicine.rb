class ReferenceFixForPurchaseMedicine < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :purchase_medicines, :purchases, index:true, foreign_key: true
  	add_reference :purchase_medicines, :purchase, foreign_key: true
  end
end
