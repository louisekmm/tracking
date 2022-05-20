class AddLotNumberToInventoryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventory_items, :lot_number, :string
  end
end
