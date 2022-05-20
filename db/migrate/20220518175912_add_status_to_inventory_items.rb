class AddStatusToInventoryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventory_items, :status, :string
  end
end
