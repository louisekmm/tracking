# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_19_160158) do

  create_table "inventory_items", force: :cascade do |t|
    t.date "expiration_date"
    t.string "size"
    t.integer "product_id", null: false
    t.integer "warehouse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "lot_number"
    t.string "barcode"
    t.index ["product_id"], name: "index_inventory_items_on_product_id"
    t.index ["warehouse_id"], name: "index_inventory_items_on_warehouse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "weight"
    t.float "price"
    t.string "brand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.string "city"
    t.string "province"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "inventory_items", "products"
  add_foreign_key "inventory_items", "warehouses"
end
