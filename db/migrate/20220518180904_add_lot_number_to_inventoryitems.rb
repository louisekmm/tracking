class AddLotNumberToInventoryitems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventoryitems, :lot_number, :string
  end
end
