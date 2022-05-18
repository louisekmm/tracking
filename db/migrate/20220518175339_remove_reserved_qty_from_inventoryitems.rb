class RemoveReservedQtyFromInventoryitems < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventoryitems, :reserved_qty, :integer
  end
end
