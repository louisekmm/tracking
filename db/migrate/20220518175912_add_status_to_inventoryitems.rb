class AddStatusToInventoryitems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventoryitems, :status, :string
  end
end
