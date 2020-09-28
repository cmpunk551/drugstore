class AddSupplyNumber < ActiveRecord::Migration[5.2]
  def change
    add_column :medicines, :supply_number, :integer
  end
end
