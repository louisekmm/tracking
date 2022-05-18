class CreateInventoryitems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventoryitems do |t|
      t.integer :instock_qty
      t.integer :incoming_qty
      t.integer :reserved_qty
      t.integer :min_instock_qty
      t.integer :max_instock_qty
      t.date :expiration_date
      t.string :size
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
