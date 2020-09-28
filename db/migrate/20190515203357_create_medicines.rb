class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.string :brand
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
