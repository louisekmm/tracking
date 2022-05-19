class CreateWarehouseInventoryitems < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouse_inventoryitems do |t|
      t.references :warehouse, null: false, foreign_key: true
      t.references :inventoryitem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
