class RemoveMinInstockQtyFromInventoryitems < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventoryitems, :min_instock_qty_qty, :integer
  end
end
