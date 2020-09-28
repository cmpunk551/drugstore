class AddSuppliersReference < ActiveRecord::Migration[5.2]
  def change
  	add_reference :medicines, :suppliers, foreign_key: true
  end
end
