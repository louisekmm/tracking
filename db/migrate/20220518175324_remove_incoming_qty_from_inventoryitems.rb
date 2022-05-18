class RemoveIncomingQtyFromInventoryitems < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventoryitems, :incoming_qty, :integer
  end
end
