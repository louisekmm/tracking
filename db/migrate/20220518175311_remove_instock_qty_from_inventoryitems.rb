class RemoveInstockQtyFromInventoryitems < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventoryitems, :instock_qty, :integer
  end
end
