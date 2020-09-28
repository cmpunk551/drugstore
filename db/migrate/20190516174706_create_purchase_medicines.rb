class CreatePurchaseMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_medicines do |t|
      t.references :order, foreign_key: true
      t.references :medicine, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
