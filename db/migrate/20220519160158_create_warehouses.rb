class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.string :zip_code
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
