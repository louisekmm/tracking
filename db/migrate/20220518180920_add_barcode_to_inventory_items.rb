class AddBarcodeToInventoryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventory_items, :barcode, :string
  end
end
