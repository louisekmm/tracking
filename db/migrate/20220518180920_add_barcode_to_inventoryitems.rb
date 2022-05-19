class AddBarcodeToInventoryitems < ActiveRecord::Migration[6.1]
  def change
    add_column :inventoryitems, :barcode, :string
  end
end
