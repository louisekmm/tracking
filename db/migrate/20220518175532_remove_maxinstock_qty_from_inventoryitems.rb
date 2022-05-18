class RemoveMaxinstockQtyFromInventoryitems < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventoryitems, :max_instock_qty, :integer
  end
end
