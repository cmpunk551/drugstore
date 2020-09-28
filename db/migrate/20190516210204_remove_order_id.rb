class RemoveOrderId < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :purchase_medicines, :order, index:true, foreign_key: true
  end
end
